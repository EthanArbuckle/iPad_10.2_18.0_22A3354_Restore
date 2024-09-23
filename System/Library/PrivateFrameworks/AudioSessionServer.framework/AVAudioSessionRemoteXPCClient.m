@implementation AVAudioSessionRemoteXPCClient

- (void)initWithServer:process:delegate:
{
  caulk *v2;
  char **WeakRetained;
  char **v4;
  std::chrono::system_clock::time_point v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (caulk *)getpid();
  if ((caulk::is_debugger_attached(v2) & 1) == 0)
  {
    WeakRetained = (char **)objc_loadWeakRetained((id *)(a1 + 8));
    v4 = WeakRetained;
    if (WeakRetained && !*((_BYTE *)WeakRetained + 80))
    {
      v5.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v5.__d_.__rep_ >= (uint64_t)v4[12])
      {
        AudioSessionServerXPCTimeout(v4[11]);
      }
      else
      {
        v6 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)v5.__d_.__rep_));
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315394;
          v8 = "AVAudioSessionXPCServer.mm";
          v9 = 1024;
          v10 = 708;
          _os_log_impl(&dword_1C895C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPC watchdog timer fired too soon, skipping timeout handling", (uint8_t *)&v7, 0x12u);
        }
      }
    }

  }
}

- (void)getMXPropertyGenericPipe:(unsigned int)a3 propertyName:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;

  v8 = a4;
  v9 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getMXPropertyGenericPipe:propertyName:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__AVAudioSessionRemoteXPCClient_getMXPropertyGenericPipe_propertyName_reply___block_invoke;
  v15[3] = &unk_1E8205030;
  v18 = a3;
  v15[4] = self;
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v16 = v12;
  v13 = (void *)MEMORY[0x1CAA39148](v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();

}

- (void)getProperty:(unsigned int)a3 propertyName:(id)a4 MXProperty:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id WeakRetained;
  _QWORD v17[5];
  id v18;
  id v19;
  unsigned int v20;
  BOOL v21;

  v10 = a4;
  v11 = a6;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getProperty:propertyName:MXProperty:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__AVAudioSessionRemoteXPCClient_getProperty_propertyName_MXProperty_reply___block_invoke;
  v17[3] = &unk_1E8205008;
  v20 = a3;
  v17[4] = self;
  v13 = v12;
  v19 = v13;
  v21 = a5;
  v14 = v10;
  v18 = v14;
  v15 = (void *)MEMORY[0x1CAA39148](v17);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();

}

- (void)setProperties:(unsigned int)a3 values:(id)a4 MXProperties:(BOOL)a5 batchStrategy:(int)a6 genericMXPipe:(BOOL)a7 reply:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id WeakRetained;
  _QWORD v21[5];
  id v22;
  id v23;
  unsigned int v24;
  int v25;
  BOOL v26;
  BOOL v27;

  v14 = a4;
  v15 = a8;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXPropert"
                                                          "ies:batchStrategy:genericMXPipe:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke;
  v21[3] = &unk_1E8204F40;
  v24 = a3;
  v21[4] = self;
  v17 = v16;
  v23 = v17;
  v26 = a7;
  v18 = v14;
  v22 = v18;
  v27 = a5;
  v25 = a6;
  v19 = (void *)MEMORY[0x1CAA39148](v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();

}

- (void)getDeferredMessages:(unsigned int)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  as::server::LegacySessionManager *v8;
  os_unfair_lock_s *v9;
  NSXPCConnection *xpcConnection;
  id v11;
  uint64_t i;
  id v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18[3];
  as::server::AudioSessionInfo *v19;
  std::__shared_weak_count *v20;
  audit_token_t v21;
  char v22[4];
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a4;
  v22[0] = 1;
  v23 = 3843;
  v24 = a3;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getDeferredMessages:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v21, 0, sizeof(v21));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v21, a3, 0, &v19);
  if (v19)
  {
    as::server::AudioSessionInfo::GetDeferredMessages(v19, v18);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = v18[1]; (uint64_t *)i != v18; i = *(_QWORD *)(i + 8))
    {
      v13 = *(id *)(i + 16);
      objc_msgSend(v11, "addObject:", v13);

    }
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v11);

    std::__list_imp<NSDictionary * {__strong}>::clear(v18);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getDeferredMessages:reply:]", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v14, 0);

  }
  v15 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v22);

}

- (void).cxx_destruct
{
  void **p_f;
  void **v4;
  uint64_t v5;
  time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000>>> *p_replyWatchdogMinTimestamp;
  uint64_t v7;

  p_f = &self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__f_;
  v4 = *(void ***)&self->_longReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[8];
  if (v4 == p_f)
  {
    v5 = 4;
    v4 = p_f;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*((void (**)(void))*v4 + v5))();
LABEL_6:
  p_replyWatchdogMinTimestamp = *(time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000>>> **)&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[8];
  if (p_replyWatchdogMinTimestamp == &self->_replyWatchdogMinTimestamp)
  {
    v7 = 4;
    p_replyWatchdogMinTimestamp = &self->_replyWatchdogMinTimestamp;
  }
  else
  {
    if (!p_replyWatchdogMinTimestamp)
      goto LABEL_11;
    v7 = 5;
  }
  (*(void (**)(void))(p_replyWatchdogMinTimestamp->__d_.__rep_ + 8 * v7))();
LABEL_11:
  objc_storeStrong((id *)&self->_clientProcess.mProcessName.var0, 0);
  objc_storeStrong((id *)&self->_clientProcess.mProcessName.__r_.var0, 0);
  if (*((char *)&self->_clientProcess.mProcessName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__data_);
  objc_destroyWeak((id *)&self->_clientProcess.mClientRelay);

  objc_destroyWeak((id *)&self->_server);
}

- (AVAudioSessionRemoteXPCClient)initWithServer:(id)a3 process:(ProcessInfo *)a4 delegate:
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  AVAudioSessionRemoteXPCClient *v10;
  AVAudioSessionRemoteXPCClient *v11;
  AVAudioSessionXPCClientRelay *v12;
  void *v13;
  id WeakRetained;
  uint64_t (***v15)();
  uint64_t v16;
  as::server *v17;
  uint64_t v18;
  NSObject *v19;
  NSXPCConnection *xpcConnection;
  uint64_t v22;
  id v23;
  id from;
  id to;
  id location;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSXPCConnection *v33;
  __int16 v34;
  AVAudioSessionRemoteXPCClient *v35;
  uint64_t (**v36)();
  id v37;
  uint64_t (***v38)();
  uint64_t (**v39)();
  id v40;
  uint64_t (***v41)();
  uint64_t v42;

  v5 = v4;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v5;
  v27.receiver = self;
  v27.super_class = (Class)AVAudioSessionRemoteXPCClient;
  v10 = -[AVAudioSessionRemoteXPCClient init](&v27, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_16;
  objc_storeWeak((id *)&v10->_server, v8);
  v12 = -[AVAudioSessionXPCClientRelay initWithConnection:token:]([AVAudioSessionXPCClientRelay alloc], "initWithConnection:token:", a4->xpcConnection, a4->token.mValue);
  v13 = *(void **)&v11->_clientProcess.mProcessName.__r_.var0;
  *(_QWORD *)&v11->_clientProcess.mProcessName.__r_.var0 = v12;

  v11->_clientProcess.token.mValue = a4->token.mValue;
  objc_storeStrong((id *)&v11->_clientProcess.xpcConnection, a4->xpcConnection);
  WeakRetained = objc_loadWeakRetained((id *)&a4->mClientRelay);
  objc_storeWeak((id *)&v11->_clientProcess.mClientRelay, WeakRetained);

  std::string::operator=((std::string *)&v11->_clientProcess.mProcessName, (const std::string *)&a4->mProcessName);
  objc_storeWeak((id *)&v11->_clientProcess.mClientRelay, *(id *)&v11->_clientProcess.mProcessName.__r_.var0);
  if (!v11->_clientProcess.xpcConnection)
  {
    v22 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v22);
  }
  objc_storeStrong((id *)&v11->_clientProcess.mProcessName.var0, v5);
  objc_initWeak(&location, v11);
  objc_copyWeak(&to, &location);
  LOBYTE(v11->_clientRelay) = 0;
  v11->_serverDelegate = (AVAudioSessionServerDelegate *)"unknown";
  *(std::chrono::system_clock::time_point *)&v11->_invalidated = std::chrono::system_clock::now();
  objc_copyWeak(&from, &to);
  v41 = 0;
  v39 = &off_1E82050E0;
  objc_moveWeak(&v40, &from);
  v41 = &v39;
  objc_destroyWeak(&from);
  caulk::xpc::reply_watchdog_factory::init2();
  v15 = v41;
  if (v41 == &v39)
  {
    v16 = 4;
    v15 = &v39;
  }
  else
  {
    if (!v41)
      goto LABEL_8;
    v16 = 5;
  }
  (*v15)[v16]();
LABEL_8:
  objc_copyWeak(&v23, &to);
  v38 = 0;
  v36 = &off_1E82050E0;
  objc_moveWeak(&v37, &v23);
  v38 = &v36;
  objc_destroyWeak(&v23);
  caulk::xpc::reply_watchdog_factory::init2();
  v17 = (as::server *)v38;
  if (v38 == &v36)
  {
    v18 = 4;
    v17 = (as::server *)&v36;
    goto LABEL_12;
  }
  if (v38)
  {
    v18 = 5;
LABEL_12:
    v17 = (as::server *)(*(uint64_t (**)(void))(*(_QWORD *)v17 + 8 * v18))();
  }
  v19 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v17));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    xpcConnection = v11->_clientProcess.xpcConnection;
    *(_DWORD *)buf = 136315906;
    v29 = "AVAudioSessionXPCServer.mm";
    v30 = 1024;
    v31 = 721;
    v32 = 2112;
    v33 = xpcConnection;
    v34 = 2048;
    v35 = v11;
    _os_log_impl(&dword_1C895C000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d New connection: %@ (%p)", buf, 0x26u);
  }
  objc_destroyWeak(&to);
  objc_destroyWeak(&location);
LABEL_16:

  return v11;
}

- (void)invalidate
{
  NSXPCConnection *v3;
  as::server *WeakRetained;
  as::server *v5;
  NSObject *v6;
  _BOOL8 v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  NSXPCConnection *v15;
  __int16 v16;
  AVAudioSessionRemoteXPCClient *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_clientProcess.xpcConnection;
  WeakRetained = (as::server *)objc_loadWeakRetained((id *)&self->_server);
  v5 = WeakRetained;
  if (!v3)
  {
    v9 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v9);
  }
  v6 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(WeakRetained));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    v10 = 136315906;
    v11 = "AVAudioSessionXPCServer.mm";
    v12 = 1024;
    v13 = 749;
    v14 = 2112;
    v15 = v3;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1C895C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidated connection: %@ (%p)", (uint8_t *)&v10, 0x26u);
  }
  LOBYTE(self->_clientRelay) = 1;
  if (v5)
  {
    v8 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v7);
    as::server::LegacySessionManager::RemoveSessionsForInvalidatedXPCConnection(v8, v3);
    as::server::LegacySessionManager::RemoveApplicationForInvalidatedXPCConnection((as::server::LegacySessionManager *)v8, v3);
    -[as::server removeConnection:](v5, "removeConnection:", v3);
  }

}

