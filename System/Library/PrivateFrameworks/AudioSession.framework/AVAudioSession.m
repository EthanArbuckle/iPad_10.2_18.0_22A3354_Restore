@implementation AVAudioSession

- (unsigned)opaqueSessionID
{
  return atomic_load((unsigned int *)-[AVAudioSession atomicImpl](self, "atomicImpl"));
}

- (AVAudioSession)autorelease
{
  AVAudioSession *v2;
  objc_super v4;

  v2 = self;
  if (!self->_impl || -[AVAudioSession sessionType](self, "sessionType") != 1886546285)
  {
    v4.receiver = v2;
    v4.super_class = (Class)AVAudioSession;
    return -[AVAudioSession autorelease](&v4, sel_autorelease);
  }
  return v2;
}

- (AVAudioSession)retain
{
  AVAudioSession *v2;
  objc_super v4;

  v2 = self;
  if (!self->_impl || -[AVAudioSession sessionType](self, "sessionType") != 1886546285)
  {
    v4.receiver = v2;
    v4.super_class = (Class)AVAudioSession;
    return -[AVAudioSession retain](&v4, sel_retain);
  }
  return v2;
}

- (void)release
{
  objc_super v3;

  if (!self->_impl || -[AVAudioSession sessionType](self, "sessionType") != 1886546285)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVAudioSession;
    -[AVAudioSession release](&v3, sel_release);
  }
}

- (unint64_t)sessionType
{
  return *(_QWORD *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 16);
}

- (void)dealloc
{
  as::client::XPCConnection *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *impl;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  objc_super v21;
  _QWORD v22[5];
  std::__shared_weak_count *v23;
  _DWORD *v24;
  std::__shared_weak_count *v25;
  _QWORD v26[3];
  _QWORD *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->_impl || -[AVAudioSession isPrimary](self, "isPrimary"))
    goto LABEL_31;
  v24 = 0;
  v25 = 0;
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  std::shared_ptr<std::function<void ()(void)>>::reset[abi:ne180100]((_QWORD *)(v29[0] + 120));
  std::shared_ptr<as::client::DeviceTimeClient>::operator=[abi:ne180100](&v24, (uint64_t *)(v29[0] + 72));
  if (v28)
    os_unfair_recursive_lock_unlock();
  if (-[AVAudioSession sessionType](self, "sessionType") != 1702392942)
  {
    v3 = (as::client::XPCConnection *)*((_QWORD *)v24 + 7);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3321888768;
    v22[2] = __25__AVAudioSession_dealloc__block_invoke;
    v22[3] = &__block_descriptor_48_ea8_32c65_ZTSNSt3__110shared_ptrIKN2as6client9api_utils14ServerAccessorEEE_e21_v24__0__NSError_8_v16l;
    v22[4] = v24;
    v23 = v25;
    if (v25)
    {
      p_shared_owners = (unint64_t *)&v25->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    v27 = 0;
    v26[0] = &off_1E424F2B0;
    v26[1] = MEMORY[0x1A1AF2038](v22);
    v27 = v26;
    as::client::XPCConnection::message<>(v3, (uint64_t)v26, &v28);
    v6 = v27;
    if (v27 == v26)
    {
      v7 = 4;
      v6 = v26;
    }
    else
    {
      if (!v27)
        goto LABEL_14;
      v7 = 5;
    }
    (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_14:
    GetPendingSessionDestroySet();
    os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int const&>((uint64_t **)&qword_1ECED9B48, v24, v24);
    os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    v8 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::async_proxy(&v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *v24;
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destroySession:reply:", v10, v11);

    objc_autoreleasePoolPop(v8);
    v12 = v30;
    if (v30 == v29)
    {
      v13 = 4;
      v12 = v29;
    }
    else
    {
      if (!v30)
      {
LABEL_19:

        v14 = v23;
        if (v23)
        {
          v15 = (unint64_t *)&v23->__shared_owners_;
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 - 1, v15));
          if (!v16)
          {
            ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
            std::__shared_weak_count::__release_weak(v14);
          }
        }
        goto LABEL_24;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_19;
  }
LABEL_24:
  impl = (char *)self->_impl;
  if (impl)
  {
    AVAudioSessionImpl::~AVAudioSessionImpl((AVAudioSessionImpl *)(impl + 8));
    MEMORY[0x1A1AF1C48](impl, 0x10E0C403B922A47);
  }
  self->_impl = 0;
  v18 = v25;
  if (v25)
  {
    v19 = (unint64_t *)&v25->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
LABEL_31:
  v21.receiver = self;
  v21.super_class = (Class)AVAudioSession;
  -[AVAudioSession dealloc](&v21, sel_dealloc);
}

void __25__AVAudioSession_dealloc__block_invoke(uint64_t a1, void *a2)
{
  as::client *v3;
  as::client *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  as::client *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) != 1935830119)
    {
      v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v3));
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315650;
        v7 = "AVAudioSession_iOS.mm";
        v8 = 1024;
        v9 = 1656;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error from destroySession:. %@", (uint8_t *)&v6, 0x1Cu);
      }
    }
  }
  GetPendingSessionDestroySet();
  os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
  std::__tree<unsigned int>::__erase_unique<unsigned int>((uint64_t)&qword_1ECED9B48, *(unsigned int **)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);

}

+ (id)retrieveSessionWithID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  BOOL v8;
  uint64_t *v9;
  os_unfair_lock_s *v10;
  AVAudioSession *v11;
  os_unfair_lock_s *v12;
  AVAudioSession *v13;
  objc_super v15;
  char v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v16[0] = 1;
  v17 = 3418;
  v18 = a3;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  kdebug_trace();
  GetPendingSessionDestroySet();
  os_unfair_lock_lock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
  v5 = qword_1ECED9B50;
  if (!qword_1ECED9B50)
    goto LABEL_12;
  v6 = &qword_1ECED9B50;
  do
  {
    v7 = *(_DWORD *)(v5 + 28);
    v8 = v7 >= v3;
    if (v7 >= v3)
      v9 = (uint64_t *)v5;
    else
      v9 = (uint64_t *)(v5 + 8);
    if (v8)
      v6 = (uint64_t *)v5;
    v5 = *v9;
  }
  while (*v9);
  if (v6 != &qword_1ECED9B50 && *((_DWORD *)v6 + 7) <= v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    v13 = 0;
  }
  else
  {
LABEL_12:
    os_unfair_lock_unlock((os_unfair_lock_t)&GetPendingSessionDestroySet(void)::sSet);
    v10 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
    avfaudio::SessionMap::LookupSession(v10, v3);
    v11 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v15.receiver = a1;
      v15.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
      v11 = (AVAudioSession *)objc_msgSend(objc_msgSendSuper2(&v15, sel_allocWithZone_, 0), "initWithSessionID:", v3);
      if (v11)
      {
        v12 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
        avfaudio::SessionMap::AddSession(v12, v11, v3);
      }
    }
    v13 = v11;

  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
  return v13;
}

- (BOOL)isPrimary
{
  return -[AVAudioSession sessionType](self, "sessionType") == 1886546285;
}

- (AVAudioSession)initWithSessionID:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  AVAudioSession *v9;
  AVAudioSession *v10;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  as::client *v16;
  NSObject *v17;
  id v18;
  AVAudioSessionImpl **v19;
  uint64_t v20;
  AVAudioSessionImpl **v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  objc_super v31;
  _BYTE v32[24];
  unint64_t v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  id v42;
  void *v43;
  AVAudioSessionImpl *v44[3];
  AVAudioSessionImpl **v45;
  id v46;
  uint64_t v47;

  v3 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x1E0C80C00];
  PerformanceTracker::PerformanceTracker((uint64_t)v32, (uint64_t)"-[AVAudioSession initWithSessionID:]", 0, 1);
  std::mutex::lock(&GetSessionInitMutex(void)::sMutex);
  v5 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
  avfaudio::SessionMap::LookupSession(v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = atomic_load((unint64_t *)(objc_msgSend(v6, "atomicImpl") + 8));
    v33 = v8;
    v9 = v7;

    v10 = v9;
    goto LABEL_3;
  }
  v31.receiver = self;
  v31.super_class = (Class)AVAudioSession;
  v10 = -[AVAudioSession init](&v31, sel_init);
  if (!v10)
    goto LABEL_3;
  v12 = (_QWORD *)operator new();
  *v12 = 0;
  AVAudioSessionImpl::AVAudioSessionImpl((uint64_t)(v12 + 1), v10, 1702392942);
  v10->_impl = v12;
  v29 = 0;
  v30 = 0;
  -[AVAudioSession privateGetGuardOfImplementation](v10, "privateGetGuardOfImplementation");
  AVAudioSessionImpl::setSessionID(v44[0], v3);
  std::shared_ptr<as::client::DeviceTimeClient>::operator=[abi:ne180100](&v29, (uint64_t *)v44[0] + 9);
  if (v43)
    os_unfair_recursive_lock_unlock();
  as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(v29 + 56), &v43);
  v13 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v43);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createProxySession:reply:", v3, v15);

  objc_autoreleasePoolPop(v13);
  if (v46)
  {
    v17 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v16));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = v46;
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioSession_iOS.mm";
      v37 = 1024;
      v38 = 1480;
      v39 = 1024;
      v40 = v3;
      v41 = 2112;
      v42 = v18;
      _os_log_impl(&dword_19EF50000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Creating proxy session failed, session ID = 0x%x, error = %@", buf, 0x22u);

    }
    v34 = 1;

    v19 = v45;
    if (v45 == v44)
    {
      v20 = 4;
      v19 = v44;
    }
    else
    {
      if (!v45)
        goto LABEL_18;
      v20 = 5;
    }
    (*((void (**)(void))*v19 + v20))();
LABEL_18:

    v23 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v25 = __ldaxr(p_shared_owners);
      while (__stlxr(v25 - 1, p_shared_owners));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v10 = 0;
    goto LABEL_3;
  }

  v21 = v45;
  if (v45 == v44)
  {
    v22 = 4;
    v21 = v44;
    goto LABEL_25;
  }
  if (v45)
  {
    v22 = 5;
LABEL_25:
    (*((void (**)(void))*v21 + v22))();
  }

  v26 = v30;
  if (v30)
  {
    v27 = (unint64_t *)&v30->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
LABEL_3:

  std::mutex::unlock(&GetSessionInitMutex(void)::sMutex);
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v32);
  return v10;
}

- (BOOL)setActive:(BOOL)active withOptions:(AVAudioSessionSetActiveOptions)options error:(NSError *)outError
{
  _BOOL8 v7;
  BOOL v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v7 = active;
  -[AVAudioSession accessor](self, "accessor");
  v9 = -[AVAudioSession privateSetActive:withOptions:error:accessor:](self, "privateSetActive:withOptions:error:accessor:", v7, options, outError, &v14);
  v10 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v9;
}

+ (AVAudioSession)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVAudioSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVAudioSession sharedInstance]::onceToken != -1)
    dispatch_once(&+[AVAudioSession sharedInstance]::onceToken, block);
  return (AVAudioSession *)(id)avfaudio::gAVAudioSession;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category withOptions:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  NSString *v7;
  char v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v7 = category;
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:](self, "privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:", v7, 0, -1, options, &v13);
  v8 = FormatNSErrorForReturn();
  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  return v8;
}

- (id)routingContextUID
{
  os_unfair_lock_s **v3;
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  os_unfair_lock_s **v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[0] = 1;
  v15 = 3397;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = v12;
  v4 = (id)*MEMORY[0x1E0D49C00];
  v5 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero_WithAnalytics<NSString * {__strong}>(v3, v4, v5, (uint64_t)"-[AVAudioSession routingContextUID]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E4250BD8;

  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v7;
}

- (AVAudioSessionCategory)category
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3073;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetCategory:](self, "privateGetCategory:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (AVAudioSessionCategory)v3;
}

- (AVAudioSession)initWithSpecification:(id)a3
{
  id v4;
  unint64_t v5;
  AVAudioSession *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  int v15;
  as::client::api_utils *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  _BYTE v29[24];
  uint64_t v30;
  char v31;

  v4 = a3;
  PerformanceTracker::PerformanceTracker((uint64_t)v29, (uint64_t)"-[AVAudioSession initWithSpecification:]", 0, 1);
  std::mutex::lock(&GetSessionInitMutex(void)::sMutex);
  if (objc_msgSend(v4, "sessionType") == 1886546285 && avfaudio::gAVAudioSession)
  {

    v5 = atomic_load((unint64_t *)(objc_msgSend((id)avfaudio::gAVAudioSession, "atomicImpl") + 8));
    v30 = v5;
    v6 = (AVAudioSession *)(id)avfaudio::gAVAudioSession;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)AVAudioSession;
    v6 = -[AVAudioSession init](&v28, sel_init);
    if (v6)
    {
      v7 = (_QWORD *)operator new();
      v8 = objc_msgSend(v4, "sessionType");
      *v7 = 0;
      AVAudioSessionImpl::AVAudioSessionImpl((uint64_t)(v7 + 1), v6, v8);
      v6->_impl = v7;
      -[AVAudioSession privateGetGuardOfImplementation](v6, "privateGetGuardOfImplementation");
      objc_msgSend(v4, "clientIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(v27 + 320);
      *(_QWORD *)(v27 + 320) = v9;

      *(_DWORD *)(v27 + 24) = objc_msgSend(v4, "sourceSessionID");
      v11 = objc_msgSend(v4, "sourceSessionID");
      v12 = v27;
      *(_BYTE *)(v27 + 281) = v11 == -1;
      if (v4)
      {
        objc_msgSend(v4, "clientAuditToken");
        v12 = v27;
      }
      else
      {
        v24 = 0u;
        v25 = 0u;
      }
      v13 = (_OWORD *)(v12 + 284);
      v14 = v25;
      *v13 = v24;
      v13[1] = v14;
      v15 = objc_msgSend(v4, "useCaseIdentifier", (_QWORD)v24);
      *(_DWORD *)(v27 + 336) = v15;
      v16 = (as::client::api_utils *)objc_msgSend(v4, "autoReconnect");
      *(_BYTE *)(v27 + 316) = (_BYTE)v16;
      as::client::api_utils::getCurrentProcessName(v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(v27 + 328);
      *(_QWORD *)(v27 + 328) = v17;

      as::client::KVOManager::markPropertiesDirtyAll(*(as::client::KVOManager **)(v27 + 264));
      v19 = -[AVAudioSession privateCreateSessionInServerUsingXPC:](v6, "privateCreateSessionInServerUsingXPC:", &v26);
      if (v26)
        os_unfair_recursive_lock_unlock();
      if (v19)
      {
        -[AVAudioSession accessor](v6, "accessor");
        if (objc_msgSend(v4, "sessionType") == 1886546285)
          objc_storeStrong((id *)&avfaudio::gAVAudioSession, v6);
        v30 = -[AVAudioSession getCachedOrFromServerReporterID:](v6, "getCachedOrFromServerReporterID:", &v24);
        if (-[AVAudioSession initWithSpecification:]::onceToken != -1)
          dispatch_once(&-[AVAudioSession initWithSpecification:]::onceToken, &__block_literal_global);
        v6 = v6;
        v20 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
        if (*((_QWORD *)&v24 + 1))
        {
          v21 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 - 1, v21));
          if (!v22)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }

      }
      else
      {

        v6 = 0;
        v31 = 1;
      }
    }
  }
  std::mutex::unlock(&GetSessionInitMutex(void)::sMutex);
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v29);

  return v6;
}

- (int64_t)reporterID
{
  int64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3390;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = -[AVAudioSession getCachedOrFromServerReporterID:](self, "getCachedOrFromServerReporterID:", v8);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v3;
}

- (AVAudioSessionMode)mode
{
  NSString *v3;
  NSString *v4;
  __CFString *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3077;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v11, (void *)*MEMORY[0x1E0D49528]);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    TranslateMXModeToAVASModeString(v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3374;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get mode", buf, 0x12u);
    }
    v5 = &stru_1E4250BD8;
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return (AVAudioSessionMode)v5;
}

- (BOOL)setPreferredInputSampleRate:(double)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3412;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49A88], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)preferDecoupledIO:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3410;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49A78], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)subscribeToNotifications:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  AVAudioSession *v19;
  id *v20;
  id v21;
  uint64_t v22;
  char v23[4];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  as::client::cache_util::CacheManager **v33;
  std::__shared_weak_count *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v23[0] = 1;
  v24 = 3396;
  v25 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v26 = 0;
  v27 = 0;
  v28 = 0;
  kdebug_trace();
  if (v21)
  {
    v19 = self;
    v20 = a4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v7 = v21;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, &v33, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v30;
      v22 = *MEMORY[0x1E0D49440];
      v10 = *MEMORY[0x1E0D49430];
      v11 = *MEMORY[0x1E0D49408];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqual:", CFSTR("AVAudioSessionBeaconBudgetChangeNotification"), v19, v20))
          {
            objc_msgSend(v6, "addObject:", v11);
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("AVAudioSessionConcurrentAirPlayAudioPreferenceChangeNotification")))
          {
            objc_msgSend(v6, "addObject:", v10);
          }
          else if (objc_msgSend(v13, "isEqual:", CFSTR("AVAudioSessionRouteControlChangeNotification")))
          {
            objc_msgSend(v6, "addObject:", v22);
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, &v33, 16);
      }
      while (v8);
    }

    self = v19;
  }
  else
  {
    v6 = 0;
  }
  -[AVAudioSession accessor](self, "accessor", v19, v20);
  as::client::api_utils::ServerAccessor::SetProperty(v33, (void *)*MEMORY[0x1E0D49C80], v6, 1);
  v14 = FormatNSErrorForReturn();
  v15 = v34;
  if (v34)
  {
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v23);
  return v14;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode routeSharingPolicy:(AVAudioSessionRouteSharingPolicy)policy options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  NSString *v11;
  NSString *v12;
  char v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;

  v11 = category;
  v12 = mode;
  if ((as::client::api_utils::ValidateRouteSharingPolicyParameters((as::client::api_utils *)v11, v12, (NSString *)policy, (AVAudioSessionRouteSharingPolicy)options) & 1) != 0)
  {
    -[AVAudioSession accessor](self, "accessor");
    -[AVAudioSession privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:](self, "privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:", v11, v12, policy, options, &v18);
    v13 = FormatNSErrorForReturn();
    v14 = v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  else
  {
    v13 = FormatNSErrorForReturn();
  }

  return v13;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category mode:(AVAudioSessionMode)mode options:(AVAudioSessionCategoryOptions)options error:(NSError *)outError
{
  NSString *v9;
  NSString *v10;
  char v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  v9 = category;
  v10 = mode;
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:](self, "privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:", v9, v10, -1, options, &v16);
  v11 = FormatNSErrorForReturn();
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

  return v11;
}

- (BOOL)setPreferredIOBufferFrameSize:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3373;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49A68], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setReporterID:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  as::client::cache_util::CacheManager **v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v14[0] = 1;
  v15 = 3389;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!as::client::api_utils::ServerAccessor::SetProperty(v12, (void *)*MEMORY[0x1E0D49BC0], v7, 1))
    atomic_store(a3, (unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  v8 = FormatNSErrorForReturn();

  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v8;
}

- (BOOL)setParticipatesInNowPlayingAppPolicy:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3343;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D498B0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setMode:(AVAudioSessionMode)mode error:(NSError *)outError
{
  NSString *v6;
  void *v7;
  as::client *v8;
  int v9;
  NSObject *v10;
  int v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  as::client::cache_util::CacheManager **v15;
  std::__shared_weak_count *v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = mode;
  v17[0] = 1;
  v18 = 3076;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  TranslateAVASModeToMXModeString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AVAudioSession accessor](self, "accessor");
    v8 = (as::client *)as::client::api_utils::ServerAccessor::SetProperty(v15, (void *)*MEMORY[0x1E0D49528], v7, 1);
    v9 = (int)v8;
    if ((_DWORD)v8)
    {
      v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v8));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "AVAudioSession_iOS.mm";
        v25 = 1024;
        v26 = 3396;
        v27 = 1024;
        v28 = v9;
        _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode: %d", buf, 0x18u);
      }
    }
    v11 = FormatNSErrorForReturn();
    if (v11)
      as::client::KVOManager::markPropertiesDirty(v15[3], -33);
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)())v16->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else if (outError)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    LOBYTE(v11) = 0;
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v11;
}

- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4
{
  int v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3384;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", as::client::api_utils::MapToMxHWCtrlFlags(v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49520], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setCategory:(AVAudioSessionCategory)category error:(NSError *)outError
{
  NSString *v5;
  char v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v5 = category;
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:](self, "privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:", v5, 0, -1, -1, &v11);
  v6 = FormatNSErrorForReturn();
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
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

- (BOOL)setActive:(BOOL)active error:(NSError *)outError
{
  return -[AVAudioSession setActive:withOptions:error:](self, "setActive:withOptions:error:", active, 0, outError);
}

- (id)spatialPreferences:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  as::client::XPCConnection **v15;
  std::__shared_weak_count *v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE v24[24];
  _BYTE *v25;
  id v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17[0] = 1;
  v18 = 3440;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<AVAudioSessionSpatialPreferences * {__strong}>(v15[7], &v23);
  v5 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::sync_proxy(&v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned int *)v15;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::reply((uint64_t)&v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getSpatialPreferencesForSession:contentType:reply:", v7, a3, v8);

  objc_autoreleasePoolPop(v5);
  if (v26)
    v9 = 0;
  else
    v9 = v27;

  v10 = v25;
  if (v25 == v24)
  {
    v11 = 4;
    v10 = v24;
    goto LABEL_8;
  }
  if (v25)
  {
    v11 = 5;
LABEL_8:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v9;
}

+ (id)auxiliarySession
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
  return (id)objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "initWithSessionType:", 1635088489);
}

- (id)initAuxiliarySession
{
  AVAudioSession *v3;
  char v5[4];
  int v6;
  __int128 v7;
  __int128 v8;

  v5[0] = 1;
  v6 = 3432;
  v7 = 0u;
  v8 = 0u;
  kdebug_trace();
  v3 = -[AVAudioSession initWithSessionType:](self, "initWithSessionType:", 1635088489);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
  return v3;
}

void __32__AVAudioSession_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___AVAudioSession;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "initWithSessionType:", 1886546285);
  v2 = (void *)avfaudio::gAVAudioSession;
  avfaudio::gAVAudioSession = v1;

}

- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  __int128 v10;
  AVAudioSession *v11;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[2];

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSessionType:", 1935830119);
  v10 = *(_OWORD *)&a4->var0[4];
  v19[0] = *(_OWORD *)a4->var0;
  v19[1] = v10;
  objc_msgSend(v9, "setClientAuditToken:", v19);
  objc_msgSend(v9, "setSourceSessionID:", v6);
  objc_msgSend(v9, "setClientIdentifier:", v8);
  objc_msgSend(v9, "setAutoReconnect:", 0);
  v13[0] = 1;
  v14 = 3431;
  v15 = objc_msgSend(v9, "sourceSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  v11 = -[AVAudioSession initWithSpecification:](self, "initWithSpecification:", v9);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);

  return v11;
}

- (AVAudioSession)initWithSessionType:(unint64_t)a3
{
  void *v5;
  AVAudioSession *v6;

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setSessionType:", a3);
  objc_msgSend(v5, "setAutoReconnect:", 1);
  v6 = -[AVAudioSession initWithSpecification:](self, "initWithSpecification:", v5);

  return v6;
}

- (NSInteger)outputNumberOfChannels
{
  uint64_t v3;
  unsigned int updated;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3115;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = *(_QWORD *)(v11 + 24);
  v19[0] = &off_1E424ECF0;
  v19[1] = &v11;
  v20 = v19;
  updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 392, (uint64_t)v19);
  v5 = v20;
  if (v20 == v19)
  {
    v6 = 4;
    v5 = v19;
    goto LABEL_5;
  }
  if (v20)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return updated;
}

- (BOOL)isPiPAvailable
{
  uint64_t v3;
  int updated;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3335;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = *(_QWORD *)(v11 + 24);
  v19[0] = &off_1E424F418;
  v19[1] = &v11;
  v20 = v19;
  updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 440, (uint64_t)v19);
  v5 = v20;
  if (v20 == v19)
  {
    v6 = 4;
    v5 = v19;
    goto LABEL_5;
  }
  if (v20)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return updated != 0;
}

- (id)privateRefreshAvailableOutputs
{
  void *v3;
  id v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v10, (void *)*MEMORY[0x1E0D49C20]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = +[AVAudioSessionPortDescription privateCreateArray:owningSession:](AVAudioSessionPortDescription, "privateCreateArray:owningSession:", v3, self);
  }
  else
  {
    v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "AVAudioSession_iOS.mm";
      v14 = 1024;
      v15 = 3895;
      _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SelectableOutputs failed", buf, 0x12u);
    }
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v4;
}

- (AVAudioSessionRouteDescription)currentRoute
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3124;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetCurrentRoute:](self, "privateGetCurrentRoute:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (AVAudioSessionRouteDescription *)v3;
}

- (id)privateRefreshAvailableInputs
{
  void *v3;
  id v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v10, (void *)*MEMORY[0x1E0D49C10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = +[AVAudioSessionPortDescription privateCreateArray:owningSession:](AVAudioSessionPortDescription, "privateCreateArray:owningSession:", v3, self);
  }
  else
  {
    v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "AVAudioSession_iOS.mm";
      v14 = 1024;
      v15 = 3850;
      _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SelectableInputs failed", buf, 0x12u);
    }
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v4;
}

- (void)privateUpdatePiPAvailabilityChange:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "BOOLValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 440, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)privateUpdateReporterIDs:(id)a3
{
  as::client *v4;
  as::client *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (as::client *)a3;
  v5 = v4;
  if (v4 && (v4 = (as::client *)-[as::client count](v4, "count")) != 0)
  {
    -[as::client objectAtIndex:](v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    atomic_store(objc_msgSend(v6, "longLongValue"), (unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));

  }
  else
  {
    v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v4));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "AVAudioSession_iOS.mm";
      v10 = 1024;
      v11 = 4847;
      _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d inValue is nil for new reporter IDs", (uint8_t *)&v8, 0x12u);
    }
  }

}

- (BOOL)allowAllBuiltInDataSources
{
  int v2;
  uint64_t v4;
  uint64_t v5;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v2 = *(unsigned __int8 *)(v5 + 280);
  if (v4)
    os_unfair_recursive_lock_unlock();
  return v2 != 0;
}

- (AVAudioSessionRouteSharingPolicy)routeSharingPolicy
{
  unsigned int Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3075;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v8, (void *)*MEMORY[0x1E0D49BE8], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (unint64_t)Property_DefaultTo;
}

- (id)pickedRoute
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3402;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v11, (void *)*MEMORY[0x1E0D49A18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3696;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get PickedRoute failed", buf, 0x12u);
    }
    v5 = (id)MEMORY[0x1E0C9AA70];
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v5;
}

- (id)outputTimeObserver
{
  id v2;
  AVAudioTimeObserverImpl *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  if (!*(_QWORD *)(v16 + 240))
  {
    v4 = [AVAudioTimeObserverImpl alloc];
    v5 = *(std::__shared_weak_count **)(v16 + 224);
    v13 = *(_QWORD *)(v16 + 216);
    v14 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = -[AVAudioTimeObserverImpl initWithDeviceTimeClient:](v4, "initWithDeviceTimeClient:", &v13);
    v9 = *(void **)(v16 + 240);
    *(_QWORD *)(v16 + 240) = v8;

    v10 = v14;
    if (v14)
    {
      v11 = (unint64_t *)&v14->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v2 = *(id *)(v16 + 240);
  if (v15)
    os_unfair_recursive_lock_unlock();
  return v2;
}

- (id)inputTimeObserver
{
  id v2;
  AVAudioTimeObserverImpl *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  if (!*(_QWORD *)(v16 + 232))
  {
    v4 = [AVAudioTimeObserverImpl alloc];
    v5 = *(std::__shared_weak_count **)(v16 + 208);
    v13 = *(_QWORD *)(v16 + 200);
    v14 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = -[AVAudioTimeObserverImpl initWithDeviceTimeClient:](v4, "initWithDeviceTimeClient:", &v13);
    v9 = *(void **)(v16 + 232);
    *(_QWORD *)(v16 + 232) = v8;

    v10 = v14;
    if (v14)
    {
      v11 = (unint64_t *)&v14->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  v2 = *(id *)(v16 + 232);
  if (v15)
    os_unfair_recursive_lock_unlock();
  return v2;
}

- (NSInteger)maximumOutputNumberOfChannels
{
  NSInteger Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3102;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v8, (void *)*MEMORY[0x1E0D49988], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (NSTimeInterval)preferredIOBufferDuration
{
  double Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3093;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E0D49A58], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)inputSampleRate
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D496A0], 1);
}

- (BOOL)isOtherAudioPlaying
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3119;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49C58], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (NSTimeInterval)inputLatency
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3116;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D49690], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (float)outputVolume
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49CD0], 1);
}

- (BOOL)secondaryAudioShouldBeSilencedHint
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3120;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49C68], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (NSTimeInterval)IOBufferDuration
{
  double v3;
  double v4;
  char v6[4];
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[0] = 1;
  v7 = 3118;
  v8 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v9 = 0;
  v10 = 0;
  v11 = 0;
  kdebug_trace();
  -[AVAudioSession sampleRate](self, "sampleRate");
  v4 = 0.0;
  if (v3 > 0.0)
    v4 = (double)-[AVAudioSession IOBufferFrameSize](self, "IOBufferFrameSize") / v3;
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v6);
  return v4;
}

- (unint64_t)IOBufferFrameSize
{
  __CFString *v3;
  uint64_t Property_DefaultTo;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3375;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetCategory:](self, "privateGetCategory:", &v10);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 == CFSTR("AVAudioSessionCategoryRecord"))
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v10, (void *)*MEMORY[0x1E0D49680], 1);
  else
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v10, (void *)*MEMORY[0x1E0D496A8], 1);
  v5 = Property_DefaultTo;
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (AVAudioSessionCategoryOptions)categoryOptions
{
  AVAudioSession *v2;
  unsigned __int8 v3;
  int Property_DefaultTo;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  AVAudioSessionCategoryOptions v20;
  os_unfair_lock_s **v22;
  std::__shared_weak_count *v23;
  char v24[4];
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v2 = self;
  v24[0] = 1;
  v25 = 3074;
  v26 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v27 = 0;
  v28 = 0;
  v29 = 0;
  kdebug_trace();
  v3 = atomic_load((unsigned __int8 *)(-[AVAudioSession atomicImpl](v2, "atomicImpl") + 40));
  -[AVAudioSession accessor](v2, "accessor");
  LODWORD(v2) = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v22, (void *)*MEMORY[0x1E0D49878], 1);
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v22, (void *)*MEMORY[0x1E0D495C0], 1);
  LODWORD(v5) = (v2 >> 4) & 1;
  if ((v2 & 0x20) != 0)
    v5 = 3;
  else
    v5 = v5;
  if (Property_DefaultTo)
    v6 = ((unint64_t)(v3 & 1) << 16) | v5 | 4;
  else
    v6 = ((unint64_t)(v3 & 1) << 16) | v5;
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v22, (void *)*MEMORY[0x1E0D495B0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isEqualToString:", CFSTR("Speaker")))
    v6 |= 8uLL;
  if (as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v22, (void *)*MEMORY[0x1E0D49D18], 1))v9 = v6 | 0x11;
  else
    v9 = v6;
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v22, (void *)*MEMORY[0x1E0D494C8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "containsObject:", CFSTR("HeadphonesBT"));
    v13 = objc_msgSend(v11, "containsObject:", CFSTR("AirTunes"));
    v14 = v9 | 0x20;
    if (!v12)
      v14 = v9;
    if (v13)
      v9 = v14 | 0x40;
    else
      v9 = v14;
  }
  v15 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v22, (void *)*MEMORY[0x1E0D49B48], 1);
  v16 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v22, (void *)*MEMORY[0x1E0D497C8], 1);

  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v23->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v19 = v9 | 0x80;
  if (!v15)
    v19 = v9;
  if (v16)
    v20 = v19 | 0x20000;
  else
    v20 = v19;
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v24);
  return v20;
}

- (double)sampleRate
{
  int v2;
  void **v3;

  v2 = objc_msgSend(*(id *)(a1 + 16), "isEqualToString:", CFSTR("AVAudioSessionCategoryRecord"));
  v3 = (void **)MEMORY[0x1E0D496A0];
  if (!v2)
    v3 = (void **)MEMORY[0x1E0D496C8];
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(**(os_unfair_lock_s ****)(a1 + 8), *v3, 1);
}

uint64_t __34__AVAudioSession_recordPermission__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = 1684369017;
  if (a2 == 1)
    v2 = 1970168948;
  if (a2 == 2)
    v2 = 1735552628;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (void)requestRecordPermission:(void *)response
{
  void *v4;
  AVAudioSessionRecordPermission v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  unsigned int v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v4 = response;
  LODWORD(location) = 3081;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  std::allocate_shared[abi:ne180100]<as::ScopedTrace,std::allocator<as::ScopedTrace>,as::AudioSessionTraceCode,unsigned int,void>((int *)&location, &v14, &v15);
  v5 = -[AVAudioSession recordPermission](self, "recordPermission");
  if (v5 == AVAudioSessionRecordPermissionDenied)
  {
    v6 = 0;
  }
  else
  {
    if (v5 != AVAudioSessionRecordPermissionGranted)
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __42__AVAudioSession_requestRecordPermission___block_invoke;
      v10[3] = &unk_1E42500A0;
      objc_copyWeak(&v12, &location);
      v11 = v4;
      makeTCCAccessRequest(1, 0, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
    v6 = 1;
  }
  (*((void (**)(void *, uint64_t))v4 + 2))(v4, v6);
LABEL_7:
  v7 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

- (AVAudioSessionRecordPermission)recordPermission
{
  AVAudioSessionRecordPermission v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3080;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1970168948;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__AVAudioSession_recordPermission__block_invoke;
  v4[3] = &unk_1E4250078;
  v4[4] = &v5;
  makeTCCAccessRequest(0, 2, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return v2;
}

- (BOOL)isRelatedSessionID:(unsigned int)a3
{
  AVAudioSession *v4;
  AVAudioSession *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  os_unfair_lock_s **v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  unsigned int v24;

  v4 = self;
  v5 = v4;
  v24 = a3;
  if (v4)
  {
    -[AVAudioSession accessor](v4, "accessor");
    v6 = v22;
  }
  else
  {
    v6 = 0;
    v22 = 0;
    v23 = 0;
  }
  v20 = 0;
  v21 = 0;
  v19 = 0;
  std::allocate_shared[abi:ne180100]<as::client::api_utils::ServerAccessor const,std::allocator<as::client::api_utils::ServerAccessor const>,unsigned int &,AVAudioSessionType const&,decltype(nullptr),decltype(nullptr),decltype(nullptr),std::shared_ptr<as::client::XPCConnection> const&,void>(&v24, (_QWORD *)(v6 + 8), (uint64_t)&v21, (uint64_t)&v20, (uint64_t)&v19, (_QWORD *)(v6 + 56), &v17);
  v7 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSNumber * {__strong}>(v17, (void *)*MEMORY[0x1E0D49630]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[AVAudioSession sourceSessionID](v5, "sourceSessionID");
    v12 = objc_msgSend(v10, "unsignedLongValue") == v11;
  }
  else
  {
    v12 = 0;
  }

  v13 = v18;
  if (v18)
  {
    v14 = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return v12;
}

- (unsigned)sourceSessionID
{
  unsigned int v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;

  -[AVAudioSession accessor](self, "accessor");
  if (*(_QWORD *)(v7 + 8) == 1935830119)
    v3 = *(_DWORD *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 24);
  else
    v3 = atomic_load((unsigned int *)-[AVAudioSession atomicImpl](self, "atomicImpl"));
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v3;
}

- (BOOL)enableNotifications:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  as::client *v6;
  NSObject *v7;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v9[0] = 1;
  v10 = 3403;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID", a3, a4);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v6 = (as::client *)kdebug_trace();
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "AVAudioSession_iOS.mm";
    v17 = 1024;
    v18 = 4782;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableNotifications: inValue = %d", buf, 0x18u);
  }
  atomic_store(v4, (unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 41));
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return 1;
}

- (id)consolidatedSourceContentInfo
{
  void *v3;
  void *v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3331;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v10, (void *)*MEMORY[0x1E0D49618]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (int64_t)renderingMode
{
  as::client::api_utils *v2;
  NSString *v3;
  as::client::api_utils *v4;
  int64_t v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v11, (void *)*MEMORY[0x1E0D49578]);
  v2 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (v2)
  {
    v5 = as::client::api_utils::TranslateFromMXBadgingType(v2, v3);
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "AVAudioSession_iOS.mm";
      v15 = 1024;
      v16 = 4147;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get renderingMode failed", buf, 0x12u);
    }
    v5 = 0;
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return v5;
}

- (BOOL)setRequiresNoAudioResources:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3339;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49760], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setForceSoundCheck:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3337;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D497B0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (void)handleDeferredMessage:(id)a3 userInfo:(id)a4
{
  NSString *v6;
  id v7;
  unsigned __int8 v8;
  os_unfair_lock_s *v9;
  id v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  id *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD block[4];
  id v58;
  id v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  uint64_t v62;
  std::__shared_weak_count *v63;
  id location;

  v6 = (NSString *)a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[AVAudioSession accessor](self, "accessor");
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled)
    as::client::cache_util::CacheManager::checkAndRefreshCacheForMXNotification(*(os_unfair_lock_s **)(v62 + 72), self, v6);
  v9 = *(os_unfair_lock_s **)(v62 + 40);
  os_unfair_lock_lock(v9);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v9[2], 2uLL, 0, &v60);
  if (v9)
    os_unfair_lock_unlock(v9);
  if (v60)
  {
    if (v7)
      v10 = v7;
    else
      v10 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v11 = v10;
    -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 2, v6, v10, &v62);

  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49448]))
  {
    -[AVAudioSession privateHandleRoutingContextChange:](self, "privateHandleRoutingContextChange:", &v62);
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49FB0]))
  {
    -[AVAudioSession privateHandleActiveNeroVisualStreamInfoDidChange](self, "privateHandleActiveNeroVisualStreamInfoDidChange");
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493A8]))
  {
    -[AVAudioSession privateHandleCurrentInputDeviceBufferSizeDidChange](self, "privateHandleCurrentInputDeviceBufferSizeDidChange");
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493B8]))
  {
    -[AVAudioSession privateHandleCurrentOutputDeviceBufferSizeDidChange](self, "privateHandleCurrentOutputDeviceBufferSizeDidChange");
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493B0]))
  {
    -[AVAudioSession privateHandleCurrentInputSampleRateDidChange](self, "privateHandleCurrentInputSampleRateDidChange");
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493C0]))
  {
    -[AVAudioSession privateHandleCurrentOutputSampleRateDidChange](self, "privateHandleCurrentOutputSampleRateDidChange");
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49350]))
  {
    goto LABEL_59;
  }
  if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0CFF320]))
  {
    goto LABEL_59;
  }
  if (!-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0CFF2D8]))
  {
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D4A020]))
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D49F80]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVAudioSession privateHandleSecondaryAudioHintChange:accessor:](self, "privateHandleSecondaryAudioHintChange:accessor:", v13, &v62);

      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49450]))
    {
      -[AVAudioSession privateHandleOtherPrimaryAudioPlayStateChange:](self, "privateHandleOtherPrimaryAudioPlayStateChange:", &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49428]))
    {
      -[AVAudioSession privateHandlePickableRoutesChange:](self, "privateHandlePickableRoutesChange:", &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49398]))
    {
      -[AVAudioSession privateHandleAvailableSampleRatesChange:](self, "privateHandleAvailableSampleRatesChange:", &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49408]))
    {
      -[AVAudioSession privateHandleBeaconBudgetChange:accessor:](self, "privateHandleBeaconBudgetChange:accessor:", v7, &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49430]))
    {
      -[AVAudioSession privateHandlePrefersConcurrentAirPlayAudioChange:accessor:](self, "privateHandlePrefersConcurrentAirPlayAudioChange:accessor:", v7, &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49460]))
    {
      -[AVAudioSession privateHandleRenderingCapabilitiesChange:](self, "privateHandleRenderingCapabilitiesChange:", &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49440]))
    {
      -[AVAudioSession privateHandleRouteControlFeaturesChange:accessor:](self, "privateHandleRouteControlFeaturesChange:accessor:", v7, &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0CFF310]))
    {
      -[AVAudioSession privateHandleMicrophoneInjectionCapabilityChange:accessor:](self, "privateHandleMicrophoneInjectionCapabilityChange:accessor:", v7, &v62);
      goto LABEL_59;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493D0]))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke;
      block[3] = &unk_1E4250008;
      v14 = &v59;
      objc_copyWeak(&v59, &location);
      v58 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v15 = v58;
    }
    else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49438]))
    {
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_2;
      v54[3] = &unk_1E4250008;
      v14 = &v56;
      objc_copyWeak(&v56, &location);
      v55 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v54);
      v15 = v55;
    }
    else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49458]))
    {
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_3;
      v51[3] = &unk_1E4250008;
      v14 = &v53;
      objc_copyWeak(&v53, &location);
      v52 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v51);
      v15 = v52;
    }
    else
    {
      if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49468]))
      {
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_4;
        v49[3] = &unk_1E4250030;
        v14 = &v50;
        objc_copyWeak(&v50, &location);
        dispatch_async(MEMORY[0x1E0C80D38], v49);
        goto LABEL_58;
      }
      if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D4A038]))
      {
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_5;
        v46[3] = &unk_1E4250008;
        v14 = &v48;
        objc_copyWeak(&v48, &location);
        v47 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], v46);
        v15 = v47;
      }
      else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49390]))
      {
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_6;
        v43[3] = &unk_1E4250008;
        v14 = &v45;
        objc_copyWeak(&v45, &location);
        v44 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], v43);
        v15 = v44;
      }
      else
      {
        if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49388]))
        {
          -[AVAudioSession privateHandleAudioHardwareFormatChange](self, "privateHandleAudioHardwareFormatChange");
          goto LABEL_59;
        }
        if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49470]))
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_7;
          v40[3] = &unk_1E4250008;
          v14 = &v42;
          objc_copyWeak(&v42, &location);
          v41 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], v40);
          v15 = v41;
        }
        else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49420]))
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_8;
          v37[3] = &unk_1E4250008;
          v14 = &v39;
          objc_copyWeak(&v39, &location);
          v38 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], v37);
          v15 = v38;
        }
        else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49410]))
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_9;
          v34[3] = &unk_1E4250008;
          v14 = &v36;
          objc_copyWeak(&v36, &location);
          v35 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], v34);
          v15 = v35;
        }
        else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D49418]))
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_10;
          v31[3] = &unk_1E4250008;
          v14 = &v33;
          objc_copyWeak(&v33, &location);
          v32 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], v31);
          v15 = v32;
        }
        else if (-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493A0]))
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_11;
          v28[3] = &unk_1E4250008;
          v14 = &v30;
          objc_copyWeak(&v30, &location);
          v29 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], v28);
          v15 = v29;
        }
        else
        {
          if (!-[NSString isEqualToString:](v6, "isEqualToString:", *MEMORY[0x1E0D493F8]))
            goto LABEL_59;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3321888768;
          v24[2] = __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_12;
          v24[3] = &unk_1E424EF40;
          v14 = &v26;
          objc_copyWeak(&v26, &location);
          v25 = v7;
          v27[0] = v62;
          v27[1] = v63;
          if (v63)
          {
            p_shared_owners = (unint64_t *)&v63->__shared_owners_;
            do
              v23 = __ldxr(p_shared_owners);
            while (__stxr(v23 + 1, p_shared_owners));
          }
          dispatch_async(MEMORY[0x1E0C80D38], v24);
          std::shared_ptr<as::client::XPCConnection>::~shared_ptr[abi:ne180100]((uint64_t)v27);
          v15 = v25;
        }
      }
    }

LABEL_58:
    objc_destroyWeak(v14);
    goto LABEL_59;
  }
  if (gAudioSessionDelegate)
  else
    -[AVAudioSession privateInterruptionWithInfo:accessor:](self, "privateInterruptionWithInfo:accessor:", v7, &v62);
LABEL_59:
  v16 = v61;
  if (v61)
  {
    v17 = (unint64_t *)&v61->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v63;
  if (v63)
  {
    v20 = (unint64_t *)&v63->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  objc_destroyWeak(&location);

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D492F0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateInputGain:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49338]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateReporterIDs:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49348]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateSpeechDetectionStyle:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "privateUpdateInputAvailable");

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49FA0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateOutputVolume:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D492E0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateAudioFormats:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_7(uint64_t a1)
{
  NSString *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D48610]);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", TranslateMXVoicePromptStyleToAVASVoicePromptStyle(v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "privateUpdatePromptStyle:", v3);

  }
}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49328]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdatePiPAvailabilityChange:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49318]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateInputChannelCount:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D49320]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateUpdateOutputChannelCount:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D492E8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "privateHandleBadgeTypeChange:", v3);

    WeakRetained = v4;
  }

}

