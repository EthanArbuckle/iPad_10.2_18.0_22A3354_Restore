@implementation KeepAliveManager

- (KeepAliveManager)initWithIdentifier:(KeepAliveManager *)self minInterval:(SEL)a2 maxInterval:()basic_string<char enableWakeUp:()std:(std::allocator<char>> *)a3 :char_traits<char> delegate:
{
  char v3;
  uint64_t *v4;
  double v5;
  double v6;
  uint64_t *v7;
  char v8;
  double v9;
  double v10;
  char *v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  KeepAliveManager *v25;
  uint64_t v26;
  void *__p[2];
  char v29;
  void *v30[2];
  uint64_t v31;
  objc_super v32;

  v7 = v4;
  v8 = v3;
  v9 = v6;
  v10 = v5;
  v32.receiver = self;
  v32.super_class = (Class)KeepAliveManager;
  v11 = -[KeepAliveManager init](&v32, sel_init);
  if (!v11)
  {
LABEL_19:
    v25 = v11;
    goto LABEL_25;
  }
  std::operator+<char>();
  v12 = (void **)(v11 + 16);
  if (v11[39] < 0)
    operator delete(*v12);
  v13 = v31;
  *(_OWORD *)v12 = *(_OWORD *)v30;
  *((_QWORD *)v11 + 4) = v13;
  v11[72] = v8;
  v11[73] = 0;
  v15 = *v7;
  v14 = v7[1];
  if (v14)
  {
    v16 = (unint64_t *)(v14 + 16);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  v18 = (std::__shared_weak_count *)*((_QWORD *)v11 + 6);
  *((_QWORD *)v11 + 5) = v15;
  *((_QWORD *)v11 + 6) = v14;
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  *((_QWORD *)v11 + 10) = dispatch_queue_create("com.apple.ipTelephony.keepAliveQueue", 0);
  v19 = v11 + 16;
  if (v11[39] < 0)
    v19 = *v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70A28]), "initWithConnectionClass:delegate:delegateQueue:serviceIdentifier:", 0, v11, *((_QWORD *)v11 + 10), v20);
  v22 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v21;

  v23 = (void *)*((_QWORD *)v11 + 1);
  if (v23)
  {
    objc_msgSend(v23, "setOnlyAllowedStyle:", 0);
    if (v10 != 0.0)
      objc_msgSend(*((id *)v11 + 1), "setMinimumKeepAliveInterval:", v10);
    objc_msgSend(*((id *)v11 + 1), "setMaximumKeepAliveInterval:", v9);
    objc_msgSend(*((id *)v11 + 1), "setEnableNonCellularConnections:", 1);
    std::string::basic_string[abi:ne180100]<0>(v30, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v24 = ImsLogger::debug(ims::_logger, (uint64_t)v30, (uint64_t)__p);
    (*(void (**)(uint64_t, char *))(*(_QWORD *)v24 + 32))(v24, v11 + 16);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v24 + 8), (uint64_t)": PCConnectionManager created with delegate ", 44);
    *(_BYTE *)(v24 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v24 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v24 + 8), (uint64_t)" maxInterval(seconds) = ", 24);
    *(_BYTE *)(v24 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v24 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v24 + 8), (uint64_t)" wakeUpOnWifi = ", 16);
    *(_BYTE *)(v24 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v24 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v24 + 64))(v24, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v24 + 17) = 0;
    if (v29 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v31) < 0)
      operator delete(v30[0]);

    goto LABEL_19;
  }
  std::string::basic_string[abi:ne180100]<0>(v30, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v26 = ImsLogger::debug(ims::_logger, (uint64_t)v30, (uint64_t)__p);
  (*(void (**)(uint64_t, char *))(*(_QWORD *)v26 + 32))(v26, v11 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v26 + 8), (uint64_t)": PCConnectionManager creation failed", 37);
  *(_BYTE *)(v26 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v26 + 64))(v26, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v26 + 17) = 0;
  if (v29 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v31) < 0)
    operator delete(v30[0]);

  v25 = 0;
LABEL_25:

  return v25;
}