- (id).cxx_construct
{
  self->_clientProcess.token.mValue = 0;
  self->_clientProcess.xpcConnection = 0;
  self->_clientProcess.mClientRelay = 0;
  *(_OWORD *)&self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__size_ = 0uLL;
  self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__data_ = 0;
  *(_QWORD *)&self->_invalidated = 0;
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName);
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[16]);
  return self;
}

void __54__AVAudioSessionRemoteXPCClient_destroySession_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5[4];
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(unsigned int *)(a1 + 40);
  v5[0] = 1;
  v6 = 3972;
  v7 = v2;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  kdebug_trace();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = std::shared_ptr<as::server::AudioApplicationInfo>::~shared_ptr[abi:ne180100](v3);
    MEMORY[0x1CAA38D28](v4, 0x20C40A4A59CD2);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
}

- (void)addMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5
{
  as::server::LegacySessionManager *v6;
  as *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  NSString *v12;
  as::server *IsStandardMXNotificationName;
  NSString *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  audit_token_t v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  as *v34;
  uint64_t v35;

  v6 = *(as::server::LegacySessionManager **)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = (as *)a4;
  v9 = a5;
  v21[0] = 1;
  v22 = 3852;
  v23 = v6;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient addMXNotificationListener:noti"
                                                          "ficationName:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v20, 0, sizeof(v20));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", *(_OWORD *)v20.val, *(_OWORD *)&v20.val[4]);
  if (!VerifySessionOwnership(v6, &v20, 0))
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient addMXNotificationListener:notificationName:reply:]", (int)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v16);
LABEL_11:

    goto LABEL_12;
  }
  IsStandardMXNotificationName = (as::server *)as::IsStandardMXNotificationName(v8, v12);
  if ((_DWORD)IsStandardMXNotificationName)
  {
    v15 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(IsStandardMXNotificationName));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "AVAudioSessionXPCServer.mm";
      v31 = 1024;
      v32 = 2023;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_1C895C000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Skipping registration of standard MXSession notification, %@", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  v17 = as::server::AddMXNotificationListener(v6, &v20, (audit_token_t *)v8, v14);
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Add MX notification listener failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v10)[2](v10, v16);
    goto LABEL_11;
  }
LABEL_7:
  v10[2](v10, 0);
LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);

}

- (void)removeMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5
{
  as::server::LegacySessionManager *v6;
  as *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  NSString *v12;
  as::server *IsStandardMXNotificationName;
  NSString *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  audit_token_t v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  as *v34;
  uint64_t v35;

  v6 = *(as::server::LegacySessionManager **)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = (as *)a4;
  v9 = a5;
  v21[0] = 1;
  v22 = 3853;
  v23 = v6;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient removeMXNotificationListener:n"
                                                          "otificationName:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v20, 0, sizeof(v20));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", *(_OWORD *)v20.val, *(_OWORD *)&v20.val[4]);
  if (!VerifySessionOwnership(v6, &v20, 0))
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient removeMXNotificationListener:notificationName:reply:]", (int)v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v16);
LABEL_11:

    goto LABEL_12;
  }
  IsStandardMXNotificationName = (as::server *)as::IsStandardMXNotificationName(v8, v12);
  if ((_DWORD)IsStandardMXNotificationName)
  {
    v15 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(IsStandardMXNotificationName));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "AVAudioSessionXPCServer.mm";
      v31 = 1024;
      v32 = 2070;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_1C895C000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Skipping deregistration of standard MXSession notification, %@", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  v17 = as::server::RemoveMXNotificationListener(v6, &v20, (audit_token_t *)v8, v14);
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Remove MX notification listener failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v17, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v10)[2](v10, v16);
    goto LABEL_11;
  }
LABEL_7:
  v10[2](v10, 0);
LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);

}

- (void)getSpatialPreferencesForSession:(unsigned int)a3 contentType:(int64_t)a4 reply:(id)a5
{
  as::server::LegacySessionManager *v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  void *v11;
  audit_token_t v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(as::server::LegacySessionManager **)&a3;
  v8 = a5;
  v13[0] = 1;
  v14 = 3857;
  v15 = v6;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSessio"
                                                          "n:contentType:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},AVAudioSessionSpatialPreferences * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v12, 0, sizeof(v12));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", *(_OWORD *)v12.val, *(_OWORD *)&v12.val[4]);
  if (VerifySessionOwnership(v6, &v12, 1))
  {
    objc_msgSend((id)self->_clientProcess.mProcessName.var0, "spatialPreferencesForSession:contentType:", v6, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v11);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:contentType:reply:]", (int)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v11, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

- (void)getProperties:(unsigned int)a3 properties:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  _QWORD v15[5];
  id v16;
  id v17;
  unsigned int v18;

  v8 = a4;
  v9 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getProperties:properties:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSDictionary * {__strong},NSDictionary * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__AVAudioSessionRemoteXPCClient_getProperties_properties_reply___block_invoke;
  v15[3] = &unk_1E8205030;
  v18 = a3;
  v15[4] = self;
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v16 = v12;
  v13 = (void *)MEMORY[0x1CAA39148](v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVAudioSessionRemoteXPCClient *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "AVAudioSessionXPCServer.mm";
    v7 = 1024;
    v8 = 728;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1C895C000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Deallocated connection %p", buf, 0x1Cu);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionRemoteXPCClient;
  -[AVAudioSessionRemoteXPCClient dealloc](&v4, sel_dealloc);
}

- (void)destroySession:(unsigned int)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  as::server::LegacySessionManager *v8;
  os_unfair_lock_s *v9;
  NSXPCConnection *xpcConnection;
  _QWORD *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _BOOL8 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  as::server *v20;
  NSObject *v21;
  as::server *v22;
  void *v23;
  _QWORD v24[5];
  unsigned int v25;
  audit_token_t v26;
  char v27[4];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  audit_token_t atoken;
  uint64_t v34;
  const __CFString *v35;
  audit_token_t buf;
  char v37;
  pid_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v27[0] = 1;
  v28 = 3847;
  v29 = a3;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient destroySession:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v26, 0, sizeof(v26));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v11 = (_QWORD *)operator new();
  *v11 = 0;
  v11[1] = 0;
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v26, a3, 0, &buf);
  std::shared_ptr<as::WorkloopPool>::operator=[abi:ne180100]((uint64_t)v11, (__int128 *)&buf);
  v12 = *(std::__shared_weak_count **)&buf.val[2];
  if (*(_QWORD *)&buf.val[2])
  {
    v13 = (unint64_t *)(*(_QWORD *)&buf.val[2] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  buf = v26;
  v37 = 1;
  atoken = v26;
  v38 = audit_token_to_pid(&atoken);
  v15 = as::server::LegacySessionManager::RemoveSession((as::server::LegacySessionManager *)v9, a3, (const as::server::ProcessIdentity *)&buf);
  if (v15)
  {
    v16 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)v15));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      buf.val[0] = 136315650;
      *(_QWORD *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 1183;
      HIWORD(buf.val[4]) = 1024;
      buf.val[5] = a3;
      _os_log_impl(&dword_1C895C000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Session with ID 0x%x was removed", (uint8_t *)&buf, 0x18u);
    }
    v7[2](v7, 0);
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("Session removal failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v20));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 136315650;
      *(_QWORD *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 1190;
      HIWORD(buf.val[4]) = 1024;
      buf.val[5] = a3;
      _os_log_impl(&dword_1C895C000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Session with ID 0x%x was not removed", (uint8_t *)&buf, 0x18u);
    }
    ((void (**)(_QWORD, void *))v7)[2](v7, v19);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __54__AVAudioSessionRemoteXPCClient_destroySession_reply___block_invoke;
  v24[3] = &__block_descriptor_44_e5_v8__0l;
  v25 = a3;
  v24[4] = v11;
  v22 = (as::server *)MEMORY[0x1CAA39148](v24);
  as::server::GetAudioControlQueue(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  as::server::DispatchBlock(v23, v22, 0, (uint64_t)"-[AVAudioSessionRemoteXPCClient destroySession:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1200, 0, 0);

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v27);
}

- (void)createProxySession:(unsigned int)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD);
  as::server::LegacySessionManager *v8;
  os_unfair_lock_s *v9;
  NSXPCConnection *xpcConnection;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  audit_token_t v17;
  char v18[4];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4;
  v18[0] = 1;
  v19 = 3842;
  v20 = a3;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createProxySession:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v17, 0, sizeof(v17));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v17, a3, 1, &v15);
  if (v15)
  {
    v7[2](v7, 0);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient createProxySession:reply:]", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v11);

  }
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);

}

- (void)pingWithReply:(id)a3
{
  (*((void (**)(id, _QWORD, const __CFString *))a3 + 2))(a3, 0, &stru_1E8205BF8);
}

- (void)sleepWithReply:(unsigned int)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, const __CFString *);

  v6 = a4;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient sleepWithReply:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(id, _QWORD, const __CFString *))objc_claimAutoreleasedReturnValue();

  sleep(a3);
  v7[2](v7, 0, &stru_1E8205BF8);

}

- (id)clientRelay
{
  return *(id *)&self->_clientProcess.mProcessName.__r_.var0;
}

- (void)verifySessionExists:(unsigned int)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  as::server::LegacySessionManager *v8;
  os_unfair_lock_s *v9;
  NSXPCConnection *xpcConnection;
  uint64_t v11;
  as::server *v12;
  NSObject *v13;
  const char *v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  audit_token_t v20;
  char v21[4];
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21[0] = 1;
  v22 = 3844;
  v23 = a3;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient verifySessionExists:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},BOOL>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v20, 0, sizeof(v20));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v20, a3, 1, &v18);
  v11 = v18;
  v13 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v12));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "failed";
    *(_DWORD *)buf = 136315906;
    v28 = "AVAudioSessionXPCServer.mm";
    v30 = 1003;
    v29 = 1024;
    if (v11)
      v14 = "succeeded";
    v31 = 1024;
    v32 = a3;
    v33 = 2080;
    v34 = v14;
    _os_log_impl(&dword_1C895C000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Look up of session ID 0x%x %s", buf, 0x22u);
  }
  ((void (**)(_QWORD, _QWORD, BOOL))v7)[2](v7, 0, v11 != 0);
  v15 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);

}