void __49__AVAudioSession_handleDeferredMessage_userInfo___block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "privateInputMuteWithInfo:accessor:", *(_QWORD *)(a1 + 32), a1 + 48);

}

- (BOOL)isPropertyCached:(id)a3
{
  NSString *v4;
  BOOL isPropertyCached;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSString *)a3;
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  isPropertyCached = as::client::cache_util::CacheManager::isPropertyCached(*(os_unfair_lock_s **)(v8 + 176), v4);
  if (v7)
    os_unfair_recursive_lock_unlock();

  return isPropertyCached;
}

- (id)cachedPropertyValue:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  as::client::cache_util::CacheManager::getCachedValue(*(os_unfair_lock_s **)(v11 + 176), v4, (uint64_t)&v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    os_unfair_recursive_lock_unlock();

  return v6;
}

- (void)invalidateCache
{
  uint64_t v2;
  uint64_t v3;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  as::client::cache_util::CacheManager::invalidateCache(*(os_unfair_lock_t *)(v3 + 176));
  if (v2)
    os_unfair_recursive_lock_unlock();
}

- (void)addToCache:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a3;
  v7 = a4;
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  as::client::cache_util::CacheManager::updateCache(*(os_unfair_lock_s **)(v9 + 176), v6, v7);
  if (v8)
    os_unfair_recursive_lock_unlock();

}

- (BOOL)privateRequiresWatchOSRoutePicker:(unint64_t)a3 accessor:(const void *)a4
{
  return 0;
}

- (BOOL)privateHandleWatchOSActivationAfterRoutePickerSelection:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6
{
  return a3
      && -[AVAudioSession privateSetActive:withOptions:error:accessor:](self, "privateSetActive:withOptions:error:accessor:", 1, a4, a5, a6);
}

- (AVAudioSession)init
{
  AVAudioSession *v2;
  AVAudioSession *v3;

  v2 = self;
  if (avfaudio::gAVAudioSession)
  {

    v2 = 0;
  }
  +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
  v3 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)privateCreateSessionInServerUsingXPC:(void *)a3
{
  char v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  as::client *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL result;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  unint64_t *p_shared_weak_owners;
  unint64_t v31;
  dispatch_time_t v32;
  NSObject *v33;
  unint64_t *v34;
  unint64_t v35;
  unsigned int v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  as::client::DeviceTimeGlobalState *v42;
  as::client::DeviceTimeGlobalState *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  os_unfair_lock_s *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD block[5];
  std::__shared_weak_count *v64;
  id v65;
  id v66;
  id v67;
  id to;
  id location;
  _OWORD v70[2];
  _BYTE from[18];
  __int16 v72;
  _BYTE v73[14];
  _BYTE buf[18];
  __int16 v75;
  uint64_t v76;
  _BYTE *v77;
  id v78;
  unsigned int v79;
  id v80;
  unsigned int v81;
  int v82;
  uint64_t v83;

  v4 = 0;
  v83 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  do
  {
    v6 = v5;
    if ((v4 & 1) != 0)
      usleep(0x186A0u);
    as::client::XPCConnection::sync_message<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>(*(as::client::XPCConnection **)(*((_QWORD *)a3 + 1) + 48), (uint64_t)buf);
    v7 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::sync_proxy((void **)buf);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *((_QWORD *)a3 + 1);
    v10 = *(_QWORD *)(v9 + 16);
    v11 = *(_OWORD *)(v9 + 300);
    v70[0] = *(_OWORD *)(v9 + 284);
    v70[1] = v11;
    v12 = *(unsigned int *)(v9 + 24);
    v13 = *(_QWORD *)(v9 + 320);
    v14 = *(_QWORD *)(v9 + 328);
    v15 = *(unsigned int *)(v9 + 336);
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::reply((uint64_t)buf);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createSession:sourceAuditToken:sourceSessionID:nameOrDeviceUID:clientProcessName:useCaseIdentifier:reply:", v10, v70, v12, v13, v14, v15, v16);

    objc_autoreleasePoolPop(v7);
    if (!v78)
    {
      v36 = v79;
      v37 = v82;
      v38 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v17));
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)from = 136315906;
        *(_QWORD *)&from[4] = "AVAudioSession_iOS.mm";
        *(_WORD *)&from[12] = 1024;
        *(_DWORD *)&from[14] = 1132;
        v72 = 2048;
        *(_QWORD *)v73 = self;
        *(_WORD *)&v73[8] = 1024;
        *(_DWORD *)&v73[10] = v36;
        _os_log_impl(&dword_19EF50000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created session %p with ID: 0x%x", from, 0x22u);
      }
      AVAudioSessionImpl::setSessionID(*((AVAudioSessionImpl **)a3 + 1), v36);
      v39 = *((_QWORD *)a3 + 1);
      *(_DWORD *)(v39 + 24) = v37;
      as::client::XPCConnection::getConnection(*(as::client::XPCConnection **)(v39 + 48));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "processIdentifier");

      v42 = (as::client::DeviceTimeGlobalState *)v80;
      v43 = v42;
      if (v42)
      {
        v44 = as::client::DeviceTimeGlobalState::instance(v42);
        as::client::DeviceTimeGlobalState::obtainedNewSharedBlock((uint64_t)v44, v41, v43);
        v45 = v81;
        v46 = *((_QWORD *)a3 + 1);
        *(_DWORD *)(v46 + 192) = v81;
        atomic_store(v45, (unsigned int *)(*(_QWORD *)(v46 + 200) + 16));
        atomic_store(v45, (unsigned int *)(*(_QWORD *)(*((_QWORD *)a3 + 1) + 216) + 16));
        v47 = *((_QWORD *)a3 + 1);
        v48 = *(void **)(v47 + 248);
        if (v48)
        {
          objc_msgSend(v48, "setTimingSlot:", v45);
          v47 = *((_QWORD *)a3 + 1);
        }
        v49 = *(void **)(v47 + 256);
        if (v49)
          objc_msgSend(v49, "setTimingSlot:", v45);
      }

      if (*(_QWORD *)(*((_QWORD *)a3 + 1) + 16) == 1702392942)
      {
LABEL_57:

        v60 = &buf[8];
        if (v77 == &buf[8])
        {
          v61 = 4;
        }
        else
        {
          if (!v77)
          {
LABEL_62:

            return 1;
          }
          v61 = 5;
          v60 = v77;
        }
        (*(void (**)(void))(*v60 + 8 * v61))();
        goto LABEL_62;
      }
      v50 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
      avfaudio::SessionMap::AddSession(v50, self, v36);
      objc_initWeak(&location, self);
      objc_copyWeak(&to, &location);
      v51 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 48);
      objc_copyWeak(&v67, &to);
      *(_QWORD *)&v73[4] = 0;
      *(_QWORD *)from = &off_1E424F460;
      objc_moveWeak((id *)&from[8], &v67);
      *(_QWORD *)&v73[4] = from;
      objc_destroyWeak(&v67);
      as::client::XPCConnection::setServerTerminatedCallback(v51, (uint64_t)from, *(_BYTE *)(*((_QWORD *)a3 + 1) + 316));
      v52 = *(_QWORD **)&v73[4];
      if (*(_BYTE **)&v73[4] == from)
      {
        v53 = 4;
        v52 = from;
      }
      else
      {
        if (!*(_QWORD *)&v73[4])
          goto LABEL_44;
        v53 = 5;
      }
      (*(void (**)(void))(*v52 + 8 * v53))();
LABEL_44:
      if (!*(_BYTE *)(*((_QWORD *)a3 + 1) + 316))
        goto LABEL_51;
      objc_copyWeak(&v66, &location);
      v54 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 48);
      objc_copyWeak(&v65, &v66);
      *(_QWORD *)&v73[4] = 0;
      *(_QWORD *)from = &off_1E424F4A8;
      objc_moveWeak((id *)&from[8], &v65);
      *(_QWORD *)&v73[4] = from;
      objc_destroyWeak(&v65);
      as::client::XPCConnection::setServerRestartedCallback(v54, (uint64_t)from);
      v55 = *(_QWORD **)&v73[4];
      if (*(_BYTE **)&v73[4] == from)
      {
        v56 = 4;
        v55 = from;
      }
      else
      {
        if (!*(_QWORD *)&v73[4])
        {
LABEL_50:
          objc_destroyWeak(&v66);
LABEL_51:
          -[AVAudioSession accessor](self, "accessor");
          -[AVAudioSession privateDispatchPing:](self, "privateDispatchPing:", from);
          v57 = *(std::__shared_weak_count **)&from[8];
          if (*(_QWORD *)&from[8])
          {
            v58 = (unint64_t *)(*(_QWORD *)&from[8] + 8);
            do
              v59 = __ldaxr(v58);
            while (__stlxr(v59 - 1, v58));
            if (!v59)
            {
              ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
              std::__shared_weak_count::__release_weak(v57);
            }
          }
          objc_destroyWeak(&to);
          objc_destroyWeak(&location);
          goto LABEL_57;
        }
        v56 = 5;
      }
      (*(void (**)(void))(*v55 + 8 * v56))();
      goto LABEL_50;
    }

    v18 = v77;
    if (v77 == &buf[8])
    {
      v18 = &buf[8];
      v19 = 4;
    }
    else
    {
      if (!v77)
        goto LABEL_10;
      v19 = 5;
    }
    (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_10:

    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  result = 0;
  v21 = *(_QWORD *)(*((_QWORD *)a3 + 1) + 16);
  if (v21 != 1702392942 && v21 != 1935830119)
  {
    v22 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1213;
      v75 = 2048;
      v76 = 3;
      _os_log_impl(&dword_19EF50000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session creation did not succeed, will retry after %lld seconds", buf, 0x1Cu);
    }
    objc_initWeak(&location, self);
    objc_copyWeak(&to, &location);
    v23 = (char *)operator new(0x38uLL);
    *((_QWORD *)v23 + 2) = 0;
    *(_QWORD *)v23 = &unk_1E424FA00;
    *((_QWORD *)v23 + 1) = 0;
    objc_copyWeak((id *)from, &to);
    *((_QWORD *)v23 + 6) = 0;
    *((_QWORD *)v23 + 3) = &off_1E424F4F0;
    objc_moveWeak((id *)v23 + 4, (id *)from);
    *((_QWORD *)v23 + 6) = v23 + 24;
    objc_destroyWeak((id *)from);
    *(_QWORD *)buf = v23 + 24;
    *(_QWORD *)&buf[8] = v23;
    std::shared_ptr<std::function<void ()(void)>>::operator=[abi:ne180100](*((_QWORD *)a3 + 1) + 120, (__int128 *)buf);
    v24 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v25 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = *((_QWORD *)a3 + 1);
    v29 = *(_QWORD *)(v27 + 120);
    v28 = *(std::__shared_weak_count **)(v27 + 128);
    if (v28)
    {
      p_shared_weak_owners = (unint64_t *)&v28->__shared_weak_owners_;
      do
        v31 = __ldxr(p_shared_weak_owners);
      while (__stxr(v31 + 1, p_shared_weak_owners));
    }
    v32 = dispatch_time(0, 3000000000);
    v33 = *(id *)(*(_QWORD *)(*((_QWORD *)a3 + 1) + 48) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = __55__AVAudioSession_privateCreateSessionInServerUsingXPC___block_invoke;
    block[3] = &__block_descriptor_48_ea8_32c42_ZTSNSt3__18weak_ptrINS_8functionIFvvEEEEE_e5_v8__0l;
    block[4] = v29;
    v64 = v28;
    if (v28)
    {
      v34 = (unint64_t *)&v28->__shared_weak_owners_;
      do
        v35 = __ldxr(v34);
      while (__stxr(v35 + 1, v34));
    }
    dispatch_after(v32, v33, block);
    if (v64)
      std::__shared_weak_count::__release_weak(v64);

    if (v28)
      std::__shared_weak_count::__release_weak(v28);
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
    return 1;
  }
  return result;
}

void __55__AVAudioSession_privateCreateSessionInServerUsingXPC___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 24);
        if (!v6)
          std::__throw_bad_function_call[abi:ne180100]();
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

- (BOOL)privateRecreateSessionInServerUsingXPC
{
  std::__shared_weak_count *v3;
  as::client::XPCConnection *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  as::client *v16;
  id v17;
  NSObject *v18;
  _QWORD *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  as::client::DeviceTimeGlobalState *v26;
  as::client::DeviceTimeGlobalState *v27;
  void *v28;
  uint64_t v29;
  AVAudioSessionImpl *v30;
  void *v31;
  void *v32;
  AVAudioSessionImpl *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  os_unfair_lock_s *v37;
  unsigned __int8 v38;
  uint64_t v39;
  BOOL v40;
  as::client *v41;
  as::client *v42;
  NSObject *v43;
  int v44;
  void *v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  os_unfair_lock_s *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  BOOL v54;
  void *v55;
  unsigned __int8 v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  uint64_t v63;
  std::__shared_weak_count *v64;
  id v65;
  int *v66;
  std::__shared_weak_count *v67;
  _OWORD v68[2];
  as::client::XPCConnection *v69;
  std::__shared_weak_count *v70;
  uint64_t v71;
  AVAudioSessionImpl *v72;
  _BYTE v73[24];
  int64_t v74;
  char v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  _BYTE v81[14];
  void *v82;
  _BYTE v83[24];
  _BYTE *v84;
  id v85;
  unsigned int v86;
  id v87;
  unsigned int v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  PerformanceTracker::PerformanceTracker((uint64_t)v73, (uint64_t)"-[AVAudioSession privateRecreateSessionInServerUsingXPC]", 0, 1);
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v4 = (as::client::XPCConnection *)*((_QWORD *)v72 + 6);
  v3 = (std::__shared_weak_count *)*((_QWORD *)v72 + 7);
  v69 = v4;
  v70 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  as::client::XPCConnection::sync_message<unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>(v4, (uint64_t)&v82);
  v7 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::sync_proxy(&v82);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *((_QWORD *)v72 + 2);
  v10 = *(_OWORD *)((char *)v72 + 300);
  v68[0] = *(_OWORD *)((char *)v72 + 284);
  v68[1] = v10;
  v11 = *((unsigned int *)v72 + 6);
  v12 = *((_QWORD *)v72 + 40);
  v13 = *((_QWORD *)v72 + 41);
  v14 = *((unsigned int *)v72 + 84);
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>::reply((uint64_t)&v82);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createSession:sourceAuditToken:sourceSessionID:nameOrDeviceUID:clientProcessName:useCaseIdentifier:reply:", v9, v68, v11, v12, v13, v14, v15);

  objc_autoreleasePoolPop(v7);
  v17 = v85;
  if (v85)
  {
    v18 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v16));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v77 = "AVAudioSession_iOS.mm";
      v78 = 1024;
      v79 = 1352;
      v80 = 2048;
      *(_QWORD *)v81 = self;
      _os_log_impl(&dword_19EF50000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to retrieve session after session restart, session %p", buf, 0x1Cu);
    }
    v75 = 1;
  }
  else
  {
    v21 = v86;
    v22 = v89;
    v23 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v16));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v77 = "AVAudioSession_iOS.mm";
      v78 = 1024;
      v79 = 1274;
      v80 = 1024;
      *(_DWORD *)v81 = v21;
      _os_log_impl(&dword_19EF50000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Recreated session with ID: 0x%x", buf, 0x18u);
    }
    AVAudioSessionImpl::setSessionID(v72, v21);
    *((_DWORD *)v72 + 6) = v22;
    as::client::XPCConnection::getConnection(v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "processIdentifier");

    v26 = (as::client::DeviceTimeGlobalState *)v87;
    v27 = v26;
    if (v26)
    {
      v28 = as::client::DeviceTimeGlobalState::instance(v26);
      as::client::DeviceTimeGlobalState::obtainedNewSharedBlock((uint64_t)v28, v25, v27);
      v29 = v88;
      v30 = v72;
      *((_DWORD *)v72 + 48) = v88;
      atomic_store(v29, (unsigned int *)(*((_QWORD *)v30 + 25) + 16));
      atomic_store(v29, (unsigned int *)(*((_QWORD *)v30 + 27) + 16));
      v31 = (void *)*((_QWORD *)v30 + 31);
      if (v31)
      {
        objc_msgSend(v31, "setTimingSlot:", v29);
        v30 = v72;
      }
      v32 = (void *)*((_QWORD *)v30 + 32);
      if (v32)
        objc_msgSend(v32, "setTimingSlot:", v29);
    }

    v33 = v72;
    v34 = (std::__shared_weak_count *)*((_QWORD *)v72 + 10);
    v66 = (int *)*((_QWORD *)v72 + 9);
    v67 = v34;
    if (v34)
    {
      v35 = (unint64_t *)&v34->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
      v33 = v72;
    }
    if (*((_QWORD *)v33 + 2) != 1702392942)
    {
      v37 = (os_unfair_lock_s *)CADeprecated::TSingleton<avfaudio::SessionMap>::instance();
      avfaudio::SessionMap::UpdateSessionID(v37, self, v21);
      {
        as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
      }
      if (as::AudioSessionMuteEnabled(void)::enabled)
      {
        v39 = *((unsigned __int8 *)v72 + 144);
        v65 = 0;
        v40 = -[AVAudioSession muteSessionInput:error:](self, "muteSessionInput:error:", v39, &v65);
        v41 = (as::client *)v65;
        v42 = v41;
        if (!v40)
        {
          v43 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v41));
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = *((unsigned __int8 *)v72 + 144);
            -[as::client description](v42, "description");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v77 = "AVAudioSession_iOS.mm";
            v78 = 1024;
            v79 = 1303;
            v80 = 1024;
            *(_DWORD *)v81 = v44;
            *(_WORD *)&v81[4] = 2112;
            *(_QWORD *)&v81[6] = v45;
            _os_log_impl(&dword_19EF50000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to re-apply mute state, muted: %d, err: %@", buf, 0x22u);

          }
        }
      }
      else
      {
        v42 = 0;
      }
      v50 = (os_unfair_lock_s *)*((_QWORD *)v66 + 5);
      os_unfair_lock_lock(v50);
      as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v50[2], 2uLL, 0, &v63);
      if (v50)
        os_unfair_lock_unlock(v50);
      if (v63)
      {
        v51 = as::client::AVAudioSessionNotificationState::RegisterAllMXNotificationsWithServer(v63, &v66);
        if ((v51 & 1) == 0)
        {
          v52 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v51));
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v77 = "AVAudioSession_iOS.mm";
            v78 = 1024;
            v79 = 1329;
            v80 = 2048;
            *(_QWORD *)v81 = self;
            _os_log_impl(&dword_19EF50000, v52, OS_LOG_TYPE_ERROR, "%25s:%-5d Error with RegisterAllNotificationsWithServer, session %p", buf, 0x1Cu);
          }
        }
      }
      +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "privateShouldSubscribeToMicrophoneInjectionCapabilityChangeNotification") == 0;

      if (!v54)
      {
        +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "privateSubscribeToMicrophoneInjectionCapabilityChangeNotification");

      }
      -[AVAudioSession privateResetCachedPropertyValues:](self, "privateResetCachedPropertyValues:", &v66);
      {
        as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
      }
      if (as::ClientSideCachingEnabled(void)::enabled)
        as::client::cache_util::CacheManager::invalidateCache(*((os_unfair_lock_t *)v72 + 22));
      as::client::AVAudioSessionDaemonsStateManager::processServiceReset((uint64_t)v72 + 88, CFSTR("audiomxd"), &v66);
      -[AVAudioSession privateDispatchPing:](self, "privateDispatchPing:", &v66);
      v57 = v64;
      if (v64)
      {
        v58 = (unint64_t *)&v64->__shared_owners_;
        do
          v59 = __ldaxr(v58);
        while (__stlxr(v59 - 1, v58));
        if (!v59)
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
      }

    }
    v74 = -[AVAudioSession getCachedOrFromServerReporterID:](self, "getCachedOrFromServerReporterID:", &v66);
    v60 = v67;
    if (v67)
    {
      v61 = (unint64_t *)&v67->__shared_owners_;
      do
        v62 = __ldaxr(v61);
      while (__stlxr(v62 - 1, v61));
      if (!v62)
      {
        ((void (*)(std::__shared_weak_count *))v60->__on_zero_shared)(v60);
        std::__shared_weak_count::__release_weak(v60);
      }
    }
  }

  v19 = v84;
  if (v84 == v83)
  {
    v20 = 4;
    v19 = v83;
    goto LABEL_30;
  }
  if (v84)
  {
    v20 = 5;
LABEL_30:
    (*(void (**)(void))(*v19 + 8 * v20))();
  }

  v46 = v70;
  if (v70)
  {
    v47 = (unint64_t *)&v70->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  if (v71)
    os_unfair_recursive_lock_unlock();
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v73);
  return v17 == 0;
}

uint64_t __40__AVAudioSession_initWithSpecification___block_invoke(as::client *a1)
{
  NSObject *v1;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(a1));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v3 = 136315394;
    v4 = "AVAudioSession_iOS.mm";
    v5 = 1024;
    v6 = 301;
    _os_log_impl(&dword_19EF50000, v1, OS_LOG_TYPE_INFO, "%25s:%-5d Registering to CFNotificationCenter to notify of Observers of MicrophoneInjectionCapabilityChangeNotification", (uint8_t *)&v3, 0x12u);
  }
  return _CFNotificationCenterRegisterDependentNotificationList();
}

- (id)initSiblingSession:(unsigned int)a3 auditToken:(id *)a4 clientIdentifier:(id)a5 autoReconnect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  void *v11;
  __int128 v12;
  as::client *v13;
  NSObject *v14;
  AVAudioSession *v15;
  unsigned int v16;
  _OWORD v18[2];
  uint8_t buf[4];
  _DWORD v20[11];

  v6 = a6;
  v8 = *(_QWORD *)&a3;
  *(_QWORD *)&v20[9] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setSessionType:", 1935830119);
  v12 = *(_OWORD *)&a4->var0[4];
  v18[0] = *(_OWORD *)a4->var0;
  v18[1] = v12;
  objc_msgSend(v11, "setClientAuditToken:", v18);
  objc_msgSend(v11, "setSourceSessionID:", v8);
  objc_msgSend(v11, "setClientIdentifier:", v10);
  v13 = (as::client *)objc_msgSend(v11, "setAutoReconnect:", v6);
  if ((_DWORD)v8 == -1 || !v6)
  {
    v16 = objc_msgSend(v11, "sourceSessionID");
    buf[0] = 1;
    v20[0] = 3431;
    *(_OWORD *)&v20[1] = v16;
    *(_QWORD *)&v20[5] = 0;
    *(_QWORD *)&v20[7] = 0;
    kdebug_trace();
    self = -[AVAudioSession initWithSpecification:](self, "initWithSpecification:", v11);
    as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)buf);
    v15 = self;
  }
  else
  {
    v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v13));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v20 = "AVAudioSession_iOS.mm";
      LOWORD(v20[2]) = 1024;
      *(_DWORD *)((char *)&v20[2] + 2) = 1558;
      _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Sibling session creation with an explicit ID and auto-reconnect is not yet supported.", buf, 0x12u);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)primarySession
{
  return +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
}