- (void)dealloc
{
  PCConnectionManager *manager;
  std::__shared_weak_count *var0;
  uint64_t v5;
  objc_super v6;
  void *__p[2];
  char v8;
  void *v9[2];
  char v10;

  -[PCConnectionManager stopManager](self->_manager, "stopManager");
  -[PCConnectionManager setDelegate:](self->_manager, "setDelegate:", 0);
  manager = self->_manager;
  self->_manager = 0;

  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  *(_QWORD *)&self->_keepAliveId.__r_.var0 = 0;
  self->_keepAliveId.var0 = 0;
  if (var0)
    std::__shared_weak_count::__release_weak(var0);
  dispatch_release((dispatch_object_t)self->_wowAssertion.__cntrl_);
  self->_wowAssertion.__cntrl_ = 0;
  std::string::basic_string[abi:ne180100]<0>(v9, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v5 = ImsLogger::debug(ims::_logger, (uint64_t)v9, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v5 + 32))(v5, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v5 + 8), (uint64_t)": PCConnectionManager destroyed", 31);
  *(_BYTE *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v5 + 17) = 0;
  if (v8 < 0)
    operator delete(__p[0]);
  if (v10 < 0)
    operator delete(v9[0]);
  v6.receiver = self;
  v6.super_class = (Class)KeepAliveManager;
  -[KeepAliveManager dealloc](&v6, sel_dealloc);
}

- (void)startKeepAlive
{
  uint64_t v3;
  uint64_t v4;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;

  if (BYTE1(self->_wowAssertion.__ptr_))
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v3 = ImsLogger::debug(ims::_logger, (uint64_t)v7, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v3 + 32))(v3, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v3 + 8), (uint64_t)": PCConnectionManager already started", 37);
    *(_BYTE *)(v3 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v3 + 17) = 0;
    if (v6 < 0)
      operator delete(__p[0]);
    if (v8 < 0)
      operator delete(v7[0]);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v4 = ImsLogger::debug(ims::_logger, (uint64_t)v7, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v4 + 32))(v4, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)": Starting PCConnectionManager with minimum interval (ActionReset)", 66);
    *(_BYTE *)(v4 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v4 + 17) = 0;
    if (v6 < 0)
      operator delete(__p[0]);
    if (v8 < 0)
      operator delete(v7[0]);
    -[PCConnectionManager resumeManagerWithAction:](self->_manager, "resumeManagerWithAction:", 3);
    -[KeepAliveManager startWakeUpOnWifi](self, "startWakeUpOnWifi");
    BYTE1(self->_wowAssertion.__ptr_) = 1;
  }
}

- (void)startWakeUpOnWifi
{
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v6;

  WakeOnWifiAssertion::get((WakeOnWifiAssertion *)self, &v6);
  std::shared_ptr<SipClientTransaction>::operator=[abi:ne180100]((uint64_t)&self->_delegate, &v6);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v6 + 1);
  if (*((_QWORD *)&v6 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v6 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (void)stopKeepAlive
{
  std::__shared_weak_count *var0;
  uint64_t v4;
  void *__p[2];
  char v6;
  void *v7[2];
  char v8;

  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  *(_QWORD *)&self->_keepAliveId.__r_.var0 = 0;
  self->_keepAliveId.var0 = 0;
  if (var0)
    std::__shared_weak_count::__release_weak(var0);
  -[PCConnectionManager stopManager](self->_manager, "stopManager");
  std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v4 = ImsLogger::debug(ims::_logger, (uint64_t)v7, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v4 + 32))(v4, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v4 + 8), (uint64_t)": PCConnectionManager Stopped", 29);
  *(_BYTE *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v4 + 17) = 0;
  if (v6 < 0)
    operator delete(__p[0]);
  if (v8 < 0)
    operator delete(v7[0]);
  -[KeepAliveManager stopWakeUpOnWifi](self, "stopWakeUpOnWifi");
  BYTE1(self->_wowAssertion.__ptr_) = 0;
}

- (void)stopWakeUpOnWifi
{
  std::shared_ptr<SipLazuliManager::OutgoingPager>::reset[abi:ne180100](&self->_delegate.__ptr_);
}

- (void)growKeepAliveInterval
{
  uint64_t v3;
  void *__p[2];
  char v5;
  void *v6[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(v6, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v3 = ImsLogger::debug(ims::_logger, (uint64_t)v6, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v3 + 32))(v3, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v3 + 8), (uint64_t)": Enlarge keep alive interval", 29);
  *(_BYTE *)(v3 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v3 + 17) = 0;
  if (v5 < 0)
    operator delete(__p[0]);
  if (v7 < 0)
    operator delete(v6[0]);
  -[PCConnectionManager resumeManagerWithAction:](self->_manager, "resumeManagerWithAction:", 0);
}

- (void)shrinkKeepAliveInterval
{
  uint64_t v3;
  void *__p[2];
  char v5;
  void *v6[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(v6, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v3 = ImsLogger::debug(ims::_logger, (uint64_t)v6, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v3 + 32))(v3, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v3 + 8), (uint64_t)": Shrink keep alive interval", 28);
  *(_BYTE *)(v3 + 17) = 0;
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v3 + 17) = 0;
  if (v5 < 0)
    operator delete(__p[0]);
  if (v7 < 0)
    operator delete(v6[0]);
  -[PCConnectionManager resumeManagerWithAction:](self->_manager, "resumeManagerWithAction:", 1);
}