- (void)updateMicrophonePermissionWithReply:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  pid_t v6;
  uint64_t v7;
  as::server *v8;
  void (**v9)(_QWORD, _QWORD);
  NSObject *v10;
  uint64_t v11;
  char v12[4];
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  audit_token_t atoken;
  audit_token_t v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  pid_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(&v19, 0, sizeof(v19));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  atoken = v19;
  v6 = audit_token_to_pid(&atoken);
  v12[0] = 1;
  v13 = 3844;
  v14 = v6;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient updateMicrophonePermissionWithReply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v9 = (void (**)(_QWORD, _QWORD))v7;
  if (!self->_clientProcess.mProcessName.var0)
  {
    v11 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v11);
  }
  v10 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v8));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "AVAudioSessionXPCServer.mm";
    v22 = 1024;
    v23 = 1017;
    v24 = 1024;
    v25 = v6;
    _os_log_impl(&dword_1C895C000, v10, OS_LOG_TYPE_INFO, "%25s:%-5d Calling out to AudioToolbox to update microphone permission for client process %d", buf, 0x18u);
  }
  objc_msgSend((id)self->_clientProcess.mProcessName.var0, "refreshRecordPermissions:", &v19);
  v9[2](v9, 0);
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v12);

}

- (void)simulatePrimarySessionCreationInsideServerWithReply:(id)a3
{
  as::server::LegacySessionManager *v4;
  void *v5;
  NSXPCConnection *xpcConnection;
  as::server *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  audit_token_t v17;
  audit_token_t atoken;
  uint64_t v19;
  const __CFString *v20;
  audit_token_t buf;
  char v22;
  pid_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (as::server::LegacySessionManager *)a3;
  v5 = as::server::LegacySessionManager::Instance(v4);
  memset(&v17, 0, sizeof(v17));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  buf = v17;
  v22 = 1;
  atoken = v17;
  v23 = audit_token_to_pid(&atoken);
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v5, (uint64_t)&buf, 0, (void *)self->_clientProcess.mProcessName.var0, 1, (uint64_t)&v15);
  if (v15)
  {
    (*((void (**)(as::server::LegacySessionManager *, _QWORD, _QWORD))v4 + 2))(v4, 0, *(unsigned int *)(v15 + 8));
  }
  else
  {
    v8 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v7));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 136315394;
      *(_QWORD *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 1038;
      _os_log_impl(&dword_1C895C000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed", (uint8_t *)&buf, 0x12u);
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Session creation failed in server");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 2003329396, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(as::server::LegacySessionManager *, void *, _QWORD))v4 + 2))(v4, v11, 0);
  }
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

}

- (void)createSession:(unint64_t)a3 sourceAuditToken:(id *)a4 sourceSessionID:(unsigned int)a5 nameOrDeviceUID:(id)a6 clientProcessName:(id)a7 useCaseIdentifier:(unsigned int)a8 reply:(id)a9
{
  id v15;
  NSXPCConnection *xpcConnection;
  as::server *v17;
  as::server::LegacySessionManager *v18;
  int v19;
  int v20;
  void *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  unsigned int v24;
  __int128 v25;
  as::server *v26;
  void **WeakRetained;
  void *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  NSXPCConnection *v34;
  void **v35;
  __int128 v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  as::server *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  os_unfair_lock_s *v51;
  void *v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  id v66;
  id v67;
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  audit_token_t v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  __int128 v75;
  char v76[4];
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  audit_token_t atoken;
  audit_token_t v83;
  uint64_t v84;
  const __CFString *v85;
  _BYTE buf[90];
  char v87;
  uint64_t v88;
  const __CFString *v89;
  uint64_t v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v66 = a6;
  v67 = a7;
  v15 = a9;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createSession:sourceAuditToken"
                                                          ":sourceSessionID:nameOrDeviceUID:clientProcessName:useCaseIdentifier:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 30000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[16], v15);
  v68 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v83, 0, sizeof(v83));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  atoken = v83;
  v17 = (as::server *)audit_token_to_pid(&atoken);
  v76[0] = 1;
  v77 = 3846;
  v78 = (int)v17;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v18 = (as::server::LegacySessionManager *)kdebug_trace();
  if ((uint64_t)a3 <= 1886546284)
  {
    if ((uint64_t)a3 > 1668314225)
    {
      if (a3 == 1668314226)
      {
        v19 = 1668314112;
        v20 = 114;
      }
      else
      {
        if (a3 != 1718183795)
          goto LABEL_63;
        v19 = 1718183680;
        v20 = 115;
      }
    }
    else if (a3 == 1635088489)
    {
      v19 = 1635088384;
      v20 = 105;
    }
    else
    {
      if (a3 != 1635148646)
        goto LABEL_63;
      v19 = 1635148544;
      v20 = 102;
    }
  }
  else if ((uint64_t)a3 <= 1935897188)
  {
    if (a3 == 1886546285)
    {
      v19 = 1886546176;
      v20 = 109;
    }
    else
    {
      if (a3 != 1935830119)
        goto LABEL_63;
      v20 = 103;
      v19 = 1935830016;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x73637265uLL:
        v19 = 1935897088;
        v20 = 101;
        break;
      case 0x7369646BuLL:
        v19 = 1936286720;
        v20 = 107;
        break;
      case 0x77686F3FuLL:
        v19 = 2003332864;
        v20 = 63;
        break;
      default:
LABEL_63:
        v56 = (void *)MEMORY[0x1E0CB35C8];
        v90 = *MEMORY[0x1E0CB2D50];
        v91[0] = CFSTR("Invalid session type");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD))v68)[2](v68, v58, 0, 0, 0, 0);
        goto LABEL_72;
    }
  }
  v21 = as::server::LegacySessionManager::Instance(v18);
  v22 = 0;
  v23 = 0;
  v24 = v19 | v20;
  v75 = 0uLL;
  v73 = 0;
  v74 = 0;
  if (v24 == 1935830119)
  {
    if (a5 == -1)
    {
      v25 = *(_OWORD *)&a4->var0[4];
      *(_OWORD *)v72.val = *(_OWORD *)a4->var0;
      *(_OWORD *)&v72.val[4] = v25;
      v26 = (as::server *)audit_token_to_pid(&v72);
      if ((_DWORD)v26 == -1)
      {
        v59 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v26));
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1093;
          _os_log_impl(&dword_1C895C000, v59, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed due to AVAudioSessionTokenNoAudioSessionForServer and invalid audit token", buf, 0x12u);
        }
        v60 = (void *)MEMORY[0x1E0CB35C8];
        v88 = *MEMORY[0x1E0CB2D50];
        v89 = CFSTR("Session creation failed in server");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 2003329396, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD))v68)[2](v68, v62, 0, 0, 0, 0);
        goto LABEL_67;
      }
    }
    WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_server);
    as::server::LegacySessionManager::FindSourceSessionForSibling((os_unfair_lock_s *)v21, (uint64_t)a4, a5, WeakRetained[8], buf);
    v23 = *(_QWORD *)buf;
    v22 = *(std::__shared_weak_count **)&buf[8];
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v73 = v23;
    v74 = v22;

  }
  as::server::BundleIdentifierForPID(v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v23;
  v71 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
  }
  as::server::LegacySessionManager::BuildCreationDescription((__int128 *)&v83, v24, v67, v28, &v70, v66, a8, (uint64_t)buf);
  v31 = v71;
  if (v71)
  {
    v32 = (unint64_t *)&v71->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  if (v87)
  {
    v34 = self->_clientProcess.xpcConnection;
    v35 = (void **)objc_loadWeakRetained((id *)&self->_server);
    as::server::LegacySessionManager::CreateSession((os_unfair_lock_s *)v21, (uint64_t)buf, v34, v35[8], &v69);
    v36 = v69;
    v69 = 0uLL;
    v37 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
    v75 = v36;
    if (v37)
    {
      v38 = (unint64_t *)&v37->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v40 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
    if (*((_QWORD *)&v69 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }

  }
  v43 = (as::server *)std::__optional_destruct_base<as::server::SessionCreationDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)buf);
  v44 = v75;
  if ((_QWORD)v75)
  {
    v45 = *(unsigned int *)(v75 + 8);
    if (v73)
      v46 = *(unsigned int *)(v73 + 8);
    else
      v46 = 0;
    v51 = (os_unfair_lock_s *)*((_QWORD *)v21 + 31);
    if (v51)
    {
      os_unfair_lock_lock(*((os_unfair_lock_t *)v21 + 31));
      as::server::DeviceTimeObserver::xpcSharedMemoryObject((as::server::DeviceTimeObserver *)&v51[2]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, uint64_t, void *, _QWORD, uint64_t))v68)[2](v68, 0, v45, v52, *(unsigned int *)(v44 + 536), v46);

      os_unfair_lock_unlock(v51);
    }
    else
    {
      v68[2](v68, 0, *(unsigned int *)(v75 + 8), 0, 0, v46);
    }
  }
  else
  {
    v47 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v43));
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1148;
      _os_log_impl(&dword_1C895C000, v47, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed", buf, 0x12u);
    }
    v48 = (void *)MEMORY[0x1E0CB35C8];
    v84 = *MEMORY[0x1E0CB2D50];
    v85 = CFSTR("Session creation failed in server");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 2003329396, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD, _QWORD, _QWORD, _QWORD))v68)[2](v68, v50, 0, 0, 0, 0);
  }

  v53 = v74;
  if (v74)
  {
    v54 = (unint64_t *)&v74->__shared_owners_;
    do
      v55 = __ldaxr(v54);
    while (__stlxr(v55 - 1, v54));
    if (!v55)
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
LABEL_67:
  v63 = (std::__shared_weak_count *)*((_QWORD *)&v75 + 1);
  if (*((_QWORD *)&v75 + 1))
  {
    v64 = (unint64_t *)(*((_QWORD *)&v75 + 1) + 8);
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *))v63->__on_zero_shared)(v63);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
LABEL_72:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v76);

}

void __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  as::server::ConstAudioSessionInfo *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  as::server *HasMXPropertyPipeEntitlement;
  int v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t isKindOfClass;
  void *v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  _BYTE *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  int v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  NSNumber *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  as::server *v61;
  void *v62;
  as *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  int v67;
  audit_token_t v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  as::server::ConstAudioSessionInfo *v74;
  std::__shared_weak_count *v75;
  audit_token_t v76;
  char v77[4];
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  const __CFString *v88;
  uint64_t v89;
  const __CFString *v90;
  _BYTE v91[128];
  uint64_t v92;
  const __CFString *v93;
  uint64_t v94;
  _BYTE v95[12];
  __int16 v96;
  int v97;
  __int16 v98;
  uint64_t v99;
  _BYTE buf[18];
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  int v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  v77[0] = 1;
  v78 = 3849;
  v79 = v2;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  kdebug_trace();
  memset(&v76, 0, sizeof(v76));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
    objc_msgSend(v3, "auditToken");
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v74, *(_DWORD *)(a1 + 56), &v76, 1);
  v4 = v74;
  if (v74)
  {
    if (!*(_BYTE *)(a1 + 64))
      goto LABEL_13;
    v5 = v75;
    *(_QWORD *)buf = v74;
    *(_QWORD *)&buf[8] = v75;
    if (v75)
    {
      p_shared_owners = (unint64_t *)&v75->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    HasMXPropertyPipeEntitlement = (as::server *)as::server::ConstAudioSessionInfo::HasMXPropertyPipeEntitlement(v4, &v76);
    v9 = (int)HasMXPropertyPipeEntitlement;
    if (!v5)
      goto LABEL_12;
    v10 = (unint64_t *)&v5->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
      if (v9)
      {
LABEL_13:
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(id *)(a1 + 40);
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v84;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v84 != v16)
                objc_enumerationMutation(v14);
              v18 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) == 0)
              {
                v24 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)isKindOfClass));
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v95 = 136315650;
                  *(_QWORD *)&v95[4] = "AVAudioSessionXPCServer.mm";
                  v96 = 1024;
                  v97 = 396;
                  v98 = 2112;
                  v99 = v18;
                  _os_log_impl(&dword_1C895C000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Unexpected dictionary key %@. All keys must be NSStrings", v95, 0x1Cu);
                }
                v25 = objc_msgSend(*(id *)(v12 + 24), "processIdentifier");
                v26 = (void *)MEMORY[0x1E0CB3940];
                as::server::ProcessInfo::processName((as::server::ProcessInfo *)(v12 + 16), (std::string *)v95);
                if ((v99 & 0x80000000) == 0)
                  v27 = v95;
                else
                  v27 = *(_BYTE **)v95;
                objc_msgSend(v26, "stringWithUTF8String:", v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (SBYTE3(v99) < 0)
                  operator delete(*(void **)v95);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SetProperties failed for client %@(%d). Invalid dictionary key=%@"), v28, v25, v18);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (void *)MEMORY[0x1E0CB35C8];
                v94 = *MEMORY[0x1E0CB2D50];
                *(_QWORD *)v95 = v29;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v31);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_33;
              }
            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
            if (v15)
              continue;
            break;
          }
        }
        v20 = 0;