- (AVAudioSession)initWithIsolatedAudioUseCaseID:(unsigned int)a3
{
  AVAudioSession *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  AVAudioSession *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v3 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = *(_QWORD *)&a3;
    v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "AVAudioSession_iOS.mm";
      v12 = 1024;
      v13 = 1595;
      v14 = 1024;
      v15 = v4;
      _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Creating secure session for use case id: %d", (uint8_t *)&v10, 0x18u);
    }
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setSessionType:", 1935897189);
    objc_msgSend(v6, "setUseCaseIdentifier:", v4);
    objc_msgSend(v6, "setAutoReconnect:", 1);
    v3 = -[AVAudioSession initWithSpecification:](v3, "initWithSpecification:", v6);

    v7 = v3;
  }
  else
  {
    v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "AVAudioSession_iOS.mm";
      v12 = 1024;
      v13 = 1591;
      _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create secure session: Invalid useCaseID", (uint8_t *)&v10, 0x12u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)registerPublishingSessionNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  _BYTE v6[18];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
    objc_storeWeak((id *)(*(_QWORD *)&v6[8] + 64), v4);
    if (*(_QWORD *)v6)
      os_unfair_recursive_lock_unlock();
  }
  else
  {
    v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v6 = 136315394;
      *(_QWORD *)&v6[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&v6[12] = 1024;
      *(_DWORD *)&v6[14] = 1606;
      _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid object passed.", v6, 0x12u);
    }
  }

}

- (AVAudioSession)initWithSiriEndpointIdentifier:(id)a3
{
  as::client *v4;
  as::client *v5;
  NSObject *v6;
  void *v7;
  AVAudioSession *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  as::client *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (as::client *)a3;
  v5 = v4;
  if (v4 && (v4 = (as::client *)-[as::client length](v4, "length")) != 0)
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v4));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 136315650;
      v12 = "AVAudioSession_iOS.mm";
      v13 = 1024;
      v14 = 1620;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Creating side kick session for end point id: %@", (uint8_t *)&v11, 0x1Cu);
    }
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setSessionType:", 1936286827);
    objc_msgSend(v7, "setClientIdentifier:", v5);
    objc_msgSend(v7, "setAutoReconnect:", 1);
    self = -[AVAudioSession initWithSpecification:](self, "initWithSpecification:", v7);

    v8 = self;
  }
  else
  {
    v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v4));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "AVAudioSession_iOS.mm";
      v13 = 1024;
      v14 = 1616;
      _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create side kick session: Invalid device ID", (uint8_t *)&v11, 0x12u);
    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)categoryEnablesInput:(id)a3
{
  return as::CategoryRequiresInput((as *)a3, (NSString *)a2);
}

- (NSArray)availableCategories
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (-[AVAudioSession sessionType](self, "sessionType") == 1936286827)
  {
    v7[0] = CFSTR("AVAudioSessionCategoryAlarm");
    v7[1] = CFSTR("AVAudioSessionCategoryPlayback");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = v7;
    v4 = 2;
  }
  else
  {
    v6[0] = CFSTR("AVAudioSessionCategoryAmbient");
    v6[1] = CFSTR("AVAudioSessionCategorySoloAmbient");
    v6[2] = CFSTR("AVAudioSessionCategoryPlayback");
    v6[3] = CFSTR("AVAudioSessionCategoryRecord");
    v6[4] = CFSTR("AVAudioSessionCategoryPlayAndRecord");
    v6[5] = CFSTR("AVAudioSessionCategoryMultiRoute");
    v2 = (void *)MEMORY[0x1E0C99D20];
    v3 = v6;
    v4 = 6;
  }
  objc_msgSend(v2, "arrayWithObjects:count:", v3, v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)setCategoryOptions:(unint64_t)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  as::client::cache_util::CacheManager **v13;
  std::__shared_weak_count *v14;
  char v15[4];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15[0] = 1;
  v16 = 3443;
  v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v18 = 0;
  v19 = 0;
  v20 = 0;
  kdebug_trace();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetCategory:](self, "privateGetCategory:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSession addCategoryOptionsToDictionary:category:options:](self, "addCategoryOptionsToDictionary:category:options:", v6, v7, a3);
  as::client::api_utils::ServerAccessor::SetBatchProperties(v13, v6, 0, 1, 1, 0);
  v8 = FormatNSErrorForReturn();

  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  return v8;
}

- (BOOL)privateSetActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5 accessor:(const void *)a6
{
  _BOOL4 v9;
  int v11;
  AVAudioSessionImplAtomic v12;
  const char *v13;
  uint64_t v14;
  unsigned __int8 v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  as::client *v21;
  id v22;
  NSObject *v23;
  unsigned int v24;
  const char *v25;
  _QWORD *v26;
  uint64_t v27;
  _BYTE v29[40];
  char v30[4];
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  unsigned int v43;
  void *v44;
  _BYTE v45[24];
  _BYTE *v46;
  id v47;
  uint64_t v48;

  v9 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  if (a3)
    v11 = 3087;
  else
    v11 = 3088;
  v30[0] = 1;
  v31 = v11;
  v32 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v33 = 0;
  v34 = 0;
  v35 = 0;
  kdebug_trace();
  v12.var0 = (AVAudioSessionImpl *)-[AVAudioSession atomicImpl](self, "atomicImpl");
  if (v9)
    v13 = "[AVAudioSession setActive:activate]";
  else
    v13 = "[AVAudioSession setActive:deactivate]";
  v14 = atomic_load((unint64_t *)v12.var0 + 1);
  PerformanceTracker::PerformanceTracker((uint64_t)v29, (uint64_t)v13, v14, 0);
  v15 = atomic_load((unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 42));
  as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(*(_QWORD *)a6 + 56), &v44);
  v16 = (void *)MEMORY[0x1A1AF1EA0]();
  v17 = a4 | ((unint64_t)(v15 & 1) << 26);
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v44);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v44);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v18, "activateSession:options:deviceInfo:requestID:reply:", v19, v17, 0, 0, v20);
  else
    objc_msgSend(v18, "deactivateSession:options:priority:requestID:reply:", v19, v17, 0, 0, v20);

  objc_autoreleasePoolPop(v16);
  v22 = v47;
  if (v47)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v47);
  }
  else
  {
    v23 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v21));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
      v25 = "Deactivated";
      v37 = "AVAudioSession_iOS.mm";
      v39 = 1915;
      v40 = 2080;
      *(_DWORD *)buf = 136315906;
      v38 = 1024;
      if (v9)
        v25 = "Activated";
      v41 = v25;
      v42 = 1024;
      v43 = v24;
      _os_log_impl(&dword_19EF50000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s session 0x%x", buf, 0x22u);
    }

  }
  v26 = v46;
  if (v46 == v45)
  {
    v27 = 4;
    v26 = v45;
    goto LABEL_22;
  }
  if (v46)
  {
    v27 = 5;
LABEL_22:
    (*(void (**)(void))(*v26 + 8 * v27))();
  }

  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v29);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v30);
  return v22 == 0;
}

- (void)activateWithOptions:(AVAudioSessionActivationOptions)options completionHandler:(void *)handler
{
  void *v6;
  unsigned __int8 v7;
  std::__shared_weak_count *v8;
  as::client::XPCConnection *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  AVAudioSessionActivationOptions v13;
  unint64_t *v14;
  unint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  AVAudioSessionActivationOptions v39;
  as::client::XPCConnection *v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  _QWORD v44[3];
  _QWORD *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = handler;
  LODWORD(v46) = 3089;
  LODWORD(v40) = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  std::allocate_shared[abi:ne180100]<as::ScopedTrace,std::allocator<as::ScopedTrace>,as::AudioSessionTraceCode,unsigned int,void>((int *)&v46, (unsigned int *)&v40, &v42);
  v7 = atomic_load((unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 42));
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v9 = *(as::client::XPCConnection **)(v47[0] + 48);
  v8 = *(std::__shared_weak_count **)(v47[0] + 56);
  v40 = v9;
  v41 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12 = v7 & 1;
  if (v46)
    os_unfair_recursive_lock_unlock();
  v13 = options | (v12 << 26);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[2] = __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke;
  v34[3] = &unk_1E424EEA0;
  v34[4] = self;
  v36 = v42;
  v37 = v43;
  v34[1] = 3321888768;
  if (v43)
  {
    v14 = (unint64_t *)&v43->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  v38 = 0;
  v39 = v13;
  v16 = v6;
  v35 = v16;
  v45 = 0;
  v44[0] = &off_1E424F2B0;
  v44[1] = MEMORY[0x1A1AF2038](v34);
  v45 = v44;
  as::client::XPCConnection::message<>(v9, (uint64_t)v44, &v46);
  v17 = v45;
  if (v45 == v44)
  {
    v18 = 4;
    v17 = v44;
  }
  else
  {
    if (!v45)
      goto LABEL_14;
    v18 = 5;
  }
  (*(void (**)(void))(*v17 + 8 * v18))();
LABEL_14:
  v19 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::async_proxy(&v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateSession:options:deviceInfo:requestID:reply:", v21, v13, 0, 0, v22);

  objc_autoreleasePoolPop(v19);
  v23 = v48;
  if (v48 == v47)
  {
    v24 = 4;
    v23 = v47;
    goto LABEL_18;
  }
  if (v48)
  {
    v24 = 5;
LABEL_18:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }

  v25 = v37;
  if (v37)
  {
    v26 = (unint64_t *)&v37->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  v28 = v41;
  if (v41)
  {
    v29 = (unint64_t *)&v41->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v43;
  if (v43)
  {
    v32 = (unint64_t *)&v43->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

}

void __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  NSObject *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  id *v15;
  uint64_t v16;
  void *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, void *);
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v4 = (void *)objc_msgSend(v4, "accessor");
  }
  else
  {
    v46 = 0;
    v47 = 0;
  }
  v5 = *(std::__shared_weak_count **)(a1 + 56);
  v44 = *(_QWORD *)(a1 + 48);
  v45 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  if (!v3)
  {
    v24 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v4));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(*(id *)(a1 + 32), "opaqueSessionID");
      *(_DWORD *)buf = 136315650;
      v49 = "AVAudioSession_iOS.mm";
      v50 = 1024;
      v51 = 2002;
      v52 = 1024;
      LODWORD(v53) = v25;
      _os_log_impl(&dword_19EF50000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Activated session 0x%x", buf, 0x18u);
    }

    if (*(_QWORD *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 64), "requestSessionForNetworkStreamingInitialization");
    goto LABEL_34;
  }
  v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v4));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v49 = "AVAudioSession_iOS.mm";
    v50 = 1024;
    v51 = 1970;
    v52 = 2112;
    v53 = v3;
    _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);
  }
  if (!*(_QWORD *)(a1 + 64)
    || !objc_msgSend(*(id *)(a1 + 32), "privateRequiresWatchOSRoutePicker:accessor:", *(_QWORD *)(a1 + 72), &v46))
  {
LABEL_34:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_35;
  }
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3321888768;
  v34 = __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke_84;
  v35 = &unk_1E424EED8;
  v9 = *(std::__shared_weak_count **)(a1 + 56);
  v38 = *(_QWORD *)(a1 + 48);
  v39 = v9;
  if (v9)
  {
    v10 = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = *(_QWORD *)(a1 + 72);
  v36 = *(_QWORD *)(a1 + 32);
  v40 = v12;
  v41 = v46;
  v42 = v47;
  if (v47)
  {
    v13 = (unint64_t *)&v47->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v16 = *(_QWORD *)(a1 + 64);
  v15 = (id *)(a1 + 64);
  v43 = v16;
  v37 = *(v15 - 3);
  v17 = (void *)MEMORY[0x1A1AF2038](&v32);
  objc_msgSend(*v15, "presentRoutePickerAlertWithOptions:completionHandler:", 0, v17, v32, v33, v34, v35, v36);

  v18 = v42;
  if (v42)
  {
    v19 = (unint64_t *)&v42->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v39;
  if (v39)
  {
    v22 = (unint64_t *)&v39->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
LABEL_35:
  v26 = v45;
  if (v45)
  {
    v27 = (unint64_t *)&v45->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v47;
  if (v47)
  {
    v30 = (unint64_t *)&v47->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }

}

void __56__AVAudioSession_activateWithOptions_completionHandler___block_invoke_84(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  unint64_t *v13;
  unint64_t v14;
  id v15[3];

  v5 = a3;
  v6 = *(std::__shared_weak_count **)(a1 + 56);
  v15[1] = *(id *)(a1 + 48);
  v15[2] = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 64);
  v15[0] = 0;
  v11 = objc_msgSend(v9, "privateHandleWatchOSActivationAfterRoutePickerSelection:options:error:accessor:", a2, v10, v15, a1 + 72);
  v12 = v15[0];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 88), "requestSessionForNetworkStreamingInitialization");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if (v6)
  {
    v13 = (unint64_t *)&v6->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (BOOL)deactivateAndSetInterruptionPriority:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  as::client *v12;
  id v13;
  NSObject *v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  as::client::XPCConnection **v21;
  std::__shared_weak_count *v22;
  char v23[4];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  void *v35;
  _BYTE v36[24];
  _BYTE *v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v23[0] = 1;
  v24 = 3419;
  v25 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v26 = 0;
  v27 = 0;
  v28 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<>(v21[7], &v35);
  v7 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned int *)v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateSession:options:priority:requestID:reply:", v9, 0, v10, 0, v11);

  objc_autoreleasePoolPop(v7);
  v13 = v38;
  if (v38)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v38);
  }
  else
  {
    v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v12));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_DWORD *)v21;
      *(_DWORD *)buf = 136315650;
      v30 = "AVAudioSession_iOS.mm";
      v31 = 1024;
      v32 = 2062;
      v33 = 1024;
      v34 = v15;
      _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Deactivated session 0x%x", buf, 0x18u);
    }
    as::client::KVOManager::markPropertiesDirtyAll(v21[3]);
  }

  v16 = v37;
  if (v37 == v36)
  {
    v17 = 4;
    v16 = v36;
    goto LABEL_11;
  }
  if (v37)
  {
    v17 = 5;
LABEL_11:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }

  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)())v22->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v23);
  return v13 == 0;
}

void __42__AVAudioSession_requestRecordPermission___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  as::client *v10;
  NSObject *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint8_t v20[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  _BYTE buf[12];
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  _BYTE *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)a1));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    v27 = 1024;
    v28 = 2141;
    v29 = 1024;
    v30 = a2 == 2;
    _os_log_impl(&dword_19EF50000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Got Permission value %d", buf, 0x18u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "accessor");
    as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(v18 + 56), buf);
    v7 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy((void **)buf);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)buf);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateMicrophonePermissionWithReply:", v9);

    objc_autoreleasePoolPop(v7);
    if (v32)
    {
      v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v10));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = v32;
        *(_DWORD *)v20 = 136315650;
        v21 = "AVAudioSession_iOS.mm";
        v22 = 1024;
        v23 = 2154;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error from -updateMicrophonePermissionWithReply:. %@", v20, 0x1Cu);

      }
    }

    v13 = v31;
    if (v31 == &buf[8])
    {
      v14 = 4;
      v13 = &buf[8];
    }
    else
    {
      if (!v31)
      {
LABEL_15:

        if (v19)
        {
          p_shared_owners = (unint64_t *)&v19->__shared_owners_;
          do
            v17 = __ldaxr(p_shared_owners);
          while (__stlxr(v17 - 1, p_shared_owners));
          if (!v17)
          {
            ((void (*)())v19->__on_zero_shared)();
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        goto LABEL_20;
      }
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
    goto LABEL_15;
  }
  v15 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    v27 = 1024;
    v28 = 2158;
    _os_log_impl(&dword_19EF50000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Session object is no longer valid while returning TCC permission value", buf, 0x12u);
  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)setPreferredSampleRate:(double)sampleRate error:(NSError *)outError
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  as::client::cache_util::CacheManager **v15;
  std::__shared_weak_count *v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v17[0] = 1;
  v18 = 3090;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v6 = (id)*MEMORY[0x1E0D49A88];
  v23[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sampleRate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v8 = (id)*MEMORY[0x1E0D49AD0];
  v23[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sampleRate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  as::client::api_utils::ServerAccessor::SetBatchProperties(v15, v10, 0, 1, 1, 0);
  v11 = FormatNSErrorForReturn();

  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)())v16->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v11;
}

- (BOOL)setPreferredIOBufferDuration:(NSTimeInterval)duration error:(NSError *)outError
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3092;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49A58], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setInterruptionPriority:(int64_t)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3380;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D495F8], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setPreferredInputNumberOfChannels:(NSInteger)count error:(NSError *)outError
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3094;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49AB0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setPreferredOutputNumberOfChannels:(NSInteger)count error:(NSError *)outError
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3096;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49AC0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setInputGain:(float)gain error:(NSError *)outError
{
  double v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  void *v11;
  char v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  as::client::cache_util::CacheManager **v16;
  std::__shared_weak_count *v17;
  char v18[4];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18[0] = 1;
  v19 = 3103;
  v20 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v21 = 0;
  v22 = 0;
  v23 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  *(float *)&v6 = gain;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D49858];
  v9 = as::client::api_utils::ServerAccessor::SetProperty(v16, (void *)*MEMORY[0x1E0D49858], v7, 1);

  if (!v9)
  {
    *(float *)&v10 = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>((os_unfair_lock_s **)v16, v8, 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioSession privateUpdateInputGain:](self, "privateUpdateInputGain:", v11);

  }
  v12 = FormatNSErrorForReturn();
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v17->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);
  return v12;
}

- (BOOL)setInputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  AVAudioSessionDataSourceDescription *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  char v19[4];
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = dataSource;
  v19[0] = 1;
  v20 = 3109;
  v21 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v22 = 0;
  v23 = 0;
  v24 = 0;
  kdebug_trace();
  -[AVAudioSession currentRoute](self, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[AVAudioSession currentRoute](self, "currentRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_msgSend(v11, "setPreferredDataSource:error:", v6, outError);
  if (v12)
  {
    -[AVAudioSession accessor](self, "accessor");
    v13 = *(_QWORD *)(v17 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(_BYTE *)(v13 + 144) = 1;
    os_unfair_recursive_lock_unlock();
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)())v18->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return v12;
}

- (BOOL)setOutputDataSource:(AVAudioSessionDataSourceDescription *)dataSource error:(NSError *)outError
{
  AVAudioSessionDataSourceDescription *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  char v19[4];
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = dataSource;
  v19[0] = 1;
  v20 = 3112;
  v21 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v22 = 0;
  v23 = 0;
  v24 = 0;
  kdebug_trace();
  -[AVAudioSession currentRoute](self, "currentRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[AVAudioSession currentRoute](self, "currentRoute");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outputs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  v12 = objc_msgSend(v11, "setPreferredDataSource:error:", v6, outError);
  if (v12)
  {
    -[AVAudioSession accessor](self, "accessor");
    v13 = *(_QWORD *)(v17 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(_BYTE *)(v13 + 192) = 1;
    os_unfair_recursive_lock_unlock();
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)())v18->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v18);
      }
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return v12;
}

- (BOOL)setPreferredInputOrientation:(AVAudioStereoOrientation)orientation error:(NSError *)outError
{
  as::client *v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  char v15[4];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  as::client::cache_util::CacheManager **v21;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[AVAudioSession accessor](self, "accessor");
  v15[0] = 1;
  v16 = 3098;
  v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v6 = (as::client *)kdebug_trace();
  if ((unint64_t)(orientation - 1) > 3)
  {
    v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "AVAudioSession_iOS.mm";
      v25 = 1024;
      v26 = 2297;
      _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid value for input orientation.", buf, 0x12u);
    }
    v8 = FormatNSErrorForReturn();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", orientation);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    as::client::api_utils::ServerAccessor::SetProperty(v21, (void *)*MEMORY[0x1E0D49AF0], v7, 1);

    v8 = FormatNSErrorForReturn();
  }
  v10 = v8;
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  v11 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v10;
}

- (AVAudioStereoOrientation)preferredInputOrientation
{
  unsigned int Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  char v8[4];
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s **v14;
  std::__shared_weak_count *v15;

  -[AVAudioSession accessor](self, "accessor");
  v8[0] = 1;
  v9 = 3099;
  v10 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  kdebug_trace();
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v14, (void *)*MEMORY[0x1E0D49AF0], 1);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  v4 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return (unint64_t)Property_DefaultTo;
}

- (AVAudioStereoOrientation)inputOrientation
{
  unsigned int Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  char v8[4];
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_unfair_lock_s **v14;
  std::__shared_weak_count *v15;

  -[AVAudioSession accessor](self, "accessor");
  v8[0] = 1;
  v9 = 3100;
  v10 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v11 = 0;
  v12 = 0;
  v13 = 0;
  kdebug_trace();
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v14, (void *)*MEMORY[0x1E0D496E0], 1);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v8);
  v4 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return (unint64_t)Property_DefaultTo;
}

- (AVAudioSessionPromptStyle)promptStyle
{
  uint64_t v3;
  unsigned int updated;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3122;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = *(_QWORD *)(v11 + 24);
  v19[0] = &off_1E424F340;
  v19[1] = &v11;
  v20 = v19;
  updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 296, (uint64_t)v19);
  v5 = v20;
  if (v20 == v19)
  {
    v6 = 4;
    v5 = v19;
    goto LABEL_5;
  }
  if (v20)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return (unint64_t)updated;
}

- (BOOL)setAllowHapticsAndSystemSoundsDuringRecording:(BOOL)inValue error:(NSError *)outError
{
  _BOOL8 v4;
  as::client *v6;
  NSObject *v7;
  const char *v8;
  as::client::cache_util::CacheManager **v9;
  void *v10;
  char v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  char v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[18];
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v4 = inValue;
  v25 = *MEMORY[0x1E0C80C00];
  v16[0] = 1;
  v17 = 3078;
  v18 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v6 = (as::client *)kdebug_trace();
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = "FALSE";
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v8 = "TRUE";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2350;
    v23 = 2080;
    v24 = v8;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> %s", buf, 0x1Cu);
  }
  -[AVAudioSession accessor](self, "accessor");
  v9 = *(as::client::cache_util::CacheManager ***)buf;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v9, (void *)*MEMORY[0x1E0D494B8], v10, 1);

  v11 = FormatNSErrorForReturn();
  v12 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
  return v11;
}