- (BOOL)isNextKeepAliveWithinThreshold:(double)a3
{
  double v5;
  double v6;
  uint64_t v7;
  NSDate *v8;
  double v9;
  NSDate *v10;
  void *__p[2];
  uint64_t v13;
  void *v14[2];
  uint64_t v15;
  void *v16[2];
  char v17;
  void *v18[2];
  char v19;
  __int128 v20;
  uint64_t v21;

  -[PCConnectionManager lastScheduledIntervalTime](self->_manager, "lastScheduledIntervalTime");
  v6 = v5;
  std::string::basic_string[abi:ne180100]<0>(v18, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(v16, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v7 = ImsLogger::debug(ims::_logger, (uint64_t)v18, (uint64_t)v16);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v7 + 32))(v7, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v7 + 8), (uint64_t)": next event ", 13);
  *(_BYTE *)(v7 + 17) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  KAStringFromDate(v8);
  v20 = 0uLL;
  v21 = 0;
  ctu::cf::assign();
  *(_OWORD *)v14 = v20;
  v15 = v21;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v7 + 32))(v7, v14);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v7 + 8), (uint64_t)", next event - cushion ", 23);
  v9 = v6 - a3;
  *(_BYTE *)(v7 + 17) = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  KAStringFromDate(v10);
  v20 = 0uLL;
  v21 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = v20;
  v13 = v21;
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v7 + 32))(v7, __p);
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v7 + 17) = 0;
  if (SHIBYTE(v13) < 0)
    operator delete(__p[0]);

  if (SHIBYTE(v15) < 0)
    operator delete(v14[0]);

  if (v17 < 0)
    operator delete(v16[0]);
  if (v19 < 0)
    operator delete(v18[0]);
  return CFAbsoluteTimeGetCurrent() >= v9;
}

- (void)connectionManager:(id)a3 handleEvent:(int)a4
{
  uint64_t v5;
  std::__shared_weak_count *var0;
  std::__shared_weak_count *v7;
  void *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  std::__shared_weak_count *v19;
  void *__p[2];
  char v21;
  void *v22;
  std::__shared_weak_count *v23;
  char v24;

  if (a4 == 2)
  {
    std::string::basic_string[abi:ne180100]<0>(&v22, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v5 = ImsLogger::debug(ims::_logger, (uint64_t)&v22, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v5 + 32))(v5, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v5 + 8), (uint64_t)": Got PC Push Keep Alive event", 30);
    *(_BYTE *)(v5 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v5 + 17) = 0;
    if (v21 < 0)
      operator delete(__p[0]);
    if (v24 < 0)
      operator delete(v22);
    v22 = 0;
    v23 = 0;
    var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
    if (var0)
    {
      v7 = std::__shared_weak_count::lock(var0);
      v23 = v7;
      if (v7)
      {
        v8 = *(void **)&self->_keepAliveId.__r_.var0;
        v22 = v8;
        if (v8)
        {
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3321888768;
          v18[2] = __50__KeepAliveManager_connectionManager_handleEvent___block_invoke;
          v18[3] = &__block_descriptor_48_ea8_32c49_ZTSKNSt3__110shared_ptrI20ImsKeepAliveDelegateEE_e5_v8__0l;
          v18[4] = v8;
          v19 = v7;
          p_shared_owners = (unint64_t *)&v7->__shared_owners_;
          do
            v10 = __ldxr(p_shared_owners);
          while (__stxr(v10 + 1, p_shared_owners));
          ims::performBlock((IMSClientManager *)v18);
          v11 = v19;
          if (v19)
          {
            v12 = (unint64_t *)&v19->__shared_owners_;
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
      }
    }
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
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v22, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
    v17 = ImsLogger::debug(ims::_logger, (uint64_t)&v22, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v17 + 32))(v17, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v17 + 8), (uint64_t)": Got PC event ", 15);
    *(_BYTE *)(v17 + 17) = 0;
    std::ostream::operator<<();
    *(_BYTE *)(v17 + 17) = 0;
    (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v17 + 64))(v17, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(_BYTE *)(v17 + 17) = 0;
    if (v21 < 0)
      operator delete(__p[0]);
    if (v24 < 0)
      operator delete(v22);
  }
}

uint64_t __50__KeepAliveManager_connectionManager_handleEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  std::__shared_weak_count *var0;

  std::shared_ptr<RTPManager>::~shared_ptr[abi:ne180100]((uint64_t)&self->_delegate);
  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  if (var0)
    std::__shared_weak_count::__release_weak(var0);
  if (*((char *)&self->_keepAliveId.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_keepAliveId.__r_.__value_.var0.var1.__data_);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