LABEL_33:

        if (v20)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_51;
        }
        if (*(_BYTE *)(a1 + 65))
        {
          v32 = *(void **)(a1 + 40);
          v33 = *(_DWORD *)(a1 + 56);
          v34 = *(_DWORD *)(a1 + 60);
          v69 = 0;
          v35 = as::server::forbid_acq::SetPropertiesOnMXSession(v33, &v76, v32, v34, &v69);
          v36 = v69;
          if (!v35)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_50;
          }
          v37 = (void *)MEMORY[0x1E0CB35C8];
          v89 = *MEMORY[0x1E0CB2D50];
          v90 = CFSTR("Failed to set properties");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v35, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_49:

LABEL_50:
          goto LABEL_51;
        }
        v36 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
        v53 = atomic_load((unsigned __int8 *)&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute);
        if ((v53 & 1) == 0)
        {
          v63 = (as *)__cxa_guard_acquire(&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute);
          if ((_DWORD)v63)
          {
            _ZZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute = as::AudioSessionMuteEnabled(v63);
            __cxa_guard_release(&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute);
          }
        }
        objc_msgSend(v36, "objectForKey:", CFSTR("MuteSessionInputs"));
        v54 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v54;
        if (!_ZZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute
          && v54)
        {
          objc_msgSend(v36, "removeObjectForKey:", CFSTR("MuteSessionInputs"));
          v56 = as::server::forbid_acq::MuteSessionInputsForAudioApp((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), v39, v55);
          if (v56)
          {
            v57 = (void *)MEMORY[0x1E0CB35C8];
            v87 = *MEMORY[0x1E0CB2D50];
            v88 = CFSTR("MuteSessionInput error");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v56, v58);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_49;
          }
          if (!objc_msgSend(v36, "count"))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_49;
          }
        }

        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke_160;
        v64[3] = &unk_1E8204F18;
        v60 = v36;
        v65 = v60;
        v67 = *(_DWORD *)(a1 + 56);
        v68 = v76;
        v66 = *(id *)(a1 + 48);
        v61 = (as::server *)MEMORY[0x1CAA39148](v64);
        as::server::GetAudioControlQueue(v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        as::server::DispatchBlock(v62, v61, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXProperties:batchStrategy:genericMXPipe:reply:]_block_invoke_2", (uint64_t)"AVAudioSessionXPCServer.mm", 1318, 0, 0);

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_51;
      }
    }
    else
    {
LABEL_12:
      if ((_DWORD)HasMXPropertyPipeEntitlement)
        goto LABEL_13;
    }
    v40 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(HasMXPropertyPipeEntitlement));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = *(_QWORD *)(a1 + 40);
      v42 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1228;
      v101 = 2112;
      v102 = v41;
      v103 = 1024;
      v104 = v42;
      _os_log_impl(&dword_1C895C000, v40, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set MXProperty: %@ on generic pipe for session: 0x%x due to missing entitlement.", buf, 0x22u);
    }
    v43 = (void *)MEMORY[0x1E0CB35C8];
    v92 = *MEMORY[0x1E0CB2D50];
    v93 = CFSTR("Entitlement required to use generic property setter SPI");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 1701737535, v44);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (id)objc_opt_new();
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v45 = *(id *)(a1 + 40);
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v71 != v47)
            objc_enumerationMutation(v45);
          v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E8208240, *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j), 0);
          objc_msgSend(v36, "addObject:", v49);

        }
        v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
      }
      while (v46);
    }

    v39 = (void *)objc_msgSend(v36, "copy");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_49;
  }
  v21 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(0));
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1220;
    v101 = 1024;
    LODWORD(v102) = v22;
    _os_log_impl(&dword_1C895C000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Cannot get session info for session ID: 0x%x", buf, 0x18u);
  }
  v23 = *(_QWORD *)(a1 + 48);
  BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXProperties:batchStrategy:genericMXPipe:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v23 + 16))(v23, v20, 0);
LABEL_51:

  v50 = v75;
  if (v75)
  {
    v51 = (unint64_t *)&v75->__shared_owners_;
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v77);
}

void __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke_160(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  AudioSession *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  const __CFString *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v7 = (AudioSession *)*(unsigned int *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v6, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = as::server::require_acq::SetPropertyLocal(v7, a1 + 52, v6, v8);

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0CB35C8];
          v17 = *MEMORY[0x1E0CB2D50];
          v18 = CFSTR("AudioSessionSetPropertyLocal error");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v9, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)silenceOutput:(unsigned int)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8;
  void *v9;
  as::server *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  unint64_t v15;
  unsigned int v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a5;
  v17[0] = 1;
  v18 = 3854;
  v19 = a3;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient silenceOutput:options:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  as::server::GetAudioControlQueue(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__AVAudioSessionRemoteXPCClient_silenceOutput_options_reply___block_invoke;
  v13[3] = &unk_1E8204F68;
  v16 = a3;
  v15 = a4;
  v12 = v9;
  v14 = v12;
  as::server::DispatchBlock(v11, v13, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient silenceOutput:options:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1345, 0, 0);

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
}

void __61__AVAudioSessionRemoteXPCClient_silenceOutput_options_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 48);
  LOBYTE(v7) = 1;
  HIDWORD(v7) = 3973;
  v8 = v2;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  kdebug_trace();
  v3 = as::server::require_acq::AudioSessionSilenceOutput((as::server::require_acq *)*(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 40));
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("AudioSessionSilenceOutput error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v7, v8, v9, v10, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)&v7);
}

- (void)getIOControllerPeriod:(unsigned int)a3 decoupledInput:(BOOL)a4 reply:(id)a5
{
  _BOOL4 v5;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, double);
  as::server::LegacySessionManager *v10;
  void *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17[4];
  char v18;
  char v19[4];
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v5 = a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v19[0] = 1;
  v20 = 3855;
  v21 = a3;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getIOControllerPeriod:decoupledInput:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},double,unsigned long>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();

  v11 = as::server::LegacySessionManager::Instance(v10);
  v12 = (os_unfair_lock_s *)*((_QWORD *)v11 + 31);
  if (!v12)
  {
    v13 = -1;
LABEL_6:
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("sessionDeviceIOPeriod error");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD, double))v9)[2](v9, v16, 0, 0.0);
    goto LABEL_7;
  }
  os_unfair_lock_lock(*((os_unfair_lock_t *)v11 + 31));
  as::server::DeviceTimeObserver::sessionDeviceIOPeriod((as::server::DeviceTimeObserver *)&v12[2], a3, v5, (uint64_t)v17);
  os_unfair_lock_unlock(v12);
  if (!v18)
  {
    v13 = SLODWORD(v17[0]);
    goto LABEL_6;
  }
  v9[2](v9, 0, *(_QWORD *)&v17[2], v17[0]);
LABEL_7:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);

}

- (void)setSession:(unsigned int)a3 decoupledInput:(BOOL)a4 hasIOEventListeners:(BOOL)a5 reply:(id)a6
{
  _BOOL4 v7;
  as::server::LegacySessionManager *v8;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  _BOOL8 v13;
  void *v14;
  os_unfair_lock_s *v15;
  void *v16;
  audit_token_t v17;
  char v18[4];
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = a4;
  v8 = *(as::server::LegacySessionManager **)&a3;
  v10 = a6;
  v18[0] = 1;
  v19 = 3856;
  v20 = v8;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setSession:decoupledInput:hasI"
                                                          "OEventListeners:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v10);
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v17, 0, sizeof(v17));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", *(_OWORD *)v17.val, *(_OWORD *)&v17.val[4]);
  v13 = VerifySessionOwnership(v8, &v17, 0);
  if (v13)
  {
    v14 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v13);
    v15 = (os_unfair_lock_s *)*((_QWORD *)v14 + 31);
    if (v15)
    {
      os_unfair_lock_lock(*((os_unfair_lock_t *)v14 + 31));
      as::server::DeviceTimeObserver::sessionHasIOEventListeners((as::server::DeviceTimeObserver *)&v15[2], v8, v7, a5);
      os_unfair_lock_unlock(v15);
    }
    v11[2](v11, 0);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient setSession:decoupledInput:hasIOEventListeners:reply:]", (int)v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v16);

  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);

}

- (void)getSpatialPreferencesForSession:(unsigned int)a3 reply:(id)a4
{
  as::server::LegacySessionManager *v4;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  void *v9;
  audit_token_t v10;
  char v11[4];
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(as::server::LegacySessionManager **)&a3;
  v6 = a4;
  v11[0] = 1;
  v12 = 3857;
  v13 = v4;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},AVAudioSessionSpatialPreferences * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", *(_OWORD *)v10.val, *(_OWORD *)&v10.val[4]);
  if (VerifySessionOwnership(v4, &v10, 1))
  {
    as::server::forbid_acq::SpatialPreferences((void *)self->_clientProcess.mProcessName.var0, (uint64_t)v4, &v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v9);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:reply:]", (int)v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, v9, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
}