- (BOOL)allowHapticsAndSystemSoundsDuringRecording
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3079;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D494B8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (id)audioFormats
{
  return as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49A00]);
}

- (void)privateSubscribeToMicrophoneInjectionCapabilityChangeNotification
{
  void *v3;
  void *v4;
  as::client *v5;
  NSObject *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE buf[18];
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v5));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2395;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d Subscribing to MicrophoneInjectionCapabilityChangeNotification for process:%@", buf, 0x1Cu);
  }
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(*(as::client::cache_util::CacheManager ***)buf, CFSTR("SubscribeToMicrophoneInjectionCapabilityChangeNotification"), v4, 0);
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v7 = v11;
  *(_BYTE *)(v12 + 340) = 1;
  if (v7)
    os_unfair_recursive_lock_unlock();
  v8 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v9 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

}

- (unsigned)privateShouldSubscribeToMicrophoneInjectionCapabilityChangeNotification
{
  unsigned __int8 v2;
  uint64_t v4;
  uint64_t v5;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v2 = *(_BYTE *)(v5 + 340);
  if (v4)
    os_unfair_recursive_lock_unlock();
  return v2;
}

- (void)handleMediaDaemonTerminationEvent:(int)a3 daemonName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *shared_owners;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  dispatch_time_t v15;
  id v16;
  NSObject *v17;
  id v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  id location;
  std::__shared_weak_count *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v8 = v28;
  shared_owners = (std::__shared_weak_count *)v28[3].__shared_owners_;
  location = v28[3].__vftable;
  v26 = shared_owners;
  if (shared_owners)
  {
    p_shared_owners = (unint64_t *)&shared_owners->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v8 = v28;
  }
  as::client::AVAudioSessionDaemonsStateManager::processServiceTermination((uint64_t)&v8[3].__shared_weak_owners_, v7, (int **)&location);
  v12 = v26;
  if (v26)
  {
    v13 = (unint64_t *)&v26->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (v27)
    os_unfair_recursive_lock_unlock();
  -[AVAudioSession accessor](self, "accessor");
  v15 = dispatch_time(0, 500000000);
  v16 = *(id *)(*(_QWORD *)(v27 + 56) + 16);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVAudioSession_handleMediaDaemonTerminationEvent_daemonName___block_invoke;
  block[3] = &unk_1E4250008;
  v17 = v16;
  objc_copyWeak(&v24, &location);
  v18 = v7;
  v23 = v18;
  dispatch_after(v15, v17, block);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  v19 = v28;
  if (v28)
  {
    v20 = (unint64_t *)&v28->__shared_owners_;
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

void __63__AVAudioSession_handleMediaDaemonTerminationEvent_daemonName___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  int *v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  uint64_t v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "privateGetGuardOfImplementation");
    v4 = v14;
    v5 = *(std::__shared_weak_count **)(v14 + 80);
    v11 = *(int **)(v14 + 72);
    v12 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v4 = v14;
    }
    as::client::AVAudioSessionDaemonsStateManager::processServiceReset(v4 + 88, *(void **)(a1 + 32), &v11);
    v8 = v12;
    if (v12)
    {
      v9 = (unint64_t *)&v12->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    if (v13)
      os_unfair_recursive_lock_unlock();
  }

}

- (int64_t)audioFormat
{
  as::client::api_utils *v3;
  NSString *v4;
  int64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3330;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v10, (void *)*MEMORY[0x1E0D49640]);
  v3 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  v5 = as::client::api_utils::TranslateFromMXAudioHardwareFormat(v3, v4);

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (BOOL)setPreferredAudioFormat:(int64_t)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3456;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::TranslateToMXAudioHardwareFormat((as::client::api_utils *)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49A40], v6, 1);
  v7 = FormatNSErrorForReturn();

  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (int64_t)preferredAudioFormat
{
  as::client::api_utils *v3;
  NSString *v4;
  int64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3457;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v10, (void *)*MEMORY[0x1E0D49A40]);
  v3 = (as::client::api_utils *)objc_claimAutoreleasedReturnValue();
  v5 = as::client::api_utils::TranslateFromMXAudioHardwareFormat(v3, v4);

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (BOOL)isDolbyDigitalEncoderAvailable
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3332;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, CFSTR("DolbyDigitalEncoderAvailable"), 0);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)isEarpieceActiveNoiseCancelationEnabled
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3334;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, CFSTR("EarpieceANCEnabled"), 0);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)forceSoundCheck
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3336;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D497B0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)lastActivationStoppedNowPlayingApp
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3382;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D499B0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)requiresNoAudioResources
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3338;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49760], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)allowMixableAudioWhileRecording
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3340;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D494A8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setAllowMixableAudioWhileRecording:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3341;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D494A8], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)participatesInNowPlayingAppPolicy
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3342;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D498B0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)eligibleForBTSmartRoutingConsideration
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3344;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49898], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setEligibleForBTSmartRoutingConsideration:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3345;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49898], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)eligibleForBTTriangleConsideration
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3433;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D498A8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setEligibleForBTTriangleConsideration:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3434;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D498A8], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)prefersToAcquireHWControlFromOtherSessions
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3346;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B88], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPrefersToAcquireHWControlFromOtherSessions:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3347;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B88], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)inhibitSpeechDetection
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3447;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B68], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return !Property_DefaultTo;
}

- (BOOL)setInhibitSpeechDetection:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3448;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B68], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)prefersNoMicrophoneUsageIndicator
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3348;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B70], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoMicrophoneUsageIndicator:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3349;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B70], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)participatesInMutePriority
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3350;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D499C8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return !Property_DefaultTo;
}

- (BOOL)setParticipatesInMutePriority:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3351;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D499C8], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)recordingFromRemoteInput
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3352;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, CFSTR("RecordingFromRemoteInput"), 0);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3353;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, CFSTR("RecordingFromRemoteInput"), v6, 0);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (void)setAllowAllBuiltInDataSources:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v4 = v5;
  *(_BYTE *)(v6 + 280) = a3;
  if (v4)
    os_unfair_recursive_lock_unlock();
}

- (BOOL)setBypassRingerSwitchPolicy:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3383;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49818], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setInterruptionFadeDuration:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3385;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49860], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  as::client::cache_util::CacheManager **v18;
  std::__shared_weak_count *v19;
  char v20[4];
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v20[0] = 1;
  v21 = 3386;
  v22 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v23 = 0;
  v24 = 0;
  v25 = 0;
  kdebug_trace();
  v9 = (id)*MEMORY[0x1E0D49770];
  v26[0] = v9;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v10;
  v11 = (id)*MEMORY[0x1E0D49CA8];
  v26[1] = v11;
  v12 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!v7)
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetBatchProperties(v18, v13, 0, 1, 1, 0);
  v14 = FormatNSErrorForReturn();
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v20);
  return v14;
}

- (BOOL)setDuckToLevelScalar:(id)a3 unduckToLevelScalar:(id)a4 error:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  as::client::cache_util::CacheManager **v17;
  std::__shared_weak_count *v18;
  char v19[4];
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v19[0] = 1;
  v20 = 3446;
  v21 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v22 = 0;
  v23 = 0;
  v24 = 0;
  kdebug_trace();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (v7 | v8)
  {
    if (v7)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D49790]);
    if (v8)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D49CB8]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D49790]);

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D49CB8]);

  }
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetBatchProperties(v17, v10, 0, 1, 1, 0);
  v13 = FormatNSErrorForReturn();
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)())v18->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
  return v13;
}

- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3387;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49780], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3388;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49790], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)isExpanseMediaSession
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v4;
  os_unfair_lock_s **v6;
  std::__shared_weak_count *v7;

  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, (void *)*MEMORY[0x1E0D498C8], 1);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return Property_DefaultTo;
}

- (BOOL)setIsExpanseMediaSession:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D498C8], v5, 1);

  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (BOOL)prefersAggressiveCaching
{
  char CachingPreference;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v6;
  std::__shared_weak_count *v7;

  -[AVAudioSession accessor](self, "accessor");
  CachingPreference = as::client::cache_util::CacheManager::getCachingPreference(*(os_unfair_lock_s **)(v6 + 72));
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return CachingPreference;
}

- (BOOL)setPrefersAggressiveCaching:(BOOL)a3 error:(id *)a4
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[AVAudioSession accessor](self, "accessor");
  as::client::cache_util::CacheManager::setCachingPreference(*(os_unfair_lock_s **)(v9 + 72), a3);
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return FormatNSErrorForReturn();
}

- (BOOL)prefersConcurrentAirPlayAudio
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v4;
  os_unfair_lock_s **v6;
  std::__shared_weak_count *v7;

  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, (void *)*MEMORY[0x1E0D49B10], 1);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return Property_DefaultTo;
}

- (BOOL)setPrefersConcurrentAirPlayAudio:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49B10], v5, 1);

  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (BOOL)isHardwareFormatFixedToMultiChannel
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3354;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49740], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)fixHardwareFormatToMultiChannel:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3355;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49740], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (float)inputGain
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49858], 1);
}

- (id)privateGetDataSources:(BOOL)a3 accessor:(const void *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AVAudioSession *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[2];
  BOOL v15;
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(*(_QWORD *)a4 + 24);
  v6 = v5 + 104;
  v7 = v5 + 152;
  if (a3)
    v8 = v6;
  else
    v8 = v7;
  v9 = self;
  v14[0] = &off_1E424ED38;
  v14[1] = v9;
  v15 = a3;
  v16 = v14;
  as::client::KVOProperty<NSArray * {__strong}>::UpdateIfDirty(v8, (uint64_t)v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  if (v16 == v14)
  {
    v12 = 4;
    v11 = v14;
    goto LABEL_8;
  }
  if (v16)
  {
    v12 = 5;
LABEL_8:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }

  return v10;
}

- (id)privateGetSelectedDataSource:(BOOL)a3 accessor:(const void *)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v4 = a3;
  -[AVAudioSession privateGetCurrentRoute:](self, "privateGetCurrentRoute:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "inputs");
  else
    objc_msgSend(v6, "outputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  objc_msgSend(v9, "selectedDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    os_unfair_recursive_lock_unlock();

  return v10;
}

- (NSArray)inputDataSources
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3107;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetDataSources:accessor:](self, "privateGetDataSources:accessor:", 1, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (NSArray *)v3;
}

- (AVAudioSessionDataSourceDescription)inputDataSource
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3108;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetSelectedDataSource:accessor:](self, "privateGetSelectedDataSource:accessor:", 1, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (AVAudioSessionDataSourceDescription *)v3;
}

- (NSArray)outputDataSources
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3110;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetDataSources:accessor:](self, "privateGetDataSources:accessor:", 0, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (NSArray *)v3;
}

- (AVAudioSessionDataSourceDescription)outputDataSource
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3111;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetSelectedDataSource:accessor:](self, "privateGetSelectedDataSource:accessor:", 0, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return (AVAudioSessionDataSourceDescription *)v3;
}

- (BOOL)isInputGainSettable
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3105;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49840], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)getInputAvailable
{
  BOOL v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v8;
  std::__shared_weak_count *v9;

  -[AVAudioSession accessor](self, "accessor");
  v3 = -[AVAudioSession privateGetInputAvailable:](self, "privateGetInputAvailable:", &v8);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return v3;
}

- (BOOL)isInputAvailable
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49C98], 1);
}

- (NSTimeInterval)outputLatency
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3117;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D496B8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)inputSafetyOffset
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3371;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D48668], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)outputSafetyOffset
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3372;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D48678], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (id)activeSessionDisplayIDs
{
  as::client *v3;
  as::client *v4;
  as::client *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3368;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSString *> * {__strong}>(v11, (void *)*MEMORY[0x1E0D48698]);
  v3 = (as::client *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v3 = (as::client *)-[as::client count](v3, "count")) != 0)
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v3));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3149;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get DisplayIDsOfActiveSessions", buf, 0x12u);
    }
    v5 = (as::client *)MEMORY[0x1E0C9AA60];
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v5;
}

- (id)supportedOutputChannelLayouts
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3135;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray * {__strong}>(v11, (void *)*MEMORY[0x1E0D49C90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    as::client::api_utils::TranslateOutputChannelLayoutsFromMX(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3191;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get SupportedOutputChannelLayouts failed", buf, 0x12u);
    }
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v5;
}

- (unint64_t)speechDetectionStyle
{
  uint64_t v3;
  unsigned int updated;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3449;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = *(_QWORD *)(v11 + 24);
  v19[0] = &off_1E424EC60;
  v19[1] = &v11;
  v20 = v19;
  updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 536, (uint64_t)v19);
  v5 = v20;
  if (v20 == v19)
  {
    v6 = 4;
    v5 = v19;
    goto LABEL_5;
  }
  if (v20)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return updated;
}

- (int64_t)interruptionPriority
{
  int Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3381;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<int>(v8, (void *)*MEMORY[0x1E0D495F8], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (double)preferredSampleRate
{
  __CFString *v3;
  double Property_DefaultTo;
  double v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3091;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateGetCategory:](self, "privateGetCategory:", &v10);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 == CFSTR("AVAudioSessionCategoryRecord"))
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v10, (void *)*MEMORY[0x1E0D49A88], 1);
  else
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v10, (void *)*MEMORY[0x1E0D49AD0], 1);
  v5 = Property_DefaultTo;
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (unint64_t)preferredIOBufferFrameSize
{
  unint64_t Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3374;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned long>(v8, (void *)*MEMORY[0x1E0D49A68], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (NSInteger)preferredInputNumberOfChannels
{
  NSInteger Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3095;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v8, (void *)*MEMORY[0x1E0D49AB0], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (NSInteger)preferredOutputNumberOfChannels
{
  NSInteger Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3097;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v8, (void *)*MEMORY[0x1E0D49AC0], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (NSInteger)inputNumberOfChannels
{
  uint64_t v3;
  unsigned int updated;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3114;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = *(_QWORD *)(v11 + 24);
  v19[0] = &off_1E424ECA8;
  v19[1] = &v11;
  v20 = v19;
  updated = as::client::KVOProperty<unsigned int>::UpdateIfDirty(v3 + 344, (uint64_t)v19);
  v5 = v20;
  if (v20 == v19)
  {
    v6 = 4;
    v5 = v19;
    goto LABEL_5;
  }
  if (v20)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return updated;
}

- (NSInteger)maximumInputNumberOfChannels
{
  NSInteger Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3101;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<long>(v8, (void *)*MEMORY[0x1E0D49978], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo;
}

- (NSArray)availableModes
{
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVAudioSessionModeDefault");
  v3[1] = CFSTR("AVAudioSessionModeVoiceChat");
  v3[2] = CFSTR("AVAudioSessionModeVideoRecording");
  v3[3] = CFSTR("AVAudioSessionModeMeasurement");
  v3[4] = CFSTR("AVAudioSessionModeMoviePlayback");
  v3[5] = CFSTR("AVAudioSessionModeVideoChat");
  v3[6] = CFSTR("AVAudioSessionModeSpokenAudio");
  v3[7] = CFSTR("AVAudioSessionModeVoicePrompt");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 8);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)privateSetRouteSharingPolicy:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;

  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49BE8], v6, 1);

  atomic_store((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1, (unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 42));
  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v7;
}

- (BOOL)privateNeedsTranslationForNoSpeakerCategory:(id)a3 accessor:(const void *)a4
{
  return 0;
}

- (id)auditTokensForProcessAssertion
{
  void *v3;
  void *v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3391;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSData *> * {__strong}>(v10, (void *)*MEMORY[0x1E0D49BA8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (BOOL)setAuditTokensForProcessAssertion:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3392;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49BA8], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (id)powerBudget
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3395;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v11, (void *)*MEMORY[0x1E0D49A30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3469;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get powerBudget failed", buf, 0x12u);
    }
    v5 = (id)MEMORY[0x1E0C9AA70];
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v5;
}

- (id)powerProfile
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v13[0] = 1;
  v14 = 3393;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v11, (void *)*MEMORY[0x1E0D49A38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 3483;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get powerProfile failed", buf, 0x12u);
    }
    v5 = (id)MEMORY[0x1E0C9AA70];
  }

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v5;
}

- (BOOL)setPowerProfile:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3394;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49A38], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)setRoutingContextUID:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3398;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49C00], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (id)hostProcessAttribution
{
  void *v3;
  void *v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3399;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyAVAS_DefaultToZero<NSArray<NSString *> * {__strong}>(v10, CFSTR("AS_HostProcessAttribution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (BOOL)setHostProcessAttribution:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3400;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, CFSTR("AS_HostProcessAttribution"), v5, 0);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)selectIndependentRoutingContext:(id *)a3
{
  char v6[4];
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[0] = 1;
  v7 = 3401;
  v8 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v9 = 0;
  v10 = 0;
  v11 = 0;
  kdebug_trace();
  LOBYTE(a3) = -[AVAudioSession privateSetRouteSharingPolicy:error:](self, "privateSetRouteSharingPolicy:error:", 2, a3);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v6);
  return (char)a3;
}

- (BOOL)overrideOutputAudioPort:(AVAudioSessionPortOverride)portOverride error:(NSError *)outError
{
  __CFString *v6;
  int v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[0] = 1;
  v15 = 3082;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  if (portOverride == AVAudioSessionPortOverrideSpeaker)
    v6 = CFSTR("Speaker");
  else
    v6 = 0;
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v12, (void *)*MEMORY[0x1E0D499E8], v6, 1);
  v7 = FormatNSErrorForReturn();
  if (v7)
  {
    v8 = *(_QWORD *)(v12 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(_BYTE *)(v8 + 192) = 1;
    *(_BYTE *)(v8 + 240) = 1;
    os_unfair_recursive_lock_unlock();
  }
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v7;
}

- (BOOL)setPreferredInput:(AVAudioSessionPortDescription *)inPort error:(NSError *)outError
{
  AVAudioSessionPortDescription *v6;
  as::client *v7;
  NSObject *v8;
  void *v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v27;
  char v28[4];
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[18];
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = inPort;
  v28[0] = 1;
  v29 = 3083;
  v30 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v7 = (as::client *)kdebug_trace();
  v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[AVAudioSessionPortDescription portName](v6, "portName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3614;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d ---> inPort: %@", buf, 0x1Cu);

  }
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v11 = *(_QWORD *)(*(_QWORD *)&buf[8] + 72);
  v10 = *(std::__shared_weak_count **)(*(_QWORD *)&buf[8] + 80);
  v27 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  if (v6)
  {
    v14 = (void *)MEMORY[0x1E0C99D80];
    -[AVAudioSessionPortDescription privateGetID](v6, "privateGetID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("SelectedRouteDescription_RouteID"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)MEMORY[0x1E0D49AA0];
  }
  else
  {
    v18 = *(void **)(*(_QWORD *)&buf[8] + 136);
    if (!v18)
    {
      LOBYTE(v22) = 1;
      goto LABEL_14;
    }
    v19 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v18, "privateGetID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v15, CFSTR("SelectedRouteDescription_RouteID"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)MEMORY[0x1E0D49720];
  }

  v20 = *v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v11, v20, v21, 1);
  v22 = FormatNSErrorForReturn();
  if (v22 && (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 136), "isEqual:", v6) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 136), inPort);
    v23 = *(_QWORD *)(v11 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(_BYTE *)(v23 + 144) = 1;
    os_unfair_recursive_lock_unlock();
  }

LABEL_14:
  if (v27)
  {
    v24 = (unint64_t *)&v27->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (*(_QWORD *)buf)
    os_unfair_recursive_lock_unlock();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v28);

  return v22;
}

- (AVAudioSessionPortDescription)preferredInput
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17[0] = 1;
  v18 = 3084;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  copyInputPortPreference((as::client *)-[AVAudioSession opaqueSessionID](self, "opaqueSessionID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)-[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation")));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(v16 + 136), "portName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "AVAudioSession_iOS.mm";
    v25 = 1024;
    v26 = 3655;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_19EF50000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d Current input port preference: %@", buf, 0x1Cu);

  }
  v6 = *(void **)(v16 + 136);
  if (v6)
  {
    objc_msgSend(v6, "privateGetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "isEqualToNumber:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = *(void **)(v16 + 136);
      *(_QWORD *)(v16 + 136) = 0;

      if (v3)
      {
        v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v6));
        v6 = (void *)os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v6)
        {
          *(_DWORD *)buf = 136315394;
          v24 = "AVAudioSession_iOS.mm";
          v25 = 1024;
          v26 = 3665;
          _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Unexpected input port preference", buf, 0x12u);
        }
      }
    }
  }
  v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v6));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(v16 + 136), "portName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "AVAudioSession_iOS.mm";
    v25 = 1024;
    v26 = 3668;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d Returning: %@", buf, 0x1Cu);

  }
  v13 = *(id *)(v16 + 136);
  if (v15)
    os_unfair_recursive_lock_unlock();

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return (AVAudioSessionPortDescription *)v13;
}

- (id)activeAudioRoute
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;

  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v7, (void *)*MEMORY[0x1E0D49490]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return v2;
}

- (BOOL)setSupportsMultichannelContent:(BOOL)inValue error:(NSError *)outError
{
  _BOOL4 v4;
  id *v6;
  id v7;
  char v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  as::client::cache_util::CacheManager **v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = inValue;
  v14[0] = 1;
  v15 = 3126;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  v6 = (id *)MEMORY[0x1E0D49F18];
  if (!v4)
    v6 = (id *)MEMORY[0x1E0D49F20];
  v7 = *v6;
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v12, (void *)*MEMORY[0x1E0D49588], v7, 1);
  v8 = FormatNSErrorForReturn();
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v8;
}

- (BOOL)supportsMultichannelContent
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12[0] = 1;
  v13 = 3127;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v10, (void *)*MEMORY[0x1E0D49588]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D49F20]) ^ 1;
  }
  else
  {
    v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "AVAudioSession_iOS.mm";
      v20 = 1024;
      v21 = 3731;
      _os_log_impl(&dword_19EF50000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Get supportsMultichannelContent failed", buf, 0x12u);
    }
    LOBYTE(v5) = 0;
  }

  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (BOOL)setPrefersInterruptionOnRouteDisconnect:(BOOL)inValue error:(NSError *)outError
{
  _BOOL8 v4;
  char v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v11[8];
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = inValue;
  v13[0] = 1;
  v14 = 3133;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privateSetPrefersInterruptionOnRouteDisconnect:accessor:](self, "privateSetPrefersInterruptionOnRouteDisconnect:accessor:", v4, v11);
  v6 = FormatNSErrorForReturn();
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v6;
}