- (void)handleRemoteInterruption:(unsigned int)a3 interruptionStatus:(id)a4 postInterruptionNotification:(BOOL)a5 reply:(id)a6
{
  as::server::LegacySessionManager *v7;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  as::server::ConstAudioSessionInfo *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  as::server::ConstAudioSessionInfo *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  as::server::ConstAudioSessionInfo *v35;
  std::__shared_weak_count *v36;
  std::string v37;
  CFTypeRef cf;
  as::server::ConstAudioSessionInfo *v39;
  std::__shared_weak_count *v40;
  audit_token_t v41;
  char v42[4];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[2];

  v7 = *(as::server::LegacySessionManager **)&a3;
  v49[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v42[0] = 1;
  v43 = 3858;
  v44 = v7;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:inter"
                                                          "ruptionStatus:postInterruptionNotification:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v10);
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v41, 0, sizeof(v41));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  if (VerifySessionOwnership(v7, &v41, 1))
  {
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v39, v7);
    v13 = v39;
    if (v39)
    {
      v14 = v40;
      if (v40)
      {
        p_shared_owners = (unint64_t *)&v40->__shared_owners_;
        do
          v16 = __ldxr(p_shared_owners);
        while (__stxr(v16 + 1, p_shared_owners));
        as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v13, &cf);
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      else
      {
        as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v39, &cf);
      }
      v20 = MXSessionEndInterruption_WithInterruptionNotification();
      if ((_DWORD)v20)
      {
        v21 = v39;
        if (!v39)
        {
          v34 = _os_crash();
          as::server::require_acq::AudioSessionServerSetClientPlayState(v34);
        }
        v22 = v40;
        v35 = v39;
        v36 = v40;
        if (v40)
        {
          v23 = (unint64_t *)&v40->__shared_owners_;
          do
            v24 = __ldxr(v23);
          while (__stxr(v24 + 1, v23));
        }
        if (*((char *)v21 + 223) < 0)
          std::string::__init_copy_ctor_external(&v37, *((const std::string::value_type **)v21 + 25), *((_QWORD *)v21 + 26));
        else
          v37 = *(std::string *)((char *)v21 + 200);
        if (v22)
        {
          v25 = (unint64_t *)&v22->__shared_owners_;
          do
            v26 = __ldaxr(v25);
          while (__stlxr(v26 - 1, v25));
          if (!v26)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        v27 = as::server::TranslateCMSessionErrorCode((uint64_t)"MXSessionEndInterruption_WithInterruptionNotification", (uint64_t *)&v37, 1460, v20);
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v48 = *MEMORY[0x1E0CB2D50];
        v49[0] = CFSTR("handling remote interruption failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1, v35, v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *))v11)[2](v11, v30);
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v37.__r_.__value_.__l.__data_);
      }
      else
      {
        v11[2](v11, 0);
      }
      if (cf)
        CFRelease(cf);
    }
    else
    {
      BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:interruptionStatus:postInterruptionNotification:reply:]", (int)v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v19);

    }
    v31 = v40;
    if (v40)
    {
      v32 = (unint64_t *)&v40->__shared_owners_;
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
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:interruptionStatus:postInterruptionNotification:reply:]", (int)v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v18);

  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v42);

}

- (void)setSessionPlayState:(unsigned int)a3 playState:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(id)a6 modes:(unsigned int)a7 reply:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  as::server *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;

  v13 = a6;
  v14 = a8;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__AVAudioSessionRemoteXPCClient_setSessionPlayState_playState_playerType_playerRef_modes_reply___block_invoke;
  v19[3] = &unk_1E8204F90;
  v15 = v13;
  v20 = v15;
  v22 = a3;
  v23 = a5;
  v24 = a7;
  v25 = a4;
  v16 = v14;
  v21 = v16;
  v17 = (as::server *)MEMORY[0x1CAA39148](v19);
  as::server::GetAudioControlQueue(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  as::server::DispatchBlock(v18, v17, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient setSessionPlayState:playState:playerType:playerRef:modes:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1494, 0, 0);

}

void __96__AVAudioSessionRemoteXPCClient_setSessionPlayState_playState_playerType_playerRef_modes_reply___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  v2 = as::server::require_acq::AudioSessionServerSetClientPlayState((AudioSession *)*(unsigned int *)(a1 + 48), *(_DWORD *)(a1 + 52), (AudioSession *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), (AudioSession *)*(unsigned int *)(a1 + 56), *(_DWORD *)(a1 + 60), (char *)&v6, 0);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Setting Play State Failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)activateSession:(unsigned int)a3 options:(unint64_t)a4 deviceInfo:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  as::server::LegacySessionManager *v9;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  as::server::LegacySessionManager *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  os_unfair_lock_s *v22;
  unint64_t v23;
  unsigned __int8 v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  as::server::ConstAudioSessionInfoAccessor *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  unsigned __int8 v38;
  NSObject *v39;
  const void *v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  int v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[5];
  void (**v53)(_QWORD, _QWORD);
  unint64_t v54;
  int v55;
  audit_token_t v56;
  CFTypeRef cf;
  std::__shared_weak_count *v58;
  audit_token_t v59;
  char v60[4];
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE buf[18];
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  int v70;
  uint64_t v71;

  v9 = *(as::server::LegacySessionManager **)&a3;
  v71 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  v60[0] = 1;
  v61 = 3840;
  v62 = v9;
  v63 = 0;
  v64 = 0;
  v65 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient activateSession:options:device"
                                                          "Info:requestID:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v12);
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v59, 0, sizeof(v59));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  if (!VerifySessionOwnership(v9, &v59, 1))
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (int)v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v28);

    goto LABEL_62;
  }
  v15 = (as::server::LegacySessionManager *)as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)buf, v9);
  v16 = *(_QWORD *)buf;
  if (!*(_QWORD *)buf)
  {
    v50 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v50);
  }
  v17 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
    v20 = *(_DWORD *)(v16 + 92);
    do
      v21 = __ldaxr(v18);
    while (__stlxr(v21 - 1, v18));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
    if (v20 == 1935830119)
      goto LABEL_13;
  }
  else if (*(_DWORD *)(*(_QWORD *)buf + 92) == 1935830119)
  {
LABEL_13:
    v22 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v15);
    as::server::LegacySessionManager::FindSourceSessionForSibling(v22, (uint64_t)&v59, (int)v9, (void *)self->_clientProcess.mProcessName.var0, &cf);
    v23 = a4;
    if (cf)
    {
      v24 = atomic_load((unsigned __int8 *)cf + 540);
      v23 = v24 & 1 | a4;
    }
    v25 = v58;
    if (v58)
    {
      p_shared_owners = (unint64_t *)&v58->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    goto LABEL_32;
  }
  v29 = *(_QWORD *)buf;
  if (!*(_QWORD *)buf)
  {
    v51 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v51);
  }
  v30 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v31 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v32 = __ldxr(v31);
    while (__stxr(v32 + 1, v31));
    atomic_store((a4 & 0x4000000) != 0, (unsigned __int8 *)(v29 + 540));
    do
      v33 = __ldaxr(v31);
    while (__stlxr(v33 - 1, v31));
    v23 = a4;
    if (v33)
      goto LABEL_32;
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  else
  {
    atomic_store((a4 & 0x4000000) != 0, (unsigned __int8 *)(*(_QWORD *)buf + 540));
  }
  v23 = a4;
LABEL_32:
  as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)buf);
  if ((a4 & 0x20008000) != 0)
    goto LABEL_69;
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor(v34, v9);
  v40 = *(const void **)buf;
  if (*(_QWORD *)buf)
  {
    v41 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v42 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v40, &cf);
      do
        v44 = __ldaxr(v42);
      while (__stlxr(v44 - 1, v42));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
        std::__shared_weak_count::__release_weak(v41);
      }
    }
    else
    {
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(*(CFTypeRef *)buf, &cf);
    }
    if (as::server::IsSessionActive((as::server *)cf, 0))
    {
      v13[2](v13, 0);
      v46 = 1;
    }
    else
    {
      v46 = 0;
    }
    v34 = (as::server::ConstAudioSessionInfoAccessor *)cf;
    if (cf)
      CFRelease(cf);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (int)v9);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v45);

    v46 = 1;
  }
  v47 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v48 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
      std::__shared_weak_count::__release_weak(v47);
    }
  }
  if (!v46)
  {
LABEL_69:
    if (HIDWORD(v23))
    {
      v35 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v34));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1637;
        v67 = 2048;
        v68 = v23;
        v69 = 1024;
        v70 = (int)v9;
        _os_log_impl(&dword_1C895C000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid AVAudioSessionSetActiveOptions value: %lu in activation for sessionID 0x%x", buf, 0x22u);
      }
    }
    v52[1] = 3221225472;
    v56 = v59;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[2] = __84__AVAudioSessionRemoteXPCClient_activateSession_options_deviceInfo_requestID_reply___block_invoke;
    v52[3] = &unk_1E8204FB8;
    v55 = (int)v9;
    v52[4] = self;
    v54 = v23;
    v53 = v13;
    v36 = MEMORY[0x1CAA39148](v52);
    v37 = (void *)v36;
    if ((v38 & 1) == 0)
    {
      if ((_DWORD)v36)
      {
        as::OffloadActivationOffACQ(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::OffloadActivationOffACQ(void)::enabled)
    {
      as::server::GetActivationQueue((as::server *)v36);
      v39 = objc_claimAutoreleasedReturnValue();
      dispatch_async_and_wait(v39, v37);
    }
    else
    {
      as::server::GetAudioControlQueue((as::server *)v36);
      v39 = objc_claimAutoreleasedReturnValue();
      as::server::DispatchBlock(v39, v37, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1742, 0, 0);
    }

  }
LABEL_62:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v60);

}

void __84__AVAudioSessionRemoteXPCClient_activateSession_options_deviceInfo_requestID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  gsl::details *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  LOBYTE(v13) = 1;
  HIDWORD(v13) = 3968;
  v14 = v2;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v3 = (gsl::details *)kdebug_trace();
  v4 = *(_QWORD *)(a1 + 48);
  if (HIDWORD(v4))
    gsl::details::terminate(v3);
  v8 = as::server::ff_acq::AudioSessionServerActivateWithFlags(*(void **)(*(_QWORD *)(a1 + 32) + 72), (AudioSession *)*(unsigned int *)(a1 + 56), a1 + 60, v4);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2D50];
    v19[0] = CFSTR("Session activation failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v13, v14, v15, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 1768386162)
      v11 = 0;
    else
      v11 = v8;
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, v5, v6, v7);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)&v13);
}

- (void)deactivateSession:(unsigned int)a3 options:(unint64_t)a4 priority:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  as::server::LegacySessionManager *v9;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  _BOOL8 v15;
  const void *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  AVAudioSessionRemoteXPCClient *v34;
  void (**v35)(_QWORD, _QWORD);
  unint64_t v36;
  int v37;
  audit_token_t v38;
  CFTypeRef cf;
  audit_token_t v40;
  char v41[4];
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE buf[18];
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v9 = *(as::server::LegacySessionManager **)&a3;
  v52 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a7;
  v41[0] = 1;
  v42 = 3841;
  v43 = v9;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:prio"
                                                          "rity:requestID:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v12);
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v40, 0, sizeof(v40));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v15 = VerifySessionOwnership(v9, &v40, 1);
  if (!v15)
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (int)v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v21);
LABEL_36:

    goto LABEL_37;
  }
  if (a4 || v11)
  {
    if (!HIDWORD(a4))
      goto LABEL_31;
    v22 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)v15));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1820;
      v48 = 2048;
      v49 = a4;
      v50 = 1024;
      v51 = (int)v9;
      _os_log_impl(&dword_1C895C000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid AVAudioSessionSetActiveOptions value: %lu in deactivation for sessionID: 0x%x. Clearing options to 0.", buf, 0x22u);
    }
    goto LABEL_30;
  }
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)buf, v9);
  v16 = *(const void **)buf;
  if (*(_QWORD *)buf)
  {
    v17 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v18 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v16, &cf);
      do
        v20 = __ldaxr(v18);
      while (__stlxr(v20 - 1, v18));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    else
    {
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(*(CFTypeRef *)buf, &cf);
    }
    if (as::server::IsSessionActive((as::server *)cf, (const void *)1))
    {
      v24 = 0;
    }
    else
    {
      v13[2](v13, 0);
      v24 = 1;
    }
    if (cf)
      CFRelease(cf);
  }
  else
  {
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (int)v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v13)[2](v13, v23);

    v24 = 1;
  }
  v25 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v26 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
      if (v24)
        goto LABEL_37;
      goto LABEL_30;
    }
  }
  if (!v24)
  {
LABEL_30:
    a4 = 0;
LABEL_31:
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __84__AVAudioSessionRemoteXPCClient_deactivateSession_options_priority_requestID_reply___block_invoke;
    v32[3] = &unk_1E8204FE0;
    v37 = (int)v9;
    v33 = v11;
    v34 = self;
    v38 = v40;
    v36 = a4;
    v35 = v13;
    v28 = MEMORY[0x1CAA39148](v32);
    v29 = (void *)v28;
    if ((v30 & 1) == 0)
    {
      if ((_DWORD)v28)
      {
        as::OffloadActivationOffACQ(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::OffloadActivationOffACQ(void)::enabled)
    {
      as::server::GetActivationQueue((as::server *)v28);
      v31 = objc_claimAutoreleasedReturnValue();
      dispatch_async_and_wait(v31, v29);
    }
    else
    {
      as::server::GetAudioControlQueue((as::server *)v28);
      v31 = objc_claimAutoreleasedReturnValue();
      as::server::DispatchBlock(v31, v29, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1848, 0, 0);
    }

    v21 = v33;
    goto LABEL_36;
  }
LABEL_37:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v41);

}

void __84__AVAudioSessionRemoteXPCClient_deactivateSession_options_priority_requestID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 64);
  LOBYTE(v10) = 1;
  HIDWORD(v10) = 3969;
  v11 = v2;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  kdebug_trace();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = as::server::ff_acq::AudioSessionServerDeactivateAndSetPriority(*(void **)(*(_QWORD *)(a1 + 40) + 72), *(unsigned int *)(a1 + 64), (as::server::AudioSessionInfoAccessor *)(a1 + 68), objc_msgSend(v3, "unsignedIntValue", v10, v11, v12, v13, v14));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (HIDWORD(v5))
      gsl::details::terminate(0);
    v4 = as::server::ff_acq::AudioSessionServerDeactivateWithFlags(*(void **)(*(_QWORD *)(a1 + 40) + 72), *(unsigned int *)(a1 + 64), (as::server::AudioSessionInfoAccessor *)(a1 + 68), v5);
  }
  v6 = v4;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Session deactivation failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)&v10);
}

void __75__AVAudioSessionRemoteXPCClient_getProperty_propertyName_MXProperty_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15[2];
  audit_token_t v16;
  char v17[4];
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  v17[0] = 1;
  v18 = 3848;
  v19 = v2;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  kdebug_trace();
  memset(&v16, 0, sizeof(v16));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
    objc_msgSend(v3, "auditToken");
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v16, 1))
  {
    if (*(_BYTE *)(a1 + 60))
    {
      as::server::forbid_acq::GetPropertyMX((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), *(audit_token_t **)(a1 + 40), 0, &v16, (uint64_t)v15);
      v5 = SLODWORD(v15[0]);
      if (LODWORD(v15[0]))
      {
        v6 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2D50];
        v26[0] = CFSTR("MXSessionGetProperty error");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      as::server::forbid_acq::GetPropertyLocal(v15, (as::server::forbid_acq *)*(unsigned int *)(a1 + 56), &v16, *(const audit_token_t **)(a1 + 40), v4);
      v11 = SLODWORD(v15[0]);
      if (LODWORD(v15[0]))
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = CFSTR("GetPropertyLocal error");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_11;
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a1 + 48);
  BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getProperty:propertyName:MXProperty:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v9 + 16))(v9, v10, 0, 0);

LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
}

void __77__AVAudioSessionRemoteXPCClient_getMXPropertyGenericPipe_propertyName_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  audit_token_t v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  v13[0] = 1;
  v14 = 3850;
  v15 = v2;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  memset(&v12, 0, sizeof(v12));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
    objc_msgSend(v3, "auditToken");
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v12, 1))
  {
    as::server::forbid_acq::GetPropertyMX((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), *(audit_token_t **)(a1 + 40), (NSString *)1, &v12, (uint64_t)&v10);
    v4 = v10;
    if (v10)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = CFSTR("MXSessionGetProperty error");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getMXPropertyGenericPipe:propertyName:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v8 + 16))(v8, v9, 0, 0);

  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