- (BOOL)prefersInterruptionOnRouteDisconnect
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3134;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B20], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setAudioClockDevice:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3421;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D49510], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (id)audioClockDevice
{
  void *v3;
  void *v4;
  __CFString *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  os_unfair_lock_s **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v12[0] = 1;
  v13 = 3420;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v10, (void *)*MEMORY[0x1E0D49510]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = &stru_1E4250BD8;

  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);
  return v5;
}

- (double)speechDetectionDeviceSampleRate
{
  double Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3379;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E0D496D8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)siriSpeechDetectionDeviceSampleRate
{
  double Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3379;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E0D496D8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (id)privateMakePreferredPersistentRouteDictWithInputUIDs:(id)a3 outputUIDs:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v5)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D49E10]);
    if (v6)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D49E18]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)privateReadPreferredPersistentRoute
{
  void *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3445;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v8, (void *)*MEMORY[0x1E0D49AD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v3;
}

- (BOOL)setPreferredPersistentInputUIDs:(id)a3 outputUIDs:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  as::client::cache_util::CacheManager **v14;
  std::__shared_weak_count *v15;
  char v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  v8 = a4;
  v16[0] = 1;
  v17 = 3444;
  v18 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v19 = 0;
  v20 = 0;
  v21 = 0;
  kdebug_trace();
  -[AVAudioSession privateMakePreferredPersistentRouteDictWithInputUIDs:outputUIDs:](self, "privateMakePreferredPersistentRouteDictWithInputUIDs:outputUIDs:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v14, (void *)*MEMORY[0x1E0D49AD8], v9, 1);
  v10 = FormatNSErrorForReturn();
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v15->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
  return v10;
}

- (id)preferredPersistentInputUIDs
{
  void *v2;
  void *v3;

  -[AVAudioSession privateReadPreferredPersistentRoute](self, "privateReadPreferredPersistentRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D49E10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredPersistentOutputUIDs
{
  void *v2;
  void *v3;

  -[AVAudioSession privateReadPreferredPersistentRoute](self, "privateReadPreferredPersistentRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D49E18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)delegate
{
  return (id)gAudioSessionDelegate;
}

- (void)setDelegate:(id)delegate
{
  objc_storeStrong((id *)&gAudioSessionDelegate, delegate);
}

- (BOOL)setActivationContext:(id)a3 error:(id *)a4
{
  id v5;
  NSDictionary *v6;
  as::client::api_utils *v7;
  NSMutableDictionary *v8;
  void *v9;
  int v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t v15;
  std::__shared_weak_count *v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  v17[0] = 1;
  v18 = 3367;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  if (as::client::api_utils::ValidateActivationContext((as::client::api_utils *)v5, v6))
  {
    -[AVAudioSession accessor](self, "accessor");
    v7 = (as::client::api_utils *)objc_msgSend(v5, "mutableCopy");
    as::client::api_utils::TranslateActivationContextForMX(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v15, (void *)*MEMORY[0x1E0D49480], v9, 1);

    v10 = FormatNSErrorForReturn();
    if (v10)
    {
      v11 = *(_QWORD *)(v15 + 24);
      os_unfair_recursive_lock_lock_with_options();
      *(_BYTE *)(v11 + 144) = 1;
      *(_BYTE *)(v11 + 192) = 1;
      os_unfair_recursive_lock_unlock();
    }
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)())v16->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    LOBYTE(v10) = FormatNSErrorForReturn();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);

  return v10;
}

- (BOOL)setDisallowedPorts:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v12[0] = 1;
  v13 = 3370;
  v14 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v10, (void *)*MEMORY[0x1E0D497A8], v5, 1);
  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

  return v6;
}

- (BOOL)silenceOutput:(unint64_t)a3 error:(id *)a4
{
  char v4;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  as::client *v12;
  as::client *v13;
  NSObject *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _BYTE v22[40];
  char v23[4];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  as::client *v34;
  void *v35;
  _BYTE v36[24];
  _BYTE *v37;
  id v38;
  uint64_t v39;

  v4 = (char)a4;
  v39 = *MEMORY[0x1E0C80C00];
  v23[0] = 1;
  v24 = 3376;
  v25 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v26 = 0;
  v27 = 0;
  v28 = 0;
  kdebug_trace();
  v7 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  PerformanceTracker::PerformanceTracker((uint64_t)v22, (uint64_t)"-[AVAudioSession silenceOutput:error:]", v7, 1);
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)(v20 + 56), &v35);
  v8 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v35);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "silenceOutput:options:reply:", v10, a3, v11);

  objc_autoreleasePoolPop(v8);
  v12 = (as::client *)v38;
  v13 = v12;
  if (v12)
  {
    v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v12));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "AVAudioSession_iOS.mm";
      v31 = 1024;
      v32 = 4029;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error: %@", buf, 0x1Cu);
    }
    -[as::client code](v13, "code");
    v4 = FormatNSErrorForReturn();
  }

  v15 = v37;
  if (v37 == v36)
  {
    v16 = 4;
    v15 = v36;
    goto LABEL_9;
  }
  if (v37)
  {
    v16 = 5;
LABEL_9:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v22);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v23);
  return (v13 == 0) | v4 & 1;
}

- (BOOL)isSessionInputMuted
{
  unsigned __int8 v3;
  BOOL Property_DefaultTo;
  BOOL v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  os_unfair_lock_s **v9;
  std::__shared_weak_count *v10;
  char v11[4];
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v11[0] = 1;
  v12 = 3377;
  v13 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v14 = 0;
  v15 = 0;
  v16 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  {
    as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::AudioSessionMuteEnabled(void)::enabled)
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v9, (void *)*MEMORY[0x1E0D49920], 1);
  else
    Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v9, CFSTR("MuteSessionInputs"), 0);
  v5 = Property_DefaultTo;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)())v10->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
  return v5;
}

- (BOOL)muteSessionInput:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3378;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, CFSTR("MuteSessionInputs"), v6, 0);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (id)defaultChatMode
{
  NSString *v3;
  NSString *v4;
  __CFString *v5;
  __CFString *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  os_unfair_lock_s **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3441;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(v11, (void *)*MEMORY[0x1E0D49708]);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    TranslateMXModeToAVASModeString(v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("AVAudioSessionModeDefault");
  }
  v6 = v5;

  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v6;
}

- (BOOL)setDefaultChatMode:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id *v8;
  id v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  as::client::cache_util::CacheManager **v13;
  std::__shared_weak_count *v14;
  char v15[4];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v15[0] = 1;
  v16 = 3366;
  v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v18 = 0;
  v19 = 0;
  v20 = 0;
  kdebug_trace();
  if (objc_msgSend(v6, "compare:", CFSTR("AVAudioSessionModeVoiceChat")))
  {
    if (objc_msgSend(v6, "compare:", CFSTR("AVAudioSessionModeGameChat")))
    {
      if (objc_msgSend(v6, "compare:", CFSTR("AVAudioSessionModeVideoChat")))
      {
        if (objc_msgSend(v6, "compare:", CFSTR("AVAudioSessionModeVideoChatForMedia")))
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
            v7 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v7 = 0;
          }
          goto LABEL_17;
        }
        v8 = (id *)MEMORY[0x1E0D491D0];
      }
      else
      {
        v8 = (id *)MEMORY[0x1E0D491C0];
      }
    }
    else
    {
      v8 = (id *)MEMORY[0x1E0D490B0];
    }
  }
  else
  {
    v8 = (id *)MEMORY[0x1E0D491F0];
  }
  v9 = *v8;
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty(v13, (void *)*MEMORY[0x1E0D49708], v9, 1);
  v7 = FormatNSErrorForReturn();
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }

LABEL_17:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);

  return v7;
}

- (BOOL)prefersNoInterruptionsFromSystemAlerts
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3086;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B50], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoInterruptionsFromSystemAlerts:(BOOL)inValue error:(NSError *)outError
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = inValue;
  v13[0] = 1;
  v14 = 3085;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B50], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)setPreferredMicrophoneInjectionMode:(int64_t)a3 error:(id *)a4
{
  void *v5;
  char v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  as::client::cache_util::CacheManager **v10;
  std::__shared_weak_count *v11;

  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v10, CFSTR("PreferredMicrophoneInjectionMode"), v5, 0);

  v6 = FormatNSErrorForReturn();
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v11->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return v6;
}

- (int64_t)preferredMicrophoneInjectionMode
{
  unsigned int Property_DefaultTo;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;

  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v7, CFSTR("PreferredMicrophoneInjectionMode"), 0);
  v3 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  return Property_DefaultTo;
}

- (BOOL)isMicrophoneInjectionAvailable
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v4;
  os_unfair_lock_s **v6;
  std::__shared_weak_count *v7;

  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, CFSTR("MicrophoneInjectionIsEnabled"), 0);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return Property_DefaultTo;
}

- (BOOL)isMicrophoneInjectionAllowedByUser
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v4;
  os_unfair_lock_s **v6;
  std::__shared_weak_count *v7;

  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v6, CFSTR("MicrophoneInjectionIsAllowedByUser"), 0);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)())v7->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return Property_DefaultTo;
}

- (BOOL)prefersNoDucking
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3358;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B40], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPrefersNoDucking:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3359;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B40], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)needsHighPowerBudgeting
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3360;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D499A0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setNeedsHighPowerBudgeting:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3361;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D499A0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)participatesInVolumePolicy
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3362;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49D00], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setParticipatesInVolumePolicy:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3363;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49D00], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)prefersToVibeWhenVibrationsAreDisabled
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3364;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49BA0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPrefersToVibeWhenVibrationsAreDisabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3365;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49BA0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (float)defaultCalibratedOutputSPL
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3435;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D49700], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)allowsSpeakerPlayback
{
  return 0;
}

- (BOOL)clearInputPreferences:(id *)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[0] = 1;
  v15 = 3369;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::SetProperty((as::client::cache_util::CacheManager **)v12, (void *)*MEMORY[0x1E0D49720], MEMORY[0x1E0C9AA60], 1);
  v4 = FormatNSErrorForReturn();
  if (v4)
  {
    -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
    v5 = *(void **)(v11 + 136);
    *(_QWORD *)(v11 + 136) = 0;

    if (v10)
      os_unfair_recursive_lock_unlock();
    v6 = *(_QWORD *)(v12 + 24);
    os_unfair_recursive_lock_lock_with_options();
    *(_BYTE *)(v6 + 144) = 1;
    os_unfair_recursive_lock_unlock();
  }
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v4;
}

- (BOOL)setAggregatedIOPreference:(AVAudioSessionIOType)inIOType error:(NSError *)outError
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3125;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", inIOType != AVAudioSessionIOTypeNotSpecified);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49BD0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (BOOL)decoupledIO
{
  BOOL Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3411;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D498D0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)preferredInputSampleRate
{
  double Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3414;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E0D49A88], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (BOOL)setPreferredOutputSampleRate:(double)a3 error:(id *)a4
{
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v13[0] = 1;
  v14 = 3413;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49AD0], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (double)preferredOutputSampleRate
{
  double Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3415;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(v7, (void *)*MEMORY[0x1E0D49AD0], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (double)outputSampleRate
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<double>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D496C8], 1);
}

- (BOOL)setSpeakerThermalGain:(float)a3 error:(id *)a4
{
  double v6;
  void *v7;
  char v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  as::client::cache_util::CacheManager **v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[0] = 1;
  v15 = 3406;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v12, (void *)*MEMORY[0x1E0D486B8], v7, 1);

  v8 = FormatNSErrorForReturn();
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v8;
}

- (BOOL)setHapticThermalGain:(float)a3 error:(id *)a4
{
  double v6;
  void *v7;
  char v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  as::client::cache_util::CacheManager **v12;
  std::__shared_weak_count *v13;
  char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v14[0] = 1;
  v15 = 3408;
  v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v17 = 0;
  v18 = 0;
  v19 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  *(float *)&v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v12, (void *)*MEMORY[0x1E0D486A8], v7, 1);

  v8 = FormatNSErrorForReturn();
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)())v13->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v14);
  return v8;
}

- (float)speakerThermalGain
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3407;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D486B8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (float)hapticThermalGain
{
  float Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3409;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<float>(v7, (void *)*MEMORY[0x1E0D486A8], 1);
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (void)privateInputIsAvailableChanged:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVAudioSession_privateInputIsAvailableChanged___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__AVAudioSession_privateInputIsAvailableChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = gAudioSessionDelegate;
  if (gAudioSessionDelegate)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)gAudioSessionDelegate, "inputIsAvailableChanged:", *(unsigned __int8 *)(a1 + 32));
  }
  return result;
}

- (id)privateGetCategory:(const void *)a3
{
  os_unfair_lock_s **v5;
  id v6;
  uint64_t v7;
  NSString *v8;
  as::client *v9;
  __CFString *v10;
  as::client *v11;
  __CFString *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = *(os_unfair_lock_s ***)a3;
  v6 = (id)*MEMORY[0x1E0D494F8];
  v7 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero_WithAnalytics<NSString * {__strong}>(v5, v6, v7, (uint64_t)"-[AVAudioSession privateGetCategory:]");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v9));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 4478;
      v14 = "%25s:%-5d Failed to get category";
      v15 = v17;
      v16 = 18;
      goto LABEL_9;
    }
LABEL_10:
    v10 = &stru_1E4250BD8;
    goto LABEL_11;
  }
  TranslateMXCategoryToAVASCategoryString(v8);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = (as::client *)-[AVAudioSession privateNeedsTranslationForNoSpeakerCategory:accessor:](self, "privateNeedsTranslationForNoSpeakerCategory:accessor:", v10, a3);
  if ((_DWORD)v11)
  {
    v12 = CFSTR("AVAudioSessionCategoryPlayback");

    v10 = v12;
  }
  if (!v10)
  {
    v13 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v11));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315650;
      v20 = "AVAudioSession_iOS.mm";
      v21 = 1024;
      v22 = 4486;
      v23 = 2112;
      v24 = v8;
      v14 = "%25s:%-5d No valid string for category: %@";
      v15 = v13;
      v16 = 28;
LABEL_9:
      _os_log_impl(&dword_19EF50000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v16);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

  return v10;
}

- (int64_t)getCachedOrFromServerReporterID:(const void *)a3
{
  uint64_t v5;
  os_unfair_lock_s **v6;
  id v7;
  void *v8;
  as::client *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  if (!v5)
  {
    v6 = *(os_unfair_lock_s ***)a3;
    v7 = (id)*MEMORY[0x1E0D49BC0];
    as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSArray<NSNumber *> * {__strong}>(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (v9 = (as::client *)objc_msgSend(v8, "count")) != 0)
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "longLongValue");

      atomic_store(v5, (unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
    }
    else
    {
      v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v9));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "AVAudioSession_iOS.mm";
        v15 = 1024;
        v16 = 4500;
        _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get reporterIDs", (uint8_t *)&v13, 0x12u);
      }

      return 0;
    }
  }
  return v5;
}

- (unint64_t)privateGetRouteSharingPolicy:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E0D49BE8], 1);
}

- (id)privateGetCurrentRoute:(const void *)a3
{
  os_unfair_lock_s **v4;
  uint64_t v5;
  void *v6;
  AVAudioSessionRouteDescription *v7;

  v4 = *(os_unfair_lock_s ***)a3;
  v5 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
  as::client::api_utils::ServerAccessor::GetPropertyAVAS_DefaultToZero_WithAnalytics<NSDictionary * {__strong}>(v4, CFSTR("AS_DetailedActiveAudioRoute"), v5, (uint64_t)"-[AVAudioSession privateGetCurrentRoute:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AVAudioSessionRouteDescription initWithRawDescription:owningSession:]([AVAudioSessionRouteDescription alloc], "initWithRawDescription:owningSession:", v6, self);

  return v7;
}

- (BOOL)privateGetInputAvailable:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E0D49C98], 1);
}

- (BOOL)privateSetPrefersInterruptionOnRouteDisconnect:(BOOL)a3 accessor:(const void *)a4
{
  as::client::cache_util::CacheManager **v4;
  void *v5;
  void *v6;

  v4 = *(as::client::cache_util::CacheManager ***)a4;
  v5 = (void *)*MEMORY[0x1E0D49B20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = as::client::api_utils::ServerAccessor::SetProperty(v4, v5, v6, 1) != 0;

  return (char)v4;
}

- (void)privateResetCachedPropertyValues:(const void *)a3
{
  atomic_store(0, (unsigned __int16 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 28));
  as::client::KVOManager::markPropertiesDirtyAll(*(as::client::KVOManager **)(*(_QWORD *)a3 + 24));
}

- (void)privateHandleAvailableSampleRatesChange:(const void *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "AVAudioSession_iOS.mm";
    v8 = 1024;
    v9 = 4553;
    _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available sample rates changed", (uint8_t *)&v6, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionAvailableSampleRatesChangeNotification"), 0, a3);
}

- (void)privateHandleBeaconBudgetChange:(id)a3 accessor:(const void *)a4
{
  as::client *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (as::client *)a3;
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "AVAudioSession_iOS.mm";
    v10 = 1024;
    v11 = 4563;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available Beacon Budget changed", (uint8_t *)&v8, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionBeaconBudgetChangeNotification"), v6, a4);

}

- (void)privateHandlePrefersConcurrentAirPlayAudioChange:(id)a3 accessor:(const void *)a4
{
  as::client *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (as::client *)a3;
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "AVAudioSession_iOS.mm";
    v15 = 1024;
    v16 = 4573;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that available Concurrent Airplay Audio changed", buf, 0x12u);
  }
  v11 = CFSTR("AVAudioSessionConcurrentAirPlayAudioPreferredKey");
  v8 = (id)*MEMORY[0x1E0D49330];
  -[as::client objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v8, CFSTR("AVAudioSessionConcurrentAirPlayAudioPreferredKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionConcurrentAirPlayAudioPreferenceChangeNotification"), v10, a4);
}

- (void)privateHandleRouteControlFeaturesChange:(id)a3 accessor:(const void *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = CFSTR("AVAudioSessionRouteControlChangeOptionsKey");
  v7 = (id)*MEMORY[0x1E0D49340];
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionRouteControlChangeNotification"), v9, a4);
}

- (void)privateHandleMicrophoneInjectionCapabilityChange:(id)a3 accessor:(const void *)a4
{
  as::client *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = (as::client *)a3;
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "AVAudioSession_iOS.mm";
    v10 = 1024;
    v11 = 4605;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that MicrophoneInjection capability changed", (uint8_t *)&v8, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionMicrophoneInjectionCapabilitiesChangeNotification"), v6, a4);

}

- (void)privateHandlePickableRoutesChange:(const void *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "AVAudioSession_iOS.mm";
    v8 = 1024;
    v9 = 4637;
    _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that pickable routes changed", (uint8_t *)&v6, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionPickableRouteChangeNotification"), 0, a3);
}

- (void)privateHandleSecondaryAudioHintChange:(id)a3 accessor:(const void *)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  as::client *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "BOOLValue");
  v18 = CFSTR("AVAudioSessionSilenceSecondaryAudioHintTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v10));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "AVAudioSession_iOS.mm";
    v14 = 1024;
    v15 = 4655;
    v16 = 1024;
    v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
    _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionSilenceSecondaryAudioHintNotification", (uint8_t *)&v12, 0x18u);
  }

  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionSilenceSecondaryAudioHintNotification"), v9, a4);
}

- (void)privateHandleOtherPrimaryAudioPlayStateChange:(const void *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "AVAudioSession_iOS.mm";
    v8 = 1024;
    v9 = 4664;
    _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that play state for other primary audio sessions changed", (uint8_t *)&v6, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionOtherPrimaryAudioPlayStateChangeNotification"), 0, a3);
}

- (void)privateHandleRoutingContextChange:(const void *)a3
{
  AVAudioSessionImplAtomic v5;
  as::client *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5.var0 = (AVAudioSessionImpl *)-[AVAudioSession atomicImpl](self, "atomicImpl");
  v6 = -[AVAudioSession privateGetRouteSharingPolicy:](self, "privateGetRouteSharingPolicy:", a3);
  atomic_store((unint64_t)v6, (unint64_t *)v5.var0 + 4);
  v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "AVAudioSession_iOS.mm";
    v10 = 1024;
    v11 = 4682;
    _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d Notifying listeners that routing context changed", (uint8_t *)&v8, 0x12u);
  }
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionRoutingContextChangeNotification"), 0, a3);
}

- (void)privateHandleActiveNeroVisualStreamInfoDidChange
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "AVAudioSession_iOS.mm";
    v5 = 1024;
    v6 = 4691;
    _os_log_impl(&dword_19EF50000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that ActiveNeroVisualStreamInfo changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentInputDeviceBufferSizeDidChange
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "AVAudioSession_iOS.mm";
    v5 = 1024;
    v6 = 4696;
    _os_log_impl(&dword_19EF50000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentInputDeviceBufferSize changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentOutputDeviceBufferSizeDidChange
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315394;
    v4 = "AVAudioSession_iOS.mm";
    v5 = 1024;
    v6 = 4701;
    _os_log_impl(&dword_19EF50000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentOutputDeviceBufferSize changed", (uint8_t *)&v3, 0x12u);
  }
}

- (void)privateHandleCurrentInputSampleRateDidChange
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  _BYTE buf[18];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4706;
    _os_log_impl(&dword_19EF50000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentInputSampleRate changed", buf, 0x12u);
  }
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionInputSampleRateChangeNotification"), 0, &v15);
  v4 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  -[AVAudioSession inputSampleRate](self, "inputSampleRate");
  v15 = v7;
  as::client::KVOProperty<double>::UpdateAndNotify(*(_QWORD *)(*(_QWORD *)buf + 24) + 584, &v15, 0);
  -[AVAudioSession category](self, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AVAudioSessionCategoryRecord"));

  if (v9)
  {
    -[AVAudioSession sampleRate](self, "sampleRate");
    v14 = v10;
    as::client::KVOProperty<double>::UpdateAndNotify(*(_QWORD *)(*(_QWORD *)buf + 24) + 680, &v14, 0);
  }
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)privateHandleCurrentOutputSampleRateDidChange
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  _BYTE buf[18];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4725;
    _os_log_impl(&dword_19EF50000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d Notifying listeners that CurrentOutputSampleRate changed", buf, 0x12u);
  }
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionOutputSampleRateChangeNotification"), 0, &v15);
  v4 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  -[AVAudioSession outputSampleRate](self, "outputSampleRate");
  v15 = v7;
  as::client::KVOProperty<double>::UpdateAndNotify(*(_QWORD *)(*(_QWORD *)buf + 24) + 632, &v15, 0);
  -[AVAudioSession category](self, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AVAudioSessionCategoryRecord"));

  if ((v9 & 1) == 0)
  {
    -[AVAudioSession sampleRate](self, "sampleRate");
    v14 = v10;
    as::client::KVOProperty<double>::UpdateAndNotify(*(_QWORD *)(*(_QWORD *)buf + 24) + 680, &v14, 0);
  }
  v11 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v12 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)privateHandleBadgeTypeChange:(id)a3
{
  as::client::api_utils *v4;
  NSString *v5;
  void *v6;
  void *v7;
  as::client *v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  int v13;
  _BYTE v14[14];
  __int16 v15;
  unsigned int v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (as::client::api_utils *)a3;
  v17 = CFSTR("AVAudioSessionRenderingModeNewRenderingModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", as::client::api_utils::TranslateFromMXBadgingType(v4, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v8));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    *(_QWORD *)v14 = "AVAudioSession_iOS.mm";
    *(_WORD *)&v14[8] = 1024;
    *(_DWORD *)&v14[10] = 4751;
    v15 = 1024;
    v16 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
    _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionRenderingModeChangeNotification", (uint8_t *)&v13, 0x18u);
  }

  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionRenderingModeChangeNotification"), v7, &v13);
  v10 = *(std::__shared_weak_count **)&v14[4];
  if (*(_QWORD *)&v14[4])
  {
    v11 = (unint64_t *)(*(_QWORD *)&v14[4] + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

}

- (void)privateHandleRenderingCapabilitiesChange:(const void *)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "AVAudioSession_iOS.mm";
    v8 = 1024;
    v9 = 4762;
    v10 = 1024;
    v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
    _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionRenderingCapabilitiesChangeNotification", (uint8_t *)&v6, 0x18u);
  }

  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionRenderingCapabilitiesChangeNotification"), 0, a3);
}