void __64__AVAudioSessionRemoteXPCClient_getProperties_properties_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  id v11;
  audit_token_t v12;
  char v13[4];
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(unsigned int *)(a1 + 56);
  v13[0] = 1;
  v14 = 3979;
  v15 = v2;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  kdebug_trace();
  memset(&v12, 0, sizeof(v12));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
    objc_msgSend(v3, "auditToken");
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v12, 1))
  {
    v4 = *(_DWORD *)(a1 + 56);
    v5 = *(void **)(a1 + 40);
    v9 = 0;
    as::server::forbid_acq::GetPropertiesFromMXSession(v4, &v12, v5, &v9, (uint64_t)&v10);
    v6 = v9;
    if (v10)
    {
      NSErrorWithString(CFSTR("Error in getting batch properties"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getProperties:properties:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v8 + 16))(v8, v6, 0, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

- (void)createAudioApplicationForSpecification:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  os_unfair_lock_s *v10;
  void *v11;
  __CFString *v12;
  as::server *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  audit_token_t v28;
  char v29;
  pid_t v30;
  audit_token_t v31[2];
  uint64_t v32;
  const __CFString *v33;
  _BYTE v34[48];
  char v35;
  pid_t v36;
  audit_token_t v37;
  char v38;
  pid_t v39;
  uint64_t v40;
  audit_token_t atoken;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createAudioApplicationForSpeci"
                                                          "fication:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v7);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v31[1], 0, sizeof(audit_token_t));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    xpcConnection = (NSXPCConnection *)-[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v10 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)xpcConnection);
  if (v6)
    objc_msgSend(v6, "appAuditToken");
  else
    memset(v31, 0, 32);
  *(audit_token_t *)v34 = v31[0];
  v34[32] = 1;
  v28 = v31[0];
  *(_DWORD *)&v34[36] = audit_token_to_pid(&v28);
  v28 = v31[1];
  v29 = 1;
  atoken = v31[1];
  v30 = audit_token_to_pid(&atoken);
  if (as::server::LegacySessionManager::VerifyAudioAppPermission((as::server::LegacySessionManager *)v10, (const as::server::ProcessIdentity *)v34, (const as::server::ProcessIdentity *)&v28, 1))
  {
    objc_msgSend(v6, "attributionBundleID");
    *(_QWORD *)v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "processName");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("?");
    }
    *(_QWORD *)&v34[8] = v12;
    *(audit_token_t *)&v34[16] = v31[1];
    v35 = 1;
    v28 = v31[1];
    v36 = audit_token_to_pid(&v28);
    if (v6)
      objc_msgSend(v6, "appAuditToken");
    else
      memset(&atoken, 0, sizeof(atoken));
    v37 = atoken;
    v38 = 1;
    v28 = atoken;
    v39 = audit_token_to_pid(&v28);
    v40 = objc_msgSend(v6, "audioAppType");
    if (v11)

    as::server::LegacySessionManager::CreateAudioApplication(v10, (uint64_t)v34, self->_clientProcess.xpcConnection, (uint64_t)&v28);
    if (*(_QWORD *)v28.val && *(_QWORD *)&v28.val[4])
    {
      v8[2](v8, 0, *(unsigned int *)(*(_QWORD *)&v28.val[4] + 8));
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33 = CFSTR("AudioApp creation failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v21, 0);
    }
    v22 = *(std::__shared_weak_count **)&v28.val[6];
    if (*(_QWORD *)&v28.val[6])
    {
      v23 = (unint64_t *)(*(_QWORD *)&v28.val[6] + 8);
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = *(std::__shared_weak_count **)&v28.val[2];
    if (*(_QWORD *)&v28.val[2])
    {
      v26 = (unint64_t *)(*(_QWORD *)&v28.val[2] + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }

  }
  else
  {
    if (v6)
      objc_msgSend(v6, "appAuditToken");
    else
      memset(&v28, 0, sizeof(v28));
    *(audit_token_t *)v34 = v28;
    v13 = (as::server *)audit_token_to_pid((audit_token_t *)v34);
    v14 = (int)v13;
    v15 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v13));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 136315906;
      *(_QWORD *)&v34[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = 1518;
      *(_WORD *)&v34[18] = 2080;
      *(_QWORD *)&v34[20] = "-[AVAudioSessionRemoteXPCClient createAudioApplicationForSpecification:reply:]";
      *(_WORD *)&v34[28] = 1024;
      *(_DWORD *)&v34[30] = v14;
      _os_log_impl(&dword_1C895C000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed due to audio application (pid: %d) entitlement check failure", v34, 0x22u);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)atoken.val = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v34 = CFSTR("AVAudioApplication error - missing entitlement");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &atoken, 1, *(_QWORD *)v28.val);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 1701737535, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v18, 0);
  }

}

- (void)sessionIDs:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  as::server::LegacySessionManager *v10;
  os_unfair_lock_s *v11;
  NSXPCConnection *xpcConnection;
  __int128 v13;
  void *v14;
  uint64_t *v15;
  uint64_t *i;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  void *v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;
  void *v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _OWORD v32[2];
  char v33;
  pid_t v34;
  audit_token_t atoken;
  char v36;
  pid_t v37;
  audit_token_t v38;
  char v39;
  pid_t v40;
  as::server::AudioApplicationInfo *v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  audit_token_t v45;
  audit_token_t v46;

  v8 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient sessionIDs:clientID:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v11 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v10);
  memset(&v45, 0, sizeof(v45));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v13 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v38.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v38.val[4] = v13;
  v39 = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)v38.val;
  *(_OWORD *)&atoken.val[4] = v13;
  v40 = audit_token_to_pid(&atoken);
  atoken = v45;
  v36 = 1;
  v46 = v45;
  v37 = audit_token_to_pid(&v46);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v11, (const as::server::ProcessIdentity *)&v38, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v41);
  if (v41 && v43)
  {
    as::server::AudioApplicationInfo::GetSessions((os_unfair_lock_s *)v41, (uint64_t)&v38);
    v14 = (void *)objc_opt_new();
    v15 = *(uint64_t **)v38.val;
    for (i = *(uint64_t **)&v38.val[2]; v15 != i; v15 += 2)
    {
      v17 = *v15;
      v18 = (std::__shared_weak_count *)v15[1];
      *(_QWORD *)atoken.val = *v15;
      *(_QWORD *)&atoken.val[2] = v18;
      if (v18)
      {
        p_shared_owners = (unint64_t *)&v18->__shared_owners_;
        do
          v20 = __ldxr(p_shared_owners);
        while (__stxr(v20 + 1, p_shared_owners));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v17 + 8));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v21);

      if (v18)
      {
        v22 = (unint64_t *)&v18->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
    }
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v14);

    *(_QWORD *)atoken.val = &v38;
    std::vector<std::shared_ptr<as::server::AudioSessionInfo>>::__destroy_vector::operator()[abi:ne180100]((void ***)&atoken);
  }
  else
  {
    v24 = *(_OWORD *)&a3->var0[4];
    v32[0] = *(_OWORD *)a3->var0;
    v32[1] = v24;
    v33 = 1;
    *(_OWORD *)v38.val = v32[0];
    *(_OWORD *)&v38.val[4] = v24;
    v34 = audit_token_to_pid(&v38);
    BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient sessionIDs:clientID:reply:]", (uint64_t)v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v25, 0);

  }
  v26 = v44;
  if (v44)
  {
    v27 = (unint64_t *)&v44->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v29 = v42;
  if (v42)
  {
    v30 = (unint64_t *)&v42->__shared_owners_;
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

- (void)getApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 isMXProperty:(BOOL)a6 reply:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  as::server::LegacySessionManager *v15;
  os_unfair_lock_s *v16;
  NSXPCConnection *xpcConnection;
  __int128 v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  as::server *v24;
  NSObject *v25;
  __int128 v26;
  void *v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  _OWORD v34[2];
  char v35;
  pid_t v36;
  audit_token_t atoken;
  char v38;
  pid_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  audit_token_t v44;
  audit_token_t v45;
  uint64_t v46;
  const __CFString *v47;
  _BYTE buf[34];
  pid_t v49;
  uint64_t v50;

  v8 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getApplicationProperty:clientI"
                                                          "D:propertyID:isMXProperty:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v13);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v16 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v15);
  memset(&v44, 0, sizeof(v44));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v18 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v18;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v18;
  v49 = audit_token_to_pid(&atoken);
  atoken = v44;
  v38 = 1;
  v45 = v44;
  v39 = audit_token_to_pid(&v45);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v16, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v40);
  if (v40 && v42)
  {
    if (v8)
      v19 = 1836595770;
    else
      v19 = 1634744890;
    as::server::AudioApplicationInfo::GetProperty(v40, v12, v19, (uint64_t)&atoken);
    v20 = (int)atoken.val[0];
    if (atoken.val[0])
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47 = CFSTR("Failed to get property");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v24));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2177;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v12;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = atoken.val[0];
        _os_log_impl(&dword_1C895C000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get property: %@, err: %d", buf, 0x22u);
      }
      ((void (**)(_QWORD, void *, _QWORD, _QWORD))v14)[2](v14, v23, 0, 0);

    }
    else
    {
      v14[2](v14, 0, *(_QWORD *)&atoken.val[2], 0);
    }

  }
  else
  {
    v26 = *(_OWORD *)&a3->var0[4];
    v34[0] = *(_OWORD *)a3->var0;
    v34[1] = v26;
    v35 = 1;
    *(_OWORD *)buf = v34[0];
    *(_OWORD *)&buf[16] = v26;
    v36 = audit_token_to_pid((audit_token_t *)buf);
    BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient getApplicationProperty:clientID:propertyID:isMXProperty:reply:]", (uint64_t)v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD))v14)[2](v14, v27, 0, 0);

  }
  v28 = v43;
  if (v43)
  {
    p_shared_owners = (unint64_t *)&v43->__shared_owners_;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v31 = v41;
  if (v41)
  {
    v32 = (unint64_t *)&v41->__shared_owners_;
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

- (void)setApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 reply:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  as::server::LegacySessionManager *v16;
  os_unfair_lock_s *v17;
  NSXPCConnection *xpcConnection;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  as::server *v23;
  NSObject *v24;
  _QWORD *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  as::server *v30;
  NSObject *v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  _OWORD v39[2];
  char v40;
  pid_t v41;
  audit_token_t atoken;
  char v43;
  pid_t v44;
  os_unfair_lock_s *v45;
  std::__shared_weak_count *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  audit_token_t v49;
  audit_token_t v50;
  uint64_t v51;
  const __CFString *v52;
  _BYTE buf[40];
  _QWORD *v54;
  _QWORD v55[2];
  _QWORD v56[5];

  v9 = *(_QWORD *)&a4;
  v56[2] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setApplicationProperty:clientI"
                                                          "D:propertyID:propertyValue:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v14);
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v17 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v16);
  memset(&v49, 0, sizeof(v49));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v19 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v19;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v19;
  *(_DWORD *)&buf[36] = audit_token_to_pid(&atoken);
  atoken = v49;
  v43 = 1;
  v50 = v49;
  v44 = audit_token_to_pid(&v50);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v17, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, v9, 1, (uint64_t)&v45);
  if (v45 && v47)
  {
    v55[0] = CFSTR("ClientID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = CFSTR("ClientType");
    v56[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v47 + 80));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v23));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (_QWORD *)(v47 + 176);
      if (*(char *)(v47 + 199) < 0)
        v25 = (_QWORD *)*v25;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2207;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v12;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v13;
      *(_WORD *)&buf[38] = 2080;
      v54 = v25;
      _os_log_impl(&dword_1C895C000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set audio app property: %@, value: %@ (client: %s)", buf, 0x30u);
    }
    v26 = as::server::AudioApplicationInfo::SetProperty(v45, v12, v13, v22);
    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = CFSTR("Failed to set property");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v30));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2214;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v12;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v26;
        _os_log_impl(&dword_1C895C000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set property: %@, err: %d", buf, 0x22u);
      }
      ((void (**)(_QWORD, void *))v15)[2](v15, v29);

    }
    else
    {
      v15[2](v15, 0);
    }
  }
  else
  {
    v32 = *(_OWORD *)&a3->var0[4];
    v39[0] = *(_OWORD *)a3->var0;
    v39[1] = v32;
    v40 = 1;
    *(_OWORD *)buf = v39[0];
    *(_OWORD *)&buf[16] = v32;
    v41 = audit_token_to_pid((audit_token_t *)buf);
    BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient setApplicationProperty:clientID:propertyID:propertyValue:reply:]", (uint64_t)v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v22);
  }

  v33 = v48;
  if (v48)
  {
    p_shared_owners = (unint64_t *)&v48->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
  v36 = v46;
  if (v46)
  {
    v37 = (unint64_t *)&v46->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

}

- (void)updateApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 context:(id)a7 reply:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  as::server::LegacySessionManager *v19;
  os_unfair_lock_s *v20;
  NSXPCConnection *xpcConnection;
  __int128 v22;
  as::server *v23;
  NSObject *v24;
  _QWORD *v25;
  as::server *updated;
  int v27;
  NSObject *v28;
  void *v29;
  __int128 v30;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _OWORD v37[2];
  char v38;
  pid_t v39;
  audit_token_t atoken;
  char v41;
  pid_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  audit_token_t v47;
  audit_token_t v48;
  _BYTE buf[40];
  _QWORD *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient updateApplicationProperty:clie"
                                                          "ntID:propertyID:propertyValue:context:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v17);
  v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v20 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v19);
  memset(&v47, 0, sizeof(v47));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v22 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v22;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v22;
  *(_DWORD *)&buf[36] = audit_token_to_pid(&atoken);
  atoken = v47;
  v41 = 1;
  v48 = v47;
  v42 = audit_token_to_pid(&v48);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v20, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v43);
  if (v43 && v45)
  {
    v24 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v23));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (_QWORD *)(v45 + 176);
      if (*(char *)(v45 + 199) < 0)
        v25 = (_QWORD *)*v25;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2240;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v15;
      *(_WORD *)&buf[38] = 2080;
      v50 = v25;
      _os_log_impl(&dword_1C895C000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Update audio app property: %@, value: %@ (client: %s)", buf, 0x30u);
    }
    updated = (as::server *)as::server::AudioApplicationInfo::UpdateProperty(v43, v14, v15, 1634744890, 0, v16);
    v27 = (int)updated;
    if (!(_DWORD)updated)
    {
      v18[2](v18, 0);
      goto LABEL_15;
    }
    v28 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(updated));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2244;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v27;
      _os_log_impl(&dword_1C895C000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to update property: %@, err: %d", buf, 0x22u);
    }
    NSErrorWithString(CFSTR("Failed to update property"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v29);
  }
  else
  {
    v30 = *(_OWORD *)&a3->var0[4];
    v37[0] = *(_OWORD *)a3->var0;
    v37[1] = v30;
    v38 = 1;
    *(_OWORD *)buf = v37[0];
    *(_OWORD *)&buf[16] = v30;
    v39 = audit_token_to_pid((audit_token_t *)buf);
    BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient updateApplicationProperty:clientID:propertyID:propertyValue:context:reply:]", (uint64_t)v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v18)[2](v18, v29);
  }

LABEL_15:
  v31 = v46;
  if (v46)
  {
    p_shared_owners = (unint64_t *)&v46->__shared_owners_;
    do
      v33 = __ldaxr(p_shared_owners);
    while (__stlxr(v33 - 1, p_shared_owners));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v44;
  if (v44)
  {
    v35 = (unint64_t *)&v44->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }

}

- (void)getApplicationMessages:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  os_unfair_lock_s *v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  _OWORD v21[2];
  char v22;
  pid_t v23;
  audit_token_t atoken;
  char v25;
  pid_t v26;
  audit_token_t v27;
  char v28;
  pid_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  as::server::AudioAppRemoteClient *v32;
  std::__shared_weak_count *v33;
  audit_token_t v34;
  audit_token_t v35;

  v8 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getApplicationMessages:clientID:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  memset(&v34, 0, sizeof(v34));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    xpcConnection = (NSXPCConnection *)-[NSXPCConnection auditToken](xpcConnection, "auditToken");
  v11 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)xpcConnection);
  v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v27.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v27.val[4] = v12;
  v28 = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)v27.val;
  *(_OWORD *)&atoken.val[4] = v12;
  v29 = audit_token_to_pid(&atoken);
  atoken = v34;
  v25 = 1;
  v35 = v34;
  v26 = audit_token_to_pid(&v35);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v11, (const as::server::ProcessIdentity *)&v27, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v30);
  if (v30 && v32)
  {
    as::server::AudioAppRemoteClient::GetDeferredMessages(v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v13);
  }
  else
  {
    v14 = *(_OWORD *)&a3->var0[4];
    v21[0] = *(_OWORD *)a3->var0;
    v21[1] = v14;
    v22 = 1;
    *(_OWORD *)v27.val = v21[0];
    *(_OWORD *)&v27.val[4] = v14;
    v23 = audit_token_to_pid(&v27);
    BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient getApplicationMessages:clientID:reply:]", (uint64_t)v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v13, 0);
  }

  v15 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v31;
  if (v31)
  {
    v19 = (unint64_t *)&v31->__shared_owners_;
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

- (void)setMXPropertyOnAllSessions:(id *)a3 clientID:(unsigned int)a4 MXProperty:(id)a5 values:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  NSXPCConnection *xpcConnection;
  void *v17;
  __int128 v18;
  __int128 v19;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setMXPropertyOnAllSessions:cli"
                                                          "entID:MXProperty:values:reply:]";
  *(_QWORD *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v14);
  v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken", v18, v19);
  as::server::forbid_acq::SetPropertyMXOnAppSessions((__int128 *)a3, &v18, a4, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v15)[2](v15, v17);

}

- (void)toggleInputMuteForRecordingProcess:(id)a3
{
  void (**v4)(id, void *);
  NSXPCConnection *xpcConnection;
  as::server::forbid_acq::SystemController *HasEntitlement;
  unsigned __int8 v7;
  unsigned __int8 v8;
  as::server::LegacySessionManager *v9;
  NSXPCConnection *v10;
  id v11;
  void *v12;
  void *v13;
  void (*v14)(id, void *);
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  audit_token_t v19;
  audit_token_t buf;
  char v21;
  unsigned int v22;
  audit_token_t atoken;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  else
    memset(&v19, 0, sizeof(v19));
  buf = v19;
  v21 = 1;
  atoken = v19;
  HasEntitlement = (as::server::forbid_acq::SystemController *)audit_token_to_pid(&atoken);
  v22 = HasEntitlement;
  if ((v7 & 1) == 0)
  {
    if ((_DWORD)HasEntitlement)
    {
      as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
    }
  }
  if (as::AudioSessionMuteEnabled(void)::enabled
    || (HasEntitlement = (as::server::forbid_acq::SystemController *)as::server::ProcessIdentity::ProcessHasEntitlement((as::server::ProcessIdentity *)&buf, "com.apple.private.coreaudio.borrowaudioapplication.allow"), (HasEntitlement & 1) != 0))
  {
    if ((v8 & 1) == 0)
    {
      if ((_DWORD)HasEntitlement)
      {
        as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (!as::AudioSessionMuteEnabled(void)::enabled)
    {
      v11 = *(id *)as::server::forbid_acq::SystemController::Instance(HasEntitlement);
      v12 = v11;
      if (!v11)
      {
        v17 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(0));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          buf.val[0] = 136315394;
          *(_QWORD *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
          LOWORD(buf.val[3]) = 1024;
          *(unsigned int *)((char *)&buf.val[3] + 2) = 2309;
          _os_log_impl(&dword_1C895C000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error - invalid MXSystemController", (uint8_t *)&buf, 0x12u);
        }
        NSErrorWithString(CFSTR("Error - invalid MXSystemController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v18);

        goto LABEL_25;
      }
      if (!objc_msgSend(v11, "toggleInputMute"))
      {
        v4[2](v4, 0);
LABEL_25:

        goto LABEL_26;
      }
      NSErrorWithString(CFSTR("MXSystemController::toggleInputMute error"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13);

    }
    v9 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance(HasEntitlement);
    v10 = self->_clientProcess.xpcConnection;
    if (v10)
      -[NSXPCConnection auditToken](v10, "auditToken");
    else
      memset(&buf, 0, sizeof(buf));
    as::server::LegacySessionManager::ToggleInputMuteForRecordingApplication(v9, &buf);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4[2];
    if (v12)
      v14(v4, v12);
    else
      v14(v4, 0);
    goto LABEL_25;
  }
  v15 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(HasEntitlement));
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 136315650;
    *(_QWORD *)&atoken.val[1] = "AVAudioSessionXPCServer.mm";
    LOWORD(atoken.val[3]) = 1024;
    *(unsigned int *)((char *)&atoken.val[3] + 2) = 2299;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = v22;
    _os_log_impl(&dword_1C895C000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Error - toggleInputMute attempted but caller (pid: %d) doesn't have entitlement", (uint8_t *)&atoken, 0x18u);
  }
  NSErrorWithString(CFSTR("not allowed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v16);

LABEL_26:
}

- (void)muteInputForRecordingProcesses:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSXPCConnection *xpcConnection;
  as::server *HasEntitlement;
  unsigned __int8 v7;
  unsigned __int8 v8;
  _QWORD *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  audit_token_t v13;
  audit_token_t v14;
  char v15;
  unsigned int v16;
  audit_token_t atoken;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection)
    -[NSXPCConnection auditToken](xpcConnection, "auditToken");
  else
    memset(&v13, 0, sizeof(v13));
  v14 = v13;
  v15 = 1;
  atoken = v13;
  HasEntitlement = (as::server *)audit_token_to_pid(&atoken);
  v16 = HasEntitlement;
  if ((v7 & 1) == 0)
  {
    if ((_DWORD)HasEntitlement)
    {
      as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
    }
  }
  if (as::SmartRoutingPrioritizesCall(void)::enabled
    && (HasEntitlement = (as::server *)as::server::ProcessIdentity::ProcessHasEntitlement((as::server::ProcessIdentity *)&v14, "com.apple.private.coreaudio.borrowaudioapplication.allow"), (HasEntitlement & 1) == 0))
  {
    v11 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(HasEntitlement));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      atoken.val[0] = 136315650;
      *(_QWORD *)&atoken.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(atoken.val[3]) = 1024;
      *(unsigned int *)((char *)&atoken.val[3] + 2) = 2341;
      HIWORD(atoken.val[4]) = 1024;
      atoken.val[5] = v16;
      _os_log_impl(&dword_1C895C000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d Error - muteInputForRecordingProcesses attempted but caller (pid: %d) doesn't have entitlement", (uint8_t *)&atoken, 0x18u);
    }
    NSErrorWithString(CFSTR("not allowed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v12, 0);

  }
  else
  {
    if ((v8 & 1) == 0)
    {
      if ((_DWORD)HasEntitlement)
      {
        as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::SmartRoutingPrioritizesCall(void)::enabled)
    {
      as::server::LegacySessionManager::Instance(HasEntitlement);
      as::server::LegacySessionManager::MuteInputsForRecordingApplications((uint64_t)&v14);
      if (!LOBYTE(v14.val[2]))
      {
        v4[2](v4, *(void **)v14.val, 0);

        goto LABEL_16;
      }
      v9 = (_QWORD *)caulk::expected<NSDictionary * {__strong},NSError * {__strong}>::value((uint64_t)&v14);
      v4[2](v4, 0, *v9);

    }
    NSErrorWithString(CFSTR("Unsupported"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10, 0);

  }
LABEL_16:

}

- (void)setEnhanceDialoguePreference:(id)a3 reply:(id)a4
{
  id v5;
  as::server *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (as::server *)a4;
  v7 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "AVAudioSessionXPCServer.mm";
    v11 = 1024;
    v12 = 2361;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C895C000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d set enhance dialogue preference to %@", (uint8_t *)&v9, 0x1Cu);
  }
  if (v5 && (objc_msgSend(v5, "integerValue") & 0x8000000000000000) == 0 && objc_msgSend(v5, "integerValue") < 3)
  {
    CFPreferencesSetAppValue(CFSTR("enhancedialogueoptin"), v5, CFSTR("com.apple.preferences-sounds"));
    v8 = 0;
    notify_post("com.apple.preferences-sounds.enhancedialogueoptin");
  }
  else
  {
    NSErrorWithString(CFSTR("invalid value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(as::server *, void *))v6 + 2))(v6, v8);

}

- (void)setEnhanceDialogueLevel:(id)a3 reply:(id)a4
{
  id v5;
  as::server *v6;
  NSObject *v7;
  void *v8;
  const void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (as::server *)a4;
  v7 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v6));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 136315650;
    v11 = "AVAudioSessionXPCServer.mm";
    v12 = 1024;
    v13 = 2378;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C895C000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d set enhance dialogue level to %@", (uint8_t *)&v10, 0x1Cu);
  }
  if (v5 && (objc_msgSend(v5, "integerValue") & 0x8000000000000000) == 0 && objc_msgSend(v5, "integerValue") < 4)
  {
    CFPreferencesSetAppValue(CFSTR("enhancedialoguelevel"), v5, CFSTR("com.apple.preferences-sounds"));
    if (objc_msgSend(v5, "integerValue"))
      v9 = &unk_1E8208270;
    else
      v9 = &unk_1E8208258;
    CFPreferencesSetAppValue(CFSTR("enhancedialog"), v9, CFSTR("com.apple.preferences-sounds"));
    notify_post("com.apple.preferences-sounds.enhancedialog");
    notify_post("com.apple.preferences-sounds.enhancedialoguelevel");
    v8 = 0;
  }
  else
  {
    NSErrorWithString(CFSTR("Invalid level value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(as::server *, void *))v6 + 2))(v6, v8);

}

- (void)getEnhanceDialogueLevelWithReply:(id)a3
{
  void (**v3)(id, void *, void *, _QWORD);
  CFIndex AppIntegerValue;
  as::server *v5;
  as::server *v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  as::server *v13;
  void *v14;
  Boolean keyExistsAndHasValidFormat[2];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  CFIndex v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, void *, _QWORD))a3;
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("enhancedialog"), CFSTR("com.apple.preferences-sounds"), &keyExistsAndHasValidFormat[1]);
  v5 = (as::server *)CFPreferencesGetAppIntegerValue(CFSTR("enhancedialoguelevel"), CFSTR("com.apple.preferences-sounds"), keyExistsAndHasValidFormat);
  v6 = v5;
  if ((unint64_t)v5 < 4)
  {
    v8 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v5));
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v9)
    {
      v17 = "AVAudioSessionXPCServer.mm";
      *(_DWORD *)buf = 136315906;
      v18 = 1024;
      if (keyExistsAndHasValidFormat[1])
        v10 = "";
      else
        v10 = "(no value)";
      v19 = 2414;
      v20 = 2048;
      v21 = AppIntegerValue;
      v22 = 2080;
      v23 = v10;
      _os_log_impl(&dword_1C895C000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d got enhance dialogue mode: %ld %s", buf, 0x26u);
    }
    v11 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)v9));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = "AVAudioSessionXPCServer.mm";
      *(_DWORD *)buf = 136315906;
      v18 = 1024;
      if (keyExistsAndHasValidFormat[0])
        v12 = "";
      else
        v12 = "(no value)";
      v19 = 2416;
      v20 = 2048;
      v21 = (CFIndex)v6;
      v22 = 2080;
      v23 = v12;
      _os_log_impl(&dword_1C895C000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d got enhance dialogue level: %ld %s", buf, 0x26u);
    }
    v7 = 0;
  }
  else
  {
    NSErrorWithString(CFSTR("invalid value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (AppIntegerValue)
    v13 = v6;
  else
    v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v7, v14, 0);

}

- (void)allowAppToInitiatePlaybackTemporarilyFromBackground:(id)a3 reply:(id)a4
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a4;
  NSErrorWithString(CFSTR("not supported on this target"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (uint64_t)initWithServer:process:delegate:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (id)initWithServer:process:delegate:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E82050E0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