- (void)privateHandleAudioHardwareFormatChange
{
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  _BYTE v8[14];
  __int16 v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    *(_QWORD *)v8 = "AVAudioSession_iOS.mm";
    *(_WORD *)&v8[8] = 1024;
    *(_DWORD *)&v8[10] = 4772;
    v9 = 1024;
    v10 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
    _os_log_impl(&dword_19EF50000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionAudioHardwareFormatChangeNotification", (uint8_t *)&v7, 0x18u);
  }

  -[AVAudioSession accessor](self, "accessor");
  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionAudioHardwareFormatChangeNotification"), 0, &v7);
  v4 = *(std::__shared_weak_count **)&v8[4];
  if (*(_QWORD *)&v8[4])
  {
    v5 = (unint64_t *)(*(_QWORD *)&v8[4] + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

- (BOOL)setPrefersMultichannelAudio:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  unsigned __int16 *v6;
  unsigned int v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  as::client::cache_util::CacheManager **v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[18];
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v17[0] = 1;
  v18 = 3404;
  v19 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  v6 = -[AVAudioSession atomicImpl](self, "atomicImpl");
  v7 = atomic_load(v6 + 14);
  if (v7 >= 0x100 && v4 == v7)
  {
    v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v6));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4794;
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d prefersMultichannelAudio: inValue = %d matches cached value", buf, 0x18u);
    }
    v9 = FormatNSErrorForReturn();
  }
  else
  {
    v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v6));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVAudioSession_iOS.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4797;
      v24 = 1024;
      v25 = v4;
      _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d prefersMultichannelAudio: inValue = %d", buf, 0x18u);
    }
    -[AVAudioSession accessor](self, "accessor");
    v11 = *(as::client::cache_util::CacheManager ***)buf;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D49B30], v12, 1);

    if (!(_DWORD)v11)
      atomic_store(v4 | 0x100, (unsigned __int16 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 28));
    v9 = FormatNSErrorForReturn();
    v13 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
  return v9;
}

- (BOOL)prefersMultichannelAudio
{
  __int16 Property_DefaultTo;
  unint64_t *p_shared_owners;
  unint64_t v5;
  os_unfair_lock_s **v7;
  std::__shared_weak_count *v8;
  char v9[4];
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9[0] = 1;
  v10 = 3405;
  v11 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<BOOL>(v7, (void *)*MEMORY[0x1E0D49B30], 1);
  atomic_store(Property_DefaultTo | 0x100, (unsigned __int16 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 28));
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)())v8->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v9);
  return Property_DefaultTo;
}

- (void)privateUpdateOutputVolume:(id)a3
{
  id v4;
  float v5;
  int v6;
  unsigned __int8 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  float v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(v4, "floatValue");
  v11 = v5;
  v6 = v5 == 1.0 || v5 == 0.0;
  as::client::KVOProperty<float>::UpdateAndNotify(*(_QWORD *)(v12 + 24) + 8, &v11, v6);
  {
    as::ClientSideCachingEnabled(void)::enabled = _os_feature_enabled_impl();
  }
  if (as::ClientSideCachingEnabled(void)::enabled)
    as::client::cache_util::CacheManager::updateCache(*(os_unfair_lock_s **)(v12 + 72), (void *)*MEMORY[0x1E0D49CD0], v4);
  v8 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

}

- (void)privateUpdatePromptStyle:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "unsignedIntValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 296, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)privateUpdateInputGain:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  int v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v11 + 24);
  objc_msgSend(v4, "floatValue");
  v10 = v6;
  as::client::KVOProperty<float>::UpdateAndNotify(v5 + 56, &v10, 0);
  v7 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

}

- (void)privateUpdateSpeechDetectionStyle:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "unsignedIntValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 536, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)privateUpdateInputAvailable
{
  _BOOL8 v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  -[AVAudioSession accessor](self, "accessor");
  v3 = -[AVAudioSession privateGetInputAvailable:](self, "privateGetInputAvailable:", &v9);
  v4 = *(_QWORD *)(v9 + 24) + 488;
  v8 = v3;
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v4, &v8, 0);
  -[AVAudioSession privateInputIsAvailableChanged:](self, "privateInputIsAvailableChanged:", v3);
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (void)privateUpdateAudioFormats:(id)a3
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  id v9;

  v9 = a3;
  -[AVAudioSession accessor](self, "accessor");
  as::client::KVOProperty<NSArray * {__strong}>::UpdateAndNotify(*(_QWORD *)(v7 + 24) + 200, &v9, 0);
  v4 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

}

- (void)privateUpdateAudioFormat:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "unsignedIntValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 248, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)privateUpdateInputChannelCount:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "unsignedIntValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 344, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (void)privateUpdateOutputChannelCount:(id)a3
{
  id v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  v4 = a3;
  -[AVAudioSession accessor](self, "accessor");
  v5 = *(_QWORD *)(v10 + 24);
  v9 = objc_msgSend(v4, "unsignedIntValue");
  as::client::KVOProperty<unsigned int>::UpdateAndNotify(v5 + 392, &v9, 0);
  v6 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

}

- (unint64_t)availableRouteControlOptions:(id *)a3
{
  void *v4;
  void *v5;
  _anonymous_namespace_ *v6;
  NSNumber *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  os_unfair_lock_s **v13;
  std::__shared_weak_count *v14;
  char v15[4];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15[0] = 1;
  v16 = 3452;
  v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID", a3);
  v18 = 0;
  v19 = 0;
  v20 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>(v13, (void *)*MEMORY[0x1E0D49568]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D49570]);
    v6 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("availableRouteControl Options: MX returned %@"), v6);

  }
  else
  {
    v8 = 0;
  }

  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v8;
}

- (BOOL)setPreferredRouteControlConfig:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  char v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  as::client::cache_util::CacheManager **v19;
  std::__shared_weak_count *v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21[0] = 1;
  v22 = 3453;
  v23 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  v6 = v5;
  v8 = objc_msgSend(v6, "routeControlOptions");
  objc_msgSend(v6, "constantOutputVolumeLeveldB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = v8 == 1;

  if (v7)
    v8 = v8 | 2;
  else
    v8 = v8;

  v9 = (id)*MEMORY[0x1E0D49AE8];
  v27 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVAudioSession accessor](self, "accessor");
  if (!as::client::api_utils::ServerAccessor::SetProperty(v19, (void *)*MEMORY[0x1E0D49AE0], v11, 1))
  {
    objc_msgSend(v6, "constantOutputVolumeLeveldB");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      objc_msgSend(v6, "constantOutputVolumeLeveldB");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      as::client::api_utils::ServerAccessor::SetProperty(v19, (void *)*MEMORY[0x1E0D49620], v14, 1);

    }
  }
  v15 = FormatNSErrorForReturn();
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);
  return v15;
}

- (id)privateGetRouteControlConfigWithDictionaryKey:(id)a3 withFeaturesKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _anonymous_namespace_ *v10;
  AVAudioSessionRouteControl *v11;
  NSNumber *v12;
  as::client *v13;
  NSObject *v14;
  AVAudioSessionRouteControl *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  int v20;
  id v21;
  as::client::api_utils::ServerAccessor *v22;
  std::__shared_weak_count *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[AVAudioSession accessor](self, "accessor");
  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSDictionary * {__strong}>((os_unfair_lock_s **)v22, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v10 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(AVAudioSessionRouteControl);
    if ((-[AVAudioSessionRouteControl routeControlOptions](v11, "routeControlOptions") & 2) != 0)
    {
      as::client::api_utils::ServerAccessor::GetProperty((os_unfair_lock_s **)v22, (NSString *)*MEMORY[0x1E0D49620], 1, (uint64_t)&v20);
      if (v20)
      {
        v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v13));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "AVAudioSession_iOS.mm";
          v26 = 1024;
          v27 = 4962;
          v28 = 1024;
          v29 = v20;
          _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Reading ConstantOutputVolumeLeveldB failed with error: %d", buf, 0x18u);
        }

        v15 = 0;
        goto LABEL_10;
      }
      -[AVAudioSessionRouteControl setConstantOutputVolumeLeveldB:](v11, "setConstantOutputVolumeLeveldB:", v21);

    }
    v15 = v11;
LABEL_10:

    goto LABEL_11;
  }
  v15 = 0;
LABEL_11:

  v16 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  return v15;
}

- (id)preferredRouteControlConfig
{
  char v4[4];
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[0] = 1;
  v5 = 3455;
  v6 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v7 = 0;
  v8 = 0;
  v9 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v4);
  -[AVAudioSession privateGetRouteControlConfigWithDictionaryKey:withFeaturesKey:](self, "privateGetRouteControlConfigWithDictionaryKey:withFeaturesKey:", *MEMORY[0x1E0D49AE0], *MEMORY[0x1E0D49AE8]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)routeControlConfig
{
  char v4[4];
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[0] = 1;
  v5 = 3454;
  v6 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v7 = 0;
  v8 = 0;
  v9 = 0;
  kdebug_trace();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v4);
  -[AVAudioSession privateGetRouteControlConfigWithDictionaryKey:withFeaturesKey:](self, "privateGetRouteControlConfigWithDictionaryKey:withFeaturesKey:", *MEMORY[0x1E0D49BD8], *MEMORY[0x1E0D49BE0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDolbyAtmosAvailable
{
  return 0;
}

- (id)IOController
{
  id v3;
  AVAudioIOController_iOS *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  uint64_t v26;
  char v27[4];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v27[0] = 1;
  v28 = 3438;
  v29 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v30 = 0;
  v31 = 0;
  v32 = 0;
  kdebug_trace();
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  if (!*(_QWORD *)(v26 + 248))
  {
    v5 = [AVAudioIOController_iOS alloc];
    v6 = v26;
    v7 = *(std::__shared_weak_count **)(v26 + 56);
    v23 = *(_QWORD *)(v26 + 48);
    v24 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      v6 = v26;
    }
    v10 = *(std::__shared_weak_count **)(v6 + 224);
    v21 = *(_QWORD *)(v6 + 216);
    v22 = v10;
    if (v10)
    {
      v11 = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      v6 = v26;
    }
    v13 = -[AVAudioIOController_iOS initWithSession:xpcConnection:deviceTimeClient:timingSlot:isDecoupledInput:](v5, "initWithSession:xpcConnection:deviceTimeClient:timingSlot:isDecoupledInput:", self, &v23, &v21, *(unsigned int *)(v6 + 192), 0);
    v14 = *(void **)(v26 + 248);
    *(_QWORD *)(v26 + 248) = v13;

    v15 = v22;
    if (v22)
    {
      v16 = (unint64_t *)&v22->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v24;
    if (v24)
    {
      v19 = (unint64_t *)&v24->__shared_owners_;
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
  v3 = *(id *)(v26 + 248);
  if (v25)
    os_unfair_recursive_lock_unlock();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v27);
  return v3;
}

- (id)decoupledInputIOController
{
  id v3;
  AVAudioIOController_iOS *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  uint64_t v26;
  char v27[4];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v27[0] = 1;
  v28 = 3439;
  v29 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v30 = 0;
  v31 = 0;
  v32 = 0;
  kdebug_trace();
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  if (!*(_QWORD *)(v26 + 256))
  {
    v5 = [AVAudioIOController_iOS alloc];
    v6 = v26;
    v7 = *(std::__shared_weak_count **)(v26 + 56);
    v23 = *(_QWORD *)(v26 + 48);
    v24 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
      v6 = v26;
    }
    v10 = *(std::__shared_weak_count **)(v6 + 208);
    v21 = *(_QWORD *)(v6 + 200);
    v22 = v10;
    if (v10)
    {
      v11 = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldxr(v11);
      while (__stxr(v12 + 1, v11));
      v6 = v26;
    }
    v13 = -[AVAudioIOController_iOS initWithSession:xpcConnection:deviceTimeClient:timingSlot:isDecoupledInput:](v5, "initWithSession:xpcConnection:deviceTimeClient:timingSlot:isDecoupledInput:", self, &v23, &v21, *(unsigned int *)(v6 + 192), 1);
    v14 = *(void **)(v26 + 256);
    *(_QWORD *)(v26 + 256) = v13;

    v15 = v22;
    if (v22)
    {
      v16 = (unint64_t *)&v22->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    v18 = v24;
    if (v24)
    {
      v19 = (unint64_t *)&v24->__shared_owners_;
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
  v3 = *(id *)(v26 + 256);
  if (v25)
    os_unfair_recursive_lock_unlock();
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v27);
  return v3;
}

- (id)spatialPreferences
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  as::client::XPCConnection **v13;
  std::__shared_weak_count *v14;
  char v15[4];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[24];
  _BYTE *v23;
  id v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15[0] = 1;
  v16 = 3440;
  v17 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v18 = 0;
  v19 = 0;
  v20 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<AVAudioSessionSpatialPreferences * {__strong}>(v13[7], &v21);
  v3 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::sync_proxy(&v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned int *)v13;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},AVAudioSessionSpatialPreferences * {__strong}>::reply((uint64_t)&v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSpatialPreferencesForSession:reply:", v5, v6);

  objc_autoreleasePoolPop(v3);
  if (v24)
    v7 = 0;
  else
    v7 = v25;

  v8 = v23;
  if (v23 == v22)
  {
    v9 = 4;
    v8 = v22;
    goto LABEL_8;
  }
  if (v23)
  {
    v9 = 5;
LABEL_8:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)())v14->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
  return v7;
}

- (BOOL)handleRemoteInterruption:(id)a3 postInterruptionNotification:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  as::client::XPCConnection **v19;
  std::__shared_weak_count *v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BYTE v28[24];
  _BYTE *v29;
  id v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21[0] = 1;
  v22 = 3442;
  v23 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<>(v19[7], &v27);
  v8 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned int *)v19;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleRemoteInterruption:interruptionStatus:postInterruptionNotification:reply:", v10, v7, v5, v11);

  objc_autoreleasePoolPop(v8);
  v12 = v30;
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "code");
    FormatNSErrorForReturn();

  }
  v14 = v29;
  if (v29 == v28)
  {
    v15 = 4;
    v14 = v28;
    goto LABEL_7;
  }
  if (v29)
  {
    v15 = 5;
LABEL_7:
    (*(void (**)(void))(*v14 + 8 * v15))();
  }

  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)())v20->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);

  return v13 == 0;
}

- (BOOL)isRelatedSession:(id)a3
{
  id v4;

  v4 = a3;
  LODWORD(self) = -[AVAudioSession sourceSessionID](self, "sourceSessionID");
  LOBYTE(self) = (_DWORD)self == objc_msgSend(v4, "sourceSessionID");

  return (char)self;
}

- (uint64_t)privateCreateSessionInServerUsingXPC:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)privateCreateSessionInServerUsingXPC:
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

- (id)privateCreateSessionInServerUsingXPC:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E424F4F0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (void)outputVolume
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)outputVolume
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424F3D0;
  result[1] = v3;
  return result;
}

- (uint64_t)outputVolume
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424F3D0;
  a2[1] = v2;
  return result;
}

- (void)promptStyle
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)promptStyle
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424F340;
  result[1] = v3;
  return result;
}

- (uint64_t)promptStyle
{
  NSString *v1;
  uint64_t v2;

  as::client::api_utils::ServerAccessor::GetPropertyMX_DefaultToZero<NSString * {__strong}>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D486C0]);
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = TranslateMXVoicePromptStyleToAVASVoicePromptStyle(v1);

  return v2;
}

- (void)audioFormats
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)audioFormats
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424F388;
  result[1] = v3;
  return result;
}

- (uint64_t)audioFormats
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424F388;
  a2[1] = v2;
  return result;
}

- (void)isPiPAvailable
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)isPiPAvailable
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424F418;
  result[1] = v3;
  return result;
}

- (uint64_t)isPiPAvailable
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49A08], 1);
}

- (void)inputGain
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)inputGain
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424F2F8;
  result[1] = v3;
  return result;
}

- (uint64_t)inputGain
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424F2F8;
  a2[1] = v2;
  return result;
}

- (uint64_t)privateGetDataSources:accessor:
{

  return a1;
}

- (void)privateGetDataSources:accessor:
{

  operator delete(a1);
}

- (_QWORD)privateGetDataSources:accessor:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = &off_1E424ED38;
  v2[1] = *(id *)(a1 + 8);
  *((_BYTE *)v2 + 16) = *(_BYTE *)(a1 + 16);
  return v2;
}

- (id)privateGetDataSources:accessor:
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 8), "currentRoute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 16))
    objc_msgSend(v2, "inputs");
  else
    objc_msgSend(v2, "outputs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "dataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)isInputAvailable
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)isInputAvailable
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424EB88;
  result[1] = v3;
  return result;
}

- (uint64_t)isInputAvailable
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424EB88;
  a2[1] = v2;
  return result;
}

- (uint64_t)sampleRate
{

  return a1;
}

- (void)sampleRate
{

  operator delete(a1);
}

- (_QWORD)sampleRate
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = operator new(0x18uLL);
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  *v2 = &off_1E424EAF8;
  v2[1] = v3;
  v2[2] = v4;
  return v2;
}

- (id)sampleRate
{
  uint64_t v3;
  void *v4;
  id result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(void **)(a1 + 16);
  *a2 = &off_1E424EAF8;
  a2[1] = v3;
  result = v4;
  a2[2] = result;
  return result;
}

- (void)speechDetectionStyle
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)speechDetectionStyle
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424EC60;
  result[1] = v3;
  return result;
}

- (uint64_t)speechDetectionStyle
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49C78], 1);
}

- (void)inputNumberOfChannels
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)inputNumberOfChannels
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424ECA8;
  result[1] = v3;
  return result;
}

- (uint64_t)inputNumberOfChannels
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49650], 1);
}

- (void)outputNumberOfChannels
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)outputNumberOfChannels
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424ECF0;
  result[1] = v3;
  return result;
}

- (uint64_t)outputNumberOfChannels
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(**(os_unfair_lock_s ****)(a1 + 8), (void *)*MEMORY[0x1E0D49660], 1);
}

- (void)inputSampleRate
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)inputSampleRate
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424EB40;
  result[1] = v3;
  return result;
}

- (uint64_t)inputSampleRate
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424EB40;
  a2[1] = v2;
  return result;
}

- (void)outputSampleRate
{
  JUMPOUT(0x1A1AF1C48);
}

- (_QWORD)outputSampleRate
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E424EBD0;
  result[1] = v3;
  return result;
}

- (uint64_t)outputSampleRate
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E424EBD0;
  a2[1] = v2;
  return result;
}

- (id)getNotificationQueue
{
  unsigned __int8 v2;
  void *__p[2];
  char v5;

  if ((v2 & 1) == 0
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "com.apple.AVAudioSessionNotification");
    as::CreateFixedPriorityDispatchQueue((const void **)__p, QOS_CLASS_USER_INTERACTIVE, &-[AVAudioSession(ClientCommonImplementation) getNotificationQueue]::sNotificationQueue);
    if (v5 < 0)
      operator delete(__p[0]);
  }
  applesauce::dispatch::v1::queue::operator*(&-[AVAudioSession(ClientCommonImplementation) getNotificationQueue]::sNotificationQueue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (sync_guard<AVAudioSessionImpl,)privateGetGuardOfImplementation
{
  _QWORD *v2;
  _QWORD *v3;
  char *impl;
  unfair_recursive_lock *v5;
  AVAudioSessionImpl *v6;
  sync_guard<AVAudioSessionImpl, caulk::mach::unfair_recursive_lock> result;

  v3 = v2;
  impl = (char *)self->_impl;
  v5 = (unfair_recursive_lock *)os_unfair_recursive_lock_lock_with_options();
  *v3 = impl;
  v3[1] = impl + 8;
  result.var1.var0 = v6;
  result.var0 = v5;
  return result;
}

- (AVAudioSessionImplAtomic)atomicImpl
{
  return (AVAudioSessionImplAtomic)((char *)self->_impl + 8);
}

- (unsigned)privateGetSessionID
{
  return atomic_load((unsigned int *)-[AVAudioSession atomicImpl](self, "atomicImpl"));
}

- (shared_ptr<const)accessor
{
  _QWORD *v2;
  _QWORD *v3;
  __shared_weak_count *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  ServerAccessor *v8;
  ServerAccessor *v9;
  uint64_t v10;
  shared_ptr<const as::client::api_utils::ServerAccessor> result;

  v3 = v2;
  -[AVAudioSession privateGetGuardOfImplementation](self, "privateGetGuardOfImplementation");
  v5 = *(_QWORD *)(v10 + 80);
  *v3 = *(_QWORD *)(v10 + 72);
  v3[1] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = v9;
  if (v9)
    v8 = (ServerAccessor *)os_unfair_recursive_lock_unlock();
  result.var1 = v4;
  result.var0 = v8;
  return result;
}

- (BOOL)privateIsActive:(const void *)a3
{
  return as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(*(os_unfair_lock_s ***)a3, (void *)*MEMORY[0x1E0D49880], 1) != 0;
}

- (id)addObserverForType:(unint64_t)a3 name:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  os_unfair_lock_s *v19;
  std::__shared_weak_count *v20;
  int *v21;
  std::__shared_weak_count *v22;
  char v23[4];
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a4;
  v9 = a5;
  v23[0] = 1;
  v24 = 3428;
  v25 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v26 = 0;
  v27 = 0;
  v28 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v10 = (os_unfair_lock_s *)*((_QWORD *)v21 + 5);
  os_unfair_lock_lock(v10);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v10[2], a3, 1, (uint64_t *)&v19);
  if (v10)
    os_unfair_lock_unlock(v10);
  if (a3 == 2 && !as::client::AVAudioSessionNotificationState::RegisterMXNotificationWithServer(v19, v8, &v21))
  {
    v11 = 0;
  }
  else
  {
    as::client::AVAudioSessionNotificationState::AddObserverForName((uint64_t)v19, v8, self, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = v22;
  if (v22)
  {
    v16 = (unint64_t *)&v22->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v23);

  return v11;
}

- (void)removeObserverForType:(unint64_t)a3 observer:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  int *v19;
  std::__shared_weak_count *v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a4;
  v9 = a5;
  v21[0] = 1;
  v22 = 3429;
  v23 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v10 = (os_unfair_lock_s *)*((_QWORD *)v19 + 5);
  os_unfair_lock_lock(v10);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v10[2], a3, 0, &v17);
  if (v10)
    os_unfair_lock_unlock(v10);
  if (v17)
    as::client::AVAudioSessionNotificationState::RemoveObserverForType(v17, a3, v9, v8, self, &v19);
  v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);

}

- (void)privateHandlePing
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  as::client *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  as::client *v20;
  NSObject *v21;
  int v22;
  _QWORD *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  NSObject *obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  as::client::XPCConnection **v40;
  std::__shared_weak_count *v41;
  char v42[4];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[14];
  _BYTE v54[128];
  _BYTE v55[128];
  void *v56;
  _BYTE v57[24];
  _BYTE *v58;
  id v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v42[0] = 1;
  v43 = 3430;
  v44 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v45 = 0;
  v46 = 0;
  v47 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  as::client::XPCConnection::sync_message<NSArray * {__strong}>(v40[7], &v56);
  v3 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v56);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned int *)v40;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v56);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getDeferredMessages:reply:", v5, v6);

  objc_autoreleasePoolPop(v3);
  if (v59)
  {
    v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v49 = "AVAudioSessionClient_Common.mm";
      v50 = 1024;
      v51 = 139;
      v52 = 2112;
      *(_QWORD *)v53 = v59;
      v9 = v59;
      v10 = v8;
      v11 = v9;
      v12 = v10;
      _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);

      v8 = v12;
    }
  }
  else
  {
    v13 = atomic_load((unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 41));
    if ((v13 & 1) == 0)
      goto LABEL_23;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v60;
    v30 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v54, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v33;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v33 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
                objc_msgSend(v15, "objectForKey:", v19);
                v20 = (as::client *)objc_claimAutoreleasedReturnValue();
                v21 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v20));
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  v22 = *(_DWORD *)v40;
                  *(_DWORD *)buf = 136315906;
                  v49 = "AVAudioSessionClient_Common.mm";
                  v50 = 1024;
                  v51 = 153;
                  v52 = 1024;
                  *(_DWORD *)v53 = v22;
                  *(_WORD *)&v53[4] = 2112;
                  *(_QWORD *)&v53[6] = v19;
                  _os_log_impl(&dword_19EF50000, v21, OS_LOG_TYPE_INFO, "%25s:%-5d Handling deferred message, sessionID = 0x%x, notificationName = %@", buf, 0x22u);
                }
                -[AVAudioSession handleDeferredMessage:userInfo:](self, "handleDeferredMessage:userInfo:", v19, v20);

              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v54, 16);
            }
            while (v16);
          }

        }
        v30 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v55, 16);
      }
      while (v30);
    }

    v8 = obj;
  }

LABEL_23:
  v23 = v58;
  if (v58 == v57)
  {
    v24 = 4;
    v23 = v57;
    goto LABEL_27;
  }
  if (v58)
  {
    v24 = 5;
LABEL_27:
    (*(void (**)(void))(*v23 + 8 * v24))();
  }

  v25 = v41;
  if (v41)
  {
    p_shared_owners = (unint64_t *)&v41->__shared_owners_;
    do
      v27 = __ldaxr(p_shared_owners);
    while (__stlxr(v27 - 1, p_shared_owners));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v42);
}

- (void)privateDispatchPing:(const void *)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)a3 + 56) + 16);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__AVAudioSession_ClientCommonImplementation__privateDispatchPing___block_invoke;
  v6[3] = &unk_1E4250030;
  v5 = v4;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __66__AVAudioSession_ClientCommonImplementation__privateDispatchPing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "privateHandlePing");

}

- (void)privatePostNotificationForType:(unint64_t)a3 name:(id)a4 userInfo:(id)a5 accessor:(const void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  os_unfair_lock_s *v17;
  NSObject *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30[2];
  std::__shared_weak_count *v31;
  as::client::AVAudioSessionNotificationState *v32;
  std::__shared_weak_count *v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  int v38;
  id to;
  id location;

  v10 = a4;
  v11 = a5;
  location = 0;
  v12 = *(_QWORD *)(*(_QWORD *)a6 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)v12);
  objc_copyWeak(&to, (id *)(v12 + 8));
  if (v12)
    os_unfair_lock_unlock((os_unfair_lock_t)v12);
  v13 = objc_loadWeakRetained(&to);

  if (v13)
  {
    v14 = objc_loadWeakRetained(&to);
    objc_storeWeak(&location, v14);

  }
  else
  {
    objc_storeWeak(&location, self);
  }
  if (a3 == 1)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("AVAudioSessionRouteChangeNotification"))
      && !dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:userInfo:", v10, self, v11);

    }
    else
    {
      v15 = **(_DWORD **)a6;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke;
      block[3] = &unk_1E4250210;
      objc_copyWeak(&v37, &location);
      v35 = v10;
      v38 = v15;
      v36 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v37);
    }
  }
  v17 = *(os_unfair_lock_s **)(*(_QWORD *)a6 + 40);
  os_unfair_lock_lock(v17);
  as::client::NotificationStateManager::GetNotificationStateForType((uint64_t)&v17[2], a3, 1, (uint64_t *)&v32);
  if (v17)
    os_unfair_lock_unlock(v17);
  if (v32
    && as::client::AVAudioSessionNotificationState::CountRegisteredOfName((os_unfair_lock_s *)v32, (NSString *)v10))
  {
    -[AVAudioSession getNotificationQueue](self, "getNotificationQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3321888768;
    v27[2] = __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke_60;
    v27[3] = &unk_1E424FEE8;
    objc_copyWeak(v30, &location);
    v30[1] = v32;
    v31 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    v28 = v10;
    v29 = v11;
    dispatch_async(v18, v27);

    v21 = v31;
    if (v31)
    {
      v22 = (unint64_t *)&v31->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    objc_destroyWeak(v30);
  }
  v24 = v33;
  if (v33)
  {
    v25 = (unint64_t *)&v33->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);

}

void __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AVAudioSessionMediaServicesWereLostNotification"));
    if ((v3 & 1) != 0
      || (v3 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AVAudioSessionMediaServicesWereResetNotification")), (_DWORD)v3))
    {
      v4 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)v3));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_DWORD *)(a1 + 56);
        v8 = 136315906;
        v9 = "AVAudioSessionClient_Common.mm";
        v10 = 1024;
        v11 = 221;
        v12 = 2112;
        v13 = v5;
        v14 = 1024;
        v15 = v6;
        _os_log_impl(&dword_19EF50000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Posting inner %@ notification for session with ID 0x%x", (uint8_t *)&v8, 0x22u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

void __100__AVAudioSession_ClientCommonImplementation__privatePostNotificationForType_name_userInfo_accessor___block_invoke_60(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 40));

}

- (void)privateInterruptionWithInfo:(id)a3 accessor:(const void *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const void *v19;
  id v20;
  void *v21;
  as::client *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  as::client *v26;
  int v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  const void *v31;
  void *v32;
  _BYTE v33[40];
  uint8_t v34[40];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF2F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF2F0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF2E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF308]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == 1)
  {
    v31 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("AVAudioSessionInterruptionTypeKey"), 0);
    v13 = v12;
    if (v32)
      objc_msgSend(v12, "setObject:forKey:", v32, CFSTR("AVAudioSessionInterruptorNameKey"));
    if (v9)
      objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("AVAudioSessionInterruptorBundleIDKey"));
    if (v10)
      objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("AVAudioSessionInterruptionWasSuspendedKey"));
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF2E0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = objc_msgSend(v14, "unsignedIntValue");
    else
      v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v25, CFSTR("AVAudioSessionInterruptionReasonKey"));

    if (v10)
    {
      v26 = (as::client *)objc_msgSend(v10, "BOOLValue");
      v27 = (int)v26;
    }
    else
    {
      v27 = 0;
    }
    v28 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v26));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioSessionClient_Common.mm";
      v37 = 1024;
      v38 = 306;
      v39 = 1024;
      v40 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
      v41 = 1024;
      v42 = v27;
      _os_log_impl(&dword_19EF50000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionInterruptionNotification (Begin Interruption). Was suspended:%d", buf, 0x1Eu);
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("TimeStamp"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
    PerformanceTracker::PerformanceTracker((uint64_t)v34, CFSTR("AudioSessionBeginInterruptionNotification"), v30, v29, 1);
    PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v34);
    -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionInterruptionNotification"), v13, v31);

  }
  else
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CFF300]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntValue");
    v19 = a4;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 == 1769108333);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", v11, CFSTR("AVAudioSessionInterruptionTypeKey"), v21, CFSTR("AVAudioSessionInterruptionOptionKey"), 0);

    if (v32)
      v22 = (as::client *)objc_msgSend(v13, "setObject:forKey:", v32, CFSTR("AVAudioSessionInterruptorNameKey"));
    if (v9)
      v22 = (as::client *)objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("AVAudioSessionInterruptorBundleIDKey"));
    v23 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v22));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v36 = "AVAudioSessionClient_Common.mm";
      v37 = 1024;
      v38 = 340;
      v39 = 1024;
      v40 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
      v41 = 1024;
      v42 = v18 == 1769108333;
      _os_log_impl(&dword_19EF50000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session 0x%x posting AVAudioSessionInterruptionNotification (End Interruption). Resumable:%d", buf, 0x1Eu);
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("TimeStamp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
    PerformanceTracker::PerformanceTracker((uint64_t)v33, CFSTR("AudioSessionEndInterruptionNotification"), v24, v15, 1);
    PerformanceTracker::~PerformanceTracker((PerformanceTracker *)v33);
    -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionInterruptionNotification"), v13, v19);
  }

}

- (void)privateInputMuteWithInfo:(id)a3 accessor:(const void *)a4
{
  id v6;
  void *v7;
  as::client *TypeID;
  as::client *v9;
  CFTypeID v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D49310]);
  TypeID = (as::client *)objc_claimAutoreleasedReturnValue();
  v9 = TypeID;
  if (TypeID && (v10 = CFGetTypeID(TypeID), TypeID = (as::client *)CFBooleanGetTypeID(), (as::client *)v10 == TypeID))
  {
    objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("AVAudioSessionInputMuteKey"));
  }
  else
  {
    v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(TypeID));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315650;
      v15 = "AVAudioSessionClient_Common.mm";
      v16 = 1024;
      v17 = 363;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Received ill formed input mute change notification %@", (uint8_t *)&v14, 0x1Cu);
    }
  }

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D49308]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D49400]))
    objc_msgSend(v7, "setObject:forKey:", CFSTR("AVAudioSessionInputMuteContextExternalProvenance"), CFSTR("AVAudioSessionInputMuteContextInfoKey"));

  -[AVAudioSession privatePostNotificationForType:name:userInfo:accessor:](self, "privatePostNotificationForType:name:userInfo:accessor:", 1, CFSTR("AVAudioSessionInputMuteChangeNotification"), v7, a4);
}

- (void)addCategoryOptionsToDictionary:(id)a3 category:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  as::client *v11;
  char v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  atomic_store(BYTE2(a5) & 1, (unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 40));
  if ((a5 & 4) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryPlayAndRecord")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryRecord")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (a5 >> 2) & 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x1E0D495C0]);

  }
  v11 = (as::client *)objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryPlayAndRecord"));
  if ((a5 & 8) != 0)
    v12 = (char)v11;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    if (((a5 >> 3) & 1 | v11) != 1)
      goto LABEL_17;
    if ((a5 & 8) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  else
  {
    v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v11));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "AVAudioSessionClient_Common.mm";
      v27 = 1024;
      v28 = 424;
      _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: category option 'defaultToSpeaker' is only applicable with category 'playAndRecord'", buf, 0x12u);
    }
  }
  v13 = CFSTR("Speaker");
LABEL_15:
  objc_msgSend(v8, "setObject:forKey:", v13, *MEMORY[0x1E0D495B0]);
  if ((a5 & 8) == 0)

LABEL_17:
  if ((a5 & 2) != 0)
  {
    objc_msgSend(v8, "setObject:forKey:", &unk_1E4255450, *MEMORY[0x1E0D49878]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 16 * (a5 & 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v15, *MEMORY[0x1E0D49878]);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (~(_DWORD)a5 & 0x11) == 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v16, *MEMORY[0x1E0D49D18]);

  v17 = objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryPlayAndRecord"));
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v18;
  if ((a5 & 0x20) != 0)
    objc_msgSend(v18, "addObject:", CFSTR("HeadphonesBT"));
  if ((a5 & 0x40) != 0)
  {
    objc_msgSend(v19, "addObject:", CFSTR("AirTunes"));
LABEL_28:
    objc_msgSend(v8, "setObject:forKey:", v19, *MEMORY[0x1E0D494C8]);
    goto LABEL_29;
  }
  v20 = v17 ^ 1;
  if ((a5 & 0x60) != 0)
    v20 = 0;
  if ((v20 & 1) == 0)
    goto LABEL_28;
LABEL_29:
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryPlayAndRecord")) & 1) != 0)
    goto LABEL_33;
  v21 = objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryMultiRoute")) ^ 1;
  if ((a5 & 0x80) != 0)
    LOBYTE(v21) = 0;
  if ((v21 & 1) == 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (a5 >> 7) & 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v22, *MEMORY[0x1E0D49B48]);

  }
  v23 = objc_msgSend(v9, "isEqualToString:", CFSTR("AVAudioSessionCategoryRecord"));
  if ((a5 & 0x20000) != 0 && v23 | v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v24, *MEMORY[0x1E0D49B18]);

    NSLog(CFSTR("Setting echo cancelled input: %u"), 1);
  }

}

- (int)privateSetCategoryWithOptions:(id)a3 modes:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 accessor:(const void *)a7
{
  NSString *v12;
  NSString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  uint64_t v21;
  as::client *v22;
  NSObject *v23;
  char v25[4];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t v31[16];
  uint8_t v32[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint8_t *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = (NSString *)a3;
  v13 = (NSString *)a4;
  v25[0] = 1;
  v26 = 3072;
  v27 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v28 = 0;
  v29 = 0;
  v30 = 0;
  kdebug_trace();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v14)
  {
    if (a5 != 0xFFFFFFFFLL)
      atomic_store(a5, (unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 32));
    atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 32));
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v12)
    {
      TranslateAVASCategoryToMXCategoryString(v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_15;
      objc_msgSend(v15, "setObject:forKey:", v16, *MEMORY[0x1E0D494F8]);

    }
    if (!v13)
    {
LABEL_10:
      if (a5 != 0xFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v18, *MEMORY[0x1E0D49BE8]);

      }
      atomic_store((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1, (unsigned __int8 *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 42));
      if (a6 != -1)
        -[AVAudioSession addCategoryOptionsToDictionary:category:options:](self, "addCategoryOptionsToDictionary:category:options:", v15, v12, a6);
      v21 = atomic_load((unint64_t *)(-[AVAudioSession atomicImpl](self, "atomicImpl") + 8));
      PerformanceTracker::PerformanceTracker((uint64_t)buf, (uint64_t)"-[AVAudioSession(CommonAPI) privateSetCategoryWithOptions:modes:routeSharingPolicy:options:accessor:]", v21, 1);
      v22 = (as::client *)as::client::api_utils::ServerAccessor::SetBatchProperties(*(as::client::cache_util::CacheManager ***)a7, v15, 0, 1, 1, 0);
      v19 = v22;
      if ((_DWORD)v22)
      {
        v23 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v22));
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v31, v19);
          *(_DWORD *)v32 = 136315650;
          v33 = "AVAudioSessionClient_Common.mm";
          v34 = 1024;
          v35 = 574;
          v36 = 2080;
          v37 = v31;
          _os_log_impl(&dword_19EF50000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set properties, error: %s", v32, 0x1Cu);
        }

      }
      as::client::KVOManager::markPropertiesDirtyAll(*(as::client::KVOManager **)(*(_QWORD *)a7 + 24));
      PerformanceTracker::~PerformanceTracker((PerformanceTracker *)buf);
      goto LABEL_23;
    }
    TranslateAVASModeToMXModeString(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v15, "setObject:forKey:", v17, *MEMORY[0x1E0D49528]);

      goto LABEL_10;
    }
LABEL_15:
    v19 = -50;
LABEL_23:

    goto LABEL_24;
  }
  v19 = 2003329396;
  v20 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "AVAudioSessionClient_Common.mm";
    v40 = 1024;
    v41 = 515;
    _os_log_impl(&dword_19EF50000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Error while allocating for propertyData", buf, 0x12u);
  }
LABEL_24:

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v25);
  return v19;
}

- (BOOL)isActive
{
  BOOL v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  _BYTE v8[8];
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3328;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  v3 = -[AVAudioSession privateIsActive:](self, "privateIsActive:", v8);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return v3;
}

- (id)getMXSessionProperty:(id)a3 error:(id *)a4
{
  NSString *v6;
  as::client *v7;
  id v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  id v14;
  char v15;
  char v16[4];
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE buf[18];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = (NSString *)a3;
  v16[0] = 1;
  v17 = 3426;
  v18 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v7 = (as::client *)kdebug_trace();
  if (v6)
  {
    -[AVAudioSession accessor](self, "accessor");
    as::client::api_utils::ServerAccessor::GetPropertyMX_GenericPipe(*(as::client::api_utils::ServerAccessor **)buf, v6, (uint64_t)&v14);
    if (v15)
    {
      v8 = v14;
    }
    else
    {
      v8 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v14);
    }

    v10 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v11 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  else
  {
    v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 610;
      _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d getMXSessionProperty: Invalid MXProperty provided", buf, 0x12u);
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 2003329396, 0);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);

  return v8;
}

- (BOOL)setMXSessionProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  as::client *v9;
  as::client::cache_util::CacheManager **v10;
  void *v11;
  char v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  char v18[4];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  _BYTE buf[18];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18[0] = 1;
  v19 = 3427;
  v20 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v9 = (as::client *)kdebug_trace();
  if (v7)
  {
    -[AVAudioSession accessor](self, "accessor");
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = *(as::client::cache_util::CacheManager ***)buf;
    v24 = v7;
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    as::client::api_utils::ServerAccessor::SetBatchProperties(v10, v11, 0, 2, 1, 1);

    v12 = FormatNSErrorForReturn();
    v13 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v14 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v16 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v9));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 644;
      _os_log_impl(&dword_19EF50000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d setMXSessionProperty: Invalid MXProperty provided", buf, 0x12u);
    }
    v12 = FormatNSErrorForReturn();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);

  return v12;
}

- (BOOL)setMXProperties:(id)a3 propertyErrors:(id *)a4
{
  id v6;
  as::client *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  NSObject *v13;
  as::client::cache_util::CacheManager **v15;
  std::__shared_weak_count *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[AVAudioSession accessor](self, "accessor");
    v7 = (as::client *)as::client::api_utils::ServerAccessor::SetBatchProperties(v15, v6, a4, 2, 1, 0);
    v8 = (int)v7;
    v9 = (_DWORD)v7 == 0;
    if ((_DWORD)v7)
    {
      v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "AVAudioSessionClient_Common.mm";
        v19 = 1024;
        v20 = 672;
        v21 = 1024;
        v22 = v8;
        _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d setProperties failed with code: %d", buf, 0x18u);
      }
    }
    if (v16)
    {
      p_shared_owners = (unint64_t *)&v16->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)())v16->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  else
  {
    v13 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "AVAudioSessionClient_Common.mm";
      v19 = 1024;
      v20 = 665;
      _os_log_impl(&dword_19EF50000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid propertiesDictionary", buf, 0x12u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)getMXProperties:(id)a3 propertyErrors:(id *)a4
{
  id v6;
  void *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  NSObject *v11;
  _BYTE v13[18];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[AVAudioSession accessor](self, "accessor");
    as::client::api_utils::ServerAccessor::GetBatchPropertiesMX(*(unsigned int **)v13, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(std::__shared_weak_count **)&v13[8];
    if (*(_QWORD *)&v13[8])
    {
      v9 = (unint64_t *)(*(_QWORD *)&v13[8] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
  else
  {
    v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(0));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v13[4] = "AVAudioSessionClient_Common.mm";
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = 687;
      _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid mxProperties", v13, 0x12u);
    }
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (BOOL)iAmTheAssistant
{
  int Property_DefaultTo;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  os_unfair_lock_s **v8;
  std::__shared_weak_count *v9;
  char v10[4];
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10[0] = 1;
  v11 = 3356;
  v12 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v13 = 0;
  v14 = 0;
  v15 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  Property_DefaultTo = as::client::api_utils::ServerAccessor::GetProperty_DefaultToZero<unsigned int>(v8, (void *)*MEMORY[0x1E0D497F8], 1);
  v4 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
  return Property_DefaultTo != 0;
}

- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  as::client::cache_util::CacheManager **v11;
  std::__shared_weak_count *v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v13[0] = 1;
  v14 = 3357;
  v15 = -[AVAudioSession opaqueSessionID](self, "opaqueSessionID");
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  -[AVAudioSession accessor](self, "accessor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  as::client::api_utils::ServerAccessor::SetProperty(v11, (void *)*MEMORY[0x1E0D497F8], v6, 1);

  v7 = FormatNSErrorForReturn();
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)())v12->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
  return v7;
}

- (unint64_t)retainCount
{
  objc_super v4;

  if (self->_impl && -[AVAudioSession sessionType](self, "sessionType") == 1886546285)
    return -1;
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSession;
  return -[AVAudioSession retainCount](&v4, sel_retainCount);
}

@end
