@implementation AVAudioApplication

+ (AVAudioApplication)sharedInstance
{
  if (+[AVAudioApplication sharedInstance]::onceToken != -1)
    dispatch_once(&+[AVAudioApplication sharedInstance]::onceToken, &__block_literal_global_2);
  return (AVAudioApplication *)(id)+[AVAudioApplication sharedInstance]::singleton;
}

void __36__AVAudioApplication_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  _anonymous_namespace_ *v3;
  void *v4;
  id v5;
  void *v6;
  _OWORD v7[2];
  _OWORD v8[2];

  as::ProcessIdentity::currentProcess((uint64_t)v8);
  v0 = objc_alloc_init(MEMORY[0x1E0CFF1E8]);
  objc_msgSend(v0, "setAudioAppType:", 1886546285);
  v7[0] = v8[0];
  v7[1] = v8[1];
  objc_msgSend(v0, "setAppAuditToken:", v7);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAttributionBundleID:", v2);

  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setProcessName:", v4);

  v5 = -[AVAudioApplication initPrivate:]([AVAudioApplication alloc], "initPrivate:", v0);
  v6 = (void *)+[AVAudioApplication sharedInstance]::singleton;
  +[AVAudioApplication sharedInstance]::singleton = (uint64_t)v5;

}

- (AVAudioApplication)initWithSpecification:(id)a3
{
  id v4;
  AVAudioApplication *v5;
  AVAudioApplication *v6;

  v4 = a3;
  if (objc_msgSend(v4, "audioAppType") == 1886546285)
  {
    +[AVAudioApplication sharedInstance](AVAudioApplication, "sharedInstance");
    v5 = (AVAudioApplication *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (AVAudioApplication *)-[AVAudioApplication initPrivate:](self, "initPrivate:", v4);
    self = v5;
  }
  v6 = v5;

  return v6;
}

- (id)initPrivate:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 isValid;
  as::client *v7;
  NSObject *v8;
  void *v9;
  AVAudioApplication *v10;
  NSObject *v12;
  void *v13;
  objc_super v14[3];
  audit_token_t v15;
  audit_token_t atoken;
  audit_token_t buf;
  pid_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "appAuditToken");
  else
    memset(&v14[1], 0, 32);
  buf = *(audit_token_t *)&v14[1].receiver;
  atoken = *(audit_token_t *)&v14[1].receiver;
  v18 = audit_token_to_pid(&atoken);
  v15 = *(audit_token_t *)&v14[1].receiver;
  v19 = audit_token_to_pidversion(&v15);
  isValid = as::ProcessIdentity::isValid((as::ProcessIdentity *)&buf);
  if (!isValid)
  {
    v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)isValid));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      buf.val[0] = 136315650;
      *(_QWORD *)&buf.val[1] = "AVAudioApplication.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 195;
      HIWORD(buf.val[4]) = 2112;
      *(_QWORD *)&buf.val[5] = v9;
      _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error - bad audit token provided (creation description: %@)", (uint8_t *)&buf, 0x1Cu);

    }
    goto LABEL_14;
  }
  v14[0].receiver = self;
  v14[0].super_class = (Class)AVAudioApplication;
  self = -[objc_super init](v14, sel_init);
  if (!self)
    goto LABEL_19;
  v7 = (as::client *)objc_msgSend(v5, "audioAppType");
  if (v7 == (as::client *)1684825972)
  {
    if (!-[AVAudioApplication privateCreateAudioApplicationInServer:](self, "privateCreateAudioApplicationInServer:", v5))goto LABEL_14;
    -[AVAudioApplication privateOptInToStemClickMuting](self, "privateOptInToStemClickMuting");
LABEL_19:
    self = self;
    v10 = self;
    goto LABEL_20;
  }
  if (v7 == (as::client *)1886546285)
  {
    if (!-[AVAudioApplication privateCreateAudioApplicationInServer:](self, "privateCreateAudioApplicationInServer:", v5))goto LABEL_14;
    _CFNotificationCenterRegisterDependentNotificationList();
    goto LABEL_19;
  }
  if (v7 == (as::client *)1886547832)
  {
    if (-[AVAudioApplication privateCreateAudioApplicationInServer:](self, "privateCreateAudioApplicationInServer:", v5))
    {
      goto LABEL_19;
    }
  }
  else
  {
    v12 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      buf.val[0] = 136315650;
      *(_QWORD *)&buf.val[1] = "AVAudioApplication.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 229;
      HIWORD(buf.val[4]) = 2112;
      *(_QWORD *)&buf.val[5] = v13;
      _os_log_impl(&dword_19EF50000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Error - unknown audio app type. creation description: %@", (uint8_t *)&buf, 0x1Cu);

    }
  }
LABEL_14:
  v10 = 0;
LABEL_20:

  return v10;
}

- (void)dealloc
{
  uint64_t **v3;
  os_unfair_lock_s *value;
  objc_super v5;

  if (self->_impl.__ptr_.__value_)
  {
    v3 = (uint64_t **)CADeprecated::TSingleton<ApplicationMap>::instance();
    value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(value);
    ApplicationMap::Remove(v3, value[6]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(value);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioApplication;
  -[AVAudioApplication dealloc](&v5, sel_dealloc);
}

- (unsigned)clientID
{
  os_unfair_lock_s *value;
  unsigned int os_unfair_lock_opaque;

  value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock(value);
  os_unfair_lock_opaque = value[6]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(value);
  return os_unfair_lock_opaque;
}

- (BOOL)isInputMuted
{
  id v3;
  void *v4;
  BOOL v5;
  char v6;
  int v8;
  void *v9;

  -[AVAudioApplication privateGetAppProperty:](self, "privateGetAppProperty:", CFSTR("InputMute"));
  v3 = v9;
  v4 = v3;
  if (v8)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v3, "BOOLValue");
    self->_inputMuted = v6;
  }

  return v6;
}

- (BOOL)setInputMuted:(BOOL)muted error:(NSError *)outError
{
  return -[AVAudioApplication setInputMuted:context:error:](self, "setInputMuted:context:error:", muted, 0, outError);
}

- (BOOL)setInputMuteStateChangeHandler:(void *)inputMuteHandler error:(NSError *)outError
{
  if (outError)
  {
    NSErrorUnimplemented();
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (AVAudioApplicationRecordPermission)recordPermission
{
  void *v2;
  AVAudioApplicationRecordPermission v3;

  +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recordPermission");

  return v3;
}

+ (void)requestRecordPermissionWithCompletionHandler:(void *)response
{
  void *v3;
  id v4;

  v4 = response;
  +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestRecordPermission:", v4);

}

- (sync_guard<as::client::AVAudioApplicationImpl,)privateGetImplGuard
{
  os_unfair_lock_s **v2;
  os_unfair_lock_s **v3;
  os_unfair_lock_s *value;
  unfair_lock *v5;
  AVAudioApplicationImpl *v6;
  sync_guard<as::client::AVAudioApplicationImpl, caulk::mach::unfair_lock> result;

  v3 = v2;
  value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock(value);
  *v3 = value;
  v3[1] = value + 2;
  result.var1.var0 = v6;
  result.var0 = v5;
  return result;
}

- (tuple<std::shared_ptr<as::client::XPCConnection>,)privateGetConnection
{
  char *value;
  tuple<std::shared_ptr<as::client::XPCConnection>, as::ProcessIdentity, unsigned int> *result;

  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), (__n128 *)retstr);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  return result;
}

- (void)privateOptInToStemClickMuting
{
  NSObject *v3;
  os_unfair_lock_s *value;
  uint32_t os_unfair_lock_opaque;
  as::client *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint32_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    value = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(value);
    os_unfair_lock_opaque = value[18]._os_unfair_lock_opaque;
    v8 = 136315650;
    v9 = "AVAudioApplication.mm";
    v10 = 1024;
    v11 = 316;
    v12 = 1024;
    v13 = os_unfair_lock_opaque;
    _os_log_impl(&dword_19EF50000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d App (pid:%d) registered to observe AVAudioApplication input mute notifications", (uint8_t *)&v8, 0x18u);
    os_unfair_lock_unlock(value);
  }

  v6 = (as::client *)-[AVAudioApplication privateSetMXPropertyOnAllSessions:value:](self, "privateSetMXPropertyOnAllSessions:value:", *MEMORY[0x1E0D49B08], MEMORY[0x1E0C9AAB0]);
  if ((_DWORD)v6)
  {
    v7 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v6));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "AVAudioApplication.mm";
      v10 = 1024;
      v11 = 334;
      _os_log_impl(&dword_19EF50000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to opt in to PrefersBluetoothAccessoryMuting", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)privateEnableSystemMute:(BOOL)a3
{
  void *v4;
  as::client *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[AVAudioApplication privateSetAppProperty:value:](self, "privateSetAppProperty:value:", CFSTR("EnableSystemMute"), v4);

  v6 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v5));
  v7 = v6;
  if ((_DWORD)self)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      return;
    v11 = 136315394;
    v12 = "AVAudioApplication.mm";
    v13 = 1024;
    v14 = 346;
    v8 = "%25s:%-5d Failed to set EnableSystemMute property";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      return;
    v11 = 136315394;
    v12 = "AVAudioApplication.mm";
    v13 = 1024;
    v14 = 349;
    v8 = "%25s:%-5d Enabled system mute";
    v9 = v7;
    v10 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_19EF50000, v9, v10, v8, (uint8_t *)&v11, 0x12u);
}

- (BOOL)privateCreateAudioApplicationInServer:(id)a3
{
  id v4;
  _DWORD *v5;
  id *value;
  as::client::XPCConnection *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  as::client *v15;
  as::client *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  ApplicationMap *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id from;
  id to;
  id location;
  as::client::XPCConnection *v33;
  std::__shared_weak_count *v34;
  _BYTE buf[12];
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[18];
  void *v40;
  _BYTE v41[24];
  _BYTE *v42;
  id v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_DWORD *)operator new();
  *v5 = 0;
  as::client::AVAudioApplicationImpl::AVAudioApplicationImpl(v5 + 2, v4);
  value = (id *)self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = v5;
  if (value)
  {
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&self->_impl, value);
    v5 = self->_impl.__ptr_.__value_;
  }
  os_unfair_lock_lock((os_unfair_lock_t)v5);
  v7 = (as::client::XPCConnection *)*((_QWORD *)v5 + 14);
  v8 = (std::__shared_weak_count *)*((_QWORD *)v5 + 15);
  v33 = v7;
  v34 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  as::client::XPCConnection::sync_message<unsigned int>(v7, (uint64_t)&v40);
  v11 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::sync_proxy(&v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *((_QWORD *)v5 + 4);
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::reply((uint64_t)&v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createAudioApplicationForSpecification:reply:", v13, v14);

  objc_autoreleasePoolPop(v11);
  v15 = (as::client *)v43;
  v16 = v15;
  if (!v15)
  {
    as::client::AVAudioApplicationImpl::SetClientID((uint64_t)(v5 + 2), v44);
    v20 = (ApplicationMap *)CADeprecated::TSingleton<ApplicationMap>::instance();
    ApplicationMap::Add(v20, v5[6], self);
    objc_initWeak(&location, self);
    objc_copyWeak(&to, &location);
    v21 = (uint64_t)v33;
    objc_copyWeak(&from, &to);
    *(_QWORD *)&v39[4] = 0;
    *(_QWORD *)buf = &off_1E424F538;
    objc_moveWeak((id *)&buf[8], &from);
    *(_QWORD *)&v39[4] = buf;
    objc_destroyWeak(&from);
    as::client::XPCConnection::setServerRestartedCallback(v21, (uint64_t)buf);
    v22 = *(_QWORD **)&v39[4];
    if (*(_BYTE **)&v39[4] == buf)
    {
      v23 = 4;
      v22 = buf;
    }
    else
    {
      if (!*(_QWORD *)&v39[4])
      {
LABEL_15:
        objc_destroyWeak(&to);
        objc_destroyWeak(&location);
        goto LABEL_16;
      }
      v23 = 5;
    }
    (*(void (**)(void))(*v22 + 8 * v23))();
    goto LABEL_15;
  }
  v17 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v15));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    -[as::client description](v16, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "AVAudioApplication.mm";
    v36 = 1024;
    v37 = 365;
    v38 = 2112;
    *(_QWORD *)v39 = v18;
    *(_WORD *)&v39[8] = 2112;
    *(_QWORD *)&v39[10] = v19;
    _os_log_impl(&dword_19EF50000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create application, error: %@, specification: %@", buf, 0x26u);

  }
LABEL_16:

  v24 = v42;
  if (v42 == v41)
  {
    v25 = 4;
    v24 = v41;
    goto LABEL_20;
  }
  if (v42)
  {
    v25 = 5;
LABEL_20:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }

  v26 = v34;
  if (v34)
  {
    v27 = (unint64_t *)&v34->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v5);

  return v16 == 0;
}

- (BOOL)privateRecreateAudioApplicationInServer
{
  char *value;
  uint64_t v3;
  uint64_t **v4;
  as::client::XPCConnection *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  as::client *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  ApplicationMap *v22;
  id *v23;
  void *v24;
  as::client *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  BOOL v34;
  as::client *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  as::client *v47;
  as::client *v48;
  NSObject *v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  id v57;
  as::client *v58;
  id obj;
  void *v60;
  uint64_t v61;
  id vala;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[8];
  id v74;
  os_unfair_lock_t lock;
  as::client::AVAudioApplicationImpl *v76;
  _BYTE v77[18];
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  _BYTE buf[12];
  __int16 v83;
  int v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  _BYTE v88[10];
  id v89;
  _BYTE v90[128];
  _BYTE v91[48];
  unsigned int v92;
  unsigned int v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  lock = (os_unfair_lock_t)value;
  v76 = (as::client::AVAudioApplicationImpl *)(value + 8);
  v3 = *((unsigned int *)value + 6);
  v4 = (uint64_t **)CADeprecated::TSingleton<ApplicationMap>::instance();
  ApplicationMap::Remove(v4, v3);
  v5 = (as::client::XPCConnection *)*((_QWORD *)value + 14);
  v6 = (std::__shared_weak_count *)*((_QWORD *)value + 15);
  *(_QWORD *)v77 = *((_QWORD *)v76 + 13);
  *(_QWORD *)&v77[8] = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  as::client::XPCConnection::sync_message<unsigned int>(v5, (uint64_t)v91);
  v9 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::sync_proxy((void **)v91);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *((_QWORD *)v76 + 3);
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},unsigned int>::reply((uint64_t)v91);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createAudioApplicationForSpecification:reply:", v11, v12);

  objc_autoreleasePoolPop(v9);
  v13 = (as::client *)*(id *)&v91[40];
  v58 = v13;
  if (v13)
  {
    v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v13));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[as::client description](v58, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVAudioApplication.mm";
      v83 = 1024;
      v84 = 403;
      v85 = 2112;
      v86 = v15;
      v87 = 2112;
      *(_QWORD *)v88 = v16;
      _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to recreate application, error: %@, specification: %@", buf, 0x26u);

    }
    v17 = 0;
  }
  else
  {
    v17 = v92;
  }

  v18 = *(_QWORD **)&v91[32];
  if (*(_BYTE **)&v91[32] == &v91[8])
  {
    v19 = 4;
    v18 = &v91[8];
    goto LABEL_13;
  }
  if (*(_QWORD *)&v91[32])
  {
    v19 = 5;
LABEL_13:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }

  if (v6)
  {
    v20 = (unint64_t *)&v6->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (!v58)
  {
    as::client::AVAudioApplicationImpl::SetClientID((uint64_t)v76, v17);
    v22 = (ApplicationMap *)CADeprecated::TSingleton<ApplicationMap>::instance();
    ApplicationMap::Add(v22, v17, self);
    as::AudioAppState::getPropertyApp((id *)v76 + 9, CFSTR("HasInputMuteHandlerSetMacOS"), (uint64_t)v73);
    v57 = v74;
    if (v57)
    {
      if (objc_msgSend(v57, "unsignedIntegerValue") == v3)
      {
        v23 = (id *)v76;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = as::AudioAppState::setPropertyApp(v23 + 9, CFSTR("HasInputMuteHandlerSetMacOS"), v24) == 0;

        if ((v23 & 1) == 0)
        {
          v26 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v25));
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v91 = 136315906;
            *(_QWORD *)&v91[4] = "AVAudioApplication.mm";
            *(_WORD *)&v91[12] = 1024;
            *(_DWORD *)&v91[14] = 422;
            *(_WORD *)&v91[18] = 1024;
            *(_DWORD *)&v91[20] = v3;
            *(_WORD *)&v91[24] = 1024;
            *(_DWORD *)&v91[26] = v17;
            _os_log_impl(&dword_19EF50000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to update ClientOwningInputMuteHandlerMacOS from old clientID (%u) to new clientID (%u)", v91, 0x1Eu);
          }
        }
      }
    }
    as::AudioAppState::getAppPropertiesExplicitlySet((id *)v76 + 9);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v70;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v70 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v30);
          {
            as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
          }
          if (!as::AudioSessionMuteEnabled(void)::enabled
            || (objc_msgSend(v31, "isEqualToString:", CFSTR("InputMute")) & 1) == 0)
          {
            objc_msgSend(v60, "objectForKey:", v31, v57);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = -[AVAudioApplication privateSetAppProperty:value:guard:](self, "privateSetAppProperty:value:guard:", v31, v33, &lock) == 0;

            if (!v34)
            {
              v36 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v35));
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v60, "objectForKey:", v31);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v91 = 136315906;
                *(_QWORD *)&v91[4] = "AVAudioApplication.mm";
                *(_WORD *)&v91[12] = 1024;
                *(_DWORD *)&v91[14] = 440;
                *(_WORD *)&v91[18] = 2112;
                *(_QWORD *)&v91[20] = v31;
                *(_WORD *)&v91[28] = 2112;
                *(_QWORD *)&v91[30] = v37;
                _os_log_impl(&dword_19EF50000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to apply app property {key: %@ value: %@} after server restart", v91, 0x26u);

              }
            }
          }
          ++v30;
        }
        while (v28 != v30);
        v38 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v94, 16);
        v28 = v38;
      }
      while (v38);
    }

    as::AudioAppState::getMXPropertiesExplicitlySet((id *)v76 + 9);
    vala = (id)objc_claimAutoreleasedReturnValue();
    as::client::AVAudioApplicationImpl::GetConnection((__n128 *)v76, (__n128 *)v91);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    objc_msgSend(vala, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
    if (v39)
    {
      v61 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v66 != v61)
            objc_enumerationMutation(obj);
          v41 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          as::client::XPCConnection::sync_message<>(*(as::client::XPCConnection **)v91, buf);
          v42 = (void *)MEMORY[0x1A1AF1EA0]();
          caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy((void **)buf);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v64[0] = *(_OWORD *)&v91[16];
          v64[1] = *(_OWORD *)&v91[32];
          v44 = v93;
          objc_msgSend(vala, "objectForKey:", v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)buf);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setMXPropertyOnAllSessions:clientID:MXProperty:values:reply:", v64, v44, v41, v45, v46);

          objc_autoreleasePoolPop(v42);
          v47 = (as::client *)v89;
          v48 = v47;
          if (v47)
          {
            v49 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v47));
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(vala, "objectForKey:", v41);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v77 = 136315906;
              *(_QWORD *)&v77[4] = "AVAudioApplication.mm";
              *(_WORD *)&v77[12] = 1024;
              *(_DWORD *)&v77[14] = 460;
              v78 = 2112;
              v79 = v41;
              v80 = 2112;
              v81 = v50;
              _os_log_impl(&dword_19EF50000, v49, OS_LOG_TYPE_ERROR, "%25s:%-5d error - failed to apply MX property {key: %@ value: %@} after server restart", v77, 0x26u);

            }
          }

          v51 = *(_QWORD **)&v88[2];
          if (*(_BYTE **)&v88[2] == &buf[8])
          {
            v51 = &buf[8];
            v52 = 4;
          }
          else
          {
            if (!*(_QWORD *)&v88[2])
              goto LABEL_56;
            v52 = 5;
          }
          (*(void (**)(void))(*v51 + 8 * v52))();
LABEL_56:

        }
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
      }
      while (v39);
    }

    v53 = *(std::__shared_weak_count **)&v91[8];
    if (*(_QWORD *)&v91[8])
    {
      v54 = (unint64_t *)(*(_QWORD *)&v91[8] + 8);
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }

  }
  if (lock)
    os_unfair_lock_unlock(lock);
  return v58 == 0;
}

- (tuple<int,)privateGetMXProperty:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  char *value;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  __n128 v13[4];
  tuple<int, id<NSSecureCoding>> result;

  v5 = v3;
  v6 = a3;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v13);
  v8 = (std::__shared_weak_count *)v13[0].n128_u64[1];
  if (v13[0].n128_u64[1])
  {
    v9 = (unint64_t *)(v13[0].n128_u64[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);

  result.var0.var1 = v12;
  *(_QWORD *)&result.var0.var0 = v11;
  return result;
}

- (tuple<int,)privateGetAppProperty:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  char *value;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  __n128 v13[4];
  tuple<int, id<NSSecureCoding>> result;

  v5 = v3;
  v6 = a3;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v13);
  v8 = (std::__shared_weak_count *)v13[0].n128_u64[1];
  if (v13[0].n128_u64[1])
  {
    v9 = (unint64_t *)(v13[0].n128_u64[1] + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);

  result.var0.var1 = v12;
  *(_QWORD *)&result.var0.var0 = v11;
  return result;
}

- (int)privateSetAppProperty:(id)a3 value:(id)a4 guard:(void *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __n128 v22;
  __n128 v23;
  __n128 v24[3];
  unsigned int v25;
  void *v26;
  _BYTE v27[24];
  _BYTE *v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  as::client::AVAudioApplicationImpl::GetConnection(*((__n128 **)a5 + 1), v24);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v24[0].n128_u64[0], &v26);
  v9 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v24[1];
  v23 = v24[2];
  v11 = v25;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setApplicationProperty:clientID:propertyID:propertyValue:reply:", &v22, v11, v7, v8, v12);

  objc_autoreleasePoolPop(v9);
  v13 = v29;
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "code", *(_OWORD *)&v22, *(_OWORD *)&v23);

  }
  else
  {
    v15 = as::AudioAppState::setPropertyApp((id *)(*((_QWORD *)a5 + 1) + 72), v7, v8);
  }

  v16 = v28;
  if (v28 == v27)
  {
    v17 = 4;
    v16 = v27;
    goto LABEL_8;
  }
  if (v28)
  {
    v17 = 5;
LABEL_8:
    (*(void (**)(void))(*v16 + 8 * v17))();
  }

  v18 = (std::__shared_weak_count *)v24[0].n128_u64[1];
  if (v24[0].n128_u64[1])
  {
    v19 = (unint64_t *)(v24[0].n128_u64[1] + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return v15;
}

- (int)privateSetAppProperty:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  char *value;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  __n128 v23;
  __n128 v24;
  __n128 v25[3];
  unsigned int v26;
  void *v27;
  _BYTE v28[24];
  _BYTE *v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v25);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v25[0].n128_u64[0], &v27);
  v9 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v25[1];
  v24 = v25[2];
  v11 = v26;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setApplicationProperty:clientID:propertyID:propertyValue:reply:", &v23, v11, v6, v7, v12);

  objc_autoreleasePoolPop(v9);
  v13 = v30;
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "code", *(_OWORD *)&v23, *(_OWORD *)&v24);

  }
  else
  {
    v16 = self->_impl.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v16);
    v15 = as::AudioAppState::setPropertyApp((id *)v16 + 10, v6, v7);
    if (v16)
      os_unfair_lock_unlock((os_unfair_lock_t)v16);
  }

  v17 = v29;
  if (v29 == v28)
  {
    v18 = 4;
    v17 = v28;
    goto LABEL_11;
  }
  if (v29)
  {
    v18 = 5;
LABEL_11:
    (*(void (**)(void))(*v17 + 8 * v18))();
  }

  v19 = (std::__shared_weak_count *)v25[0].n128_u64[1];
  if (v25[0].n128_u64[1])
  {
    v20 = (unint64_t *)(v25[0].n128_u64[1] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  return v15;
}

- (int)privateUpdateAppProperty:(id)a3 value:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *value;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __n128 v26;
  __n128 v27;
  __n128 v28[3];
  unsigned int v29;
  void *v30;
  _BYTE v31[24];
  _BYTE *v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v28);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v28[0].n128_u64[0], &v30);
  v12 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v28[1];
  v27 = v28[2];
  v14 = v29;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateApplicationProperty:clientID:propertyID:propertyValue:context:reply:", &v26, v14, v8, v9, v10, v15);

  objc_autoreleasePoolPop(v12);
  v16 = v33;
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, "code", *(_OWORD *)&v26, *(_OWORD *)&v27);

  }
  else
  {
    v19 = self->_impl.__ptr_.__value_;
    os_unfair_lock_lock((os_unfair_lock_t)v19);
    v18 = as::AudioAppState::setPropertyApp((id *)v19 + 10, v8, v9);
    if (v19)
      os_unfair_lock_unlock((os_unfair_lock_t)v19);
  }

  v20 = v32;
  if (v32 == v31)
  {
    v21 = 4;
    v20 = v31;
    goto LABEL_11;
  }
  if (v32)
  {
    v21 = 5;
LABEL_11:
    (*(void (**)(void))(*v20 + 8 * v21))();
  }

  v22 = (std::__shared_weak_count *)v28[0].n128_u64[1];
  if (v28[0].n128_u64[1])
  {
    v23 = (unint64_t *)(v28[0].n128_u64[1] + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }

  return v18;
}

- (int)privateSetMXPropertyOnAllSessions:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  char *value;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  os_unfair_lock_s *v16;
  _QWORD *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  __n128 v23;
  __n128 v24;
  __n128 v25[3];
  unsigned int v26;
  void *v27;
  _BYTE v28[24];
  _BYTE *v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v25);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v25[0].n128_u64[0], &v27);
  v9 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v25[1];
  v24 = v25[2];
  v11 = v26;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMXPropertyOnAllSessions:clientID:MXProperty:values:reply:", &v23, v11, v6, v7, v12);

  objc_autoreleasePoolPop(v9);
  v13 = v30;
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, "code", *(_OWORD *)&v23, *(_OWORD *)&v24);

  }
  else
  {
    v16 = (os_unfair_lock_s *)self->_impl.__ptr_.__value_;
    os_unfair_lock_lock(v16);
    v15 = as::AudioAppState::setPropertyMX((uint64_t)&v16[20], v6, v7);
    if (v16)
      os_unfair_lock_unlock(v16);
  }

  v17 = v29;
  if (v29 == v28)
  {
    v18 = 4;
    v17 = v28;
    goto LABEL_11;
  }
  if (v29)
  {
    v18 = 5;
LABEL_11:
    (*(void (**)(void))(*v17 + 8 * v18))();
  }

  v19 = (std::__shared_weak_count *)v25[0].n128_u64[1];
  if (v25[0].n128_u64[1])
  {
    v20 = (unint64_t *)(v25[0].n128_u64[1] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

  return v15;
}

- (void).cxx_destruct
{
  unique_ptr<caulk::synchronized<as::client::AVAudioApplicationImpl>, std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl>>> *p_impl;
  id *v3;
  id *value;

  value = (id *)self->_impl.__ptr_.__value_;
  p_impl = &self->_impl;
  v3 = value;
  p_impl->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)p_impl, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (id)initProxyForProcess:(id *)a3
{
  id v5;
  __int128 v6;
  void *v7;
  AVAudioApplication *v8;
  _OWORD v10[2];

  v5 = objc_alloc_init(MEMORY[0x1E0CFF1E8]);
  objc_msgSend(v5, "setAudioAppType:", 1886547832);
  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  objc_msgSend(v5, "setAppAuditToken:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProcessName:", v7);

  v8 = -[AVAudioApplication initWithSpecification:](self, "initWithSpecification:", v5);
  return v8;
}

- (id)initDelegateForProcess:(id *)a3 processAttribution:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  AVAudioApplication *v10;
  _OWORD v12[2];

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CFF1E8]);
  objc_msgSend(v7, "setAudioAppType:", 1684825972);
  v8 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v8;
  objc_msgSend(v7, "setAppAuditToken:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProcessName:", v9);

  v10 = -[AVAudioApplication initWithSpecification:](self, "initWithSpecification:", v7);
  return v10;
}

- (BOOL)setInputMuted:(BOOL)a3 context:(id)a4 error:(id *)a5
{
  _BOOL4 v5;
  void *v7;
  int v8;
  as::client *v9;
  NSObject *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AVAudioApplication privateSetAppProperty:value:](self, "privateSetAppProperty:value:", CFSTR("InputMute"), v7);

  if (v8)
  {
    v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v9));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = "unmuted";
      v14 = "AVAudioApplication.mm";
      v16 = 608;
      v17 = 2080;
      v13 = 136315906;
      v15 = 1024;
      if (v5)
        v11 = "muted";
      v18 = v11;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set input %s, err:%d", (uint8_t *)&v13, 0x22u);
    }
    return FormatNSErrorForReturn();
  }
  else
  {
    self->_inputMuted = v5;
    return 1;
  }
}

+ (BOOL)toggleInputMute:(id *)a3
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  as::client *v7;
  as::client *v8;
  NSObject *v9;
  _QWORD *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  id *v15;
  __n128 v17;
  id *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  void *v23;
  _BYTE v24[24];
  _BYTE *v25;
  id v26;
  uint64_t v27;

  v3 = (char)a3;
  v27 = *MEMORY[0x1E0C80C00];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v18);
  EphemeralAudioApp::GetConnection((os_unfair_lock_t *)&v18, &v17);
  as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v17.n128_u64[0], &v23);
  v4 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toggleInputMuteForRecordingProcess:", v6);

  objc_autoreleasePoolPop(v4);
  v7 = (as::client *)v26;
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "AVAudioApplication.mm";
      v21 = 1024;
      v22 = 633;
      _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to toggle input mute", buf, 0x12u);
    }
    objc_msgSend(v26, "code");
    v3 = FormatNSErrorForReturn();
  }

  v10 = v25;
  if (v25 == v24)
  {
    v11 = 4;
    v10 = v24;
    goto LABEL_9;
  }
  if (v25)
  {
    v11 = 5;
LABEL_9:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

  v12 = (std::__shared_weak_count *)v17.n128_u64[1];
  if (v17.n128_u64[1])
  {
    v13 = (unint64_t *)(v17.n128_u64[1] + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = v18;
  v18 = 0;
  if (v15)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&v18, v15);
  return (v8 == 0) | v3 & 1;
}

+ (id)muteRunningInputs:(id *)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  as::client *v8;
  as::client *v9;
  NSObject *v10;
  id v11;
  _QWORD *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  id *v18;
  __n128 v19;
  id *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  void *v25;
  _BYTE v26[24];
  _BYTE *v27;
  id v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  {
    as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
  }
  if (!as::SmartRoutingPrioritizesCall(void)::enabled)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 2003329396, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v20);
  EphemeralAudioApp::GetConnection((os_unfair_lock_t *)&v20, &v19);
  as::client::XPCConnection::sync_message<NSDictionary * {__strong}>((as::client::XPCConnection *)v19.n128_u64[0], &v25);
  v5 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(&v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSDictionary * {__strong}>::reply((uint64_t)&v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "muteInputForRecordingProcesses:", v7);

  objc_autoreleasePoolPop(v5);
  v8 = (as::client *)v28;
  if (v8)
  {
    v9 = v8;
    v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v8));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "AVAudioApplication.mm";
      v23 = 1024;
      v24 = 651;
      _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to mute running inputs", buf, 0x12u);
    }
    FormatNSErrorForReturn();

    v11 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v11 = v29;
  }

  v13 = v27;
  if (v27 == v26)
  {
    v14 = 4;
    v13 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_14;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_14:

  v15 = (std::__shared_weak_count *)v19.n128_u64[1];
  if (v19.n128_u64[1])
  {
    v16 = (unint64_t *)(v19.n128_u64[1] + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v20;
  v20 = 0;
  if (v18)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&v20, v18);
  return v11;
}

+ (BOOL)allowAppToInitiatePlaybackTemporarily:(id)a3 error:(id *)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  as::client *v9;
  as::client *v10;
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  as::client::XPCConnection *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  void *v29;
  _BYTE v30[24];
  _BYTE *v31;
  id v32;
  uint64_t v33;

  v4 = (char)a4;
  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ZNSt3__115allocate_sharedB8ne180100INS_15recursive_mutexENS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v23);
  as::client::XPCConnection::CreateForAudioApplication(&v23, &v21);
  as::client::XPCConnection::sync_message<>(v21, &v29);
  v6 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowAppToInitiatePlaybackTemporarilyFromBackground:reply:", v5, v8);

  objc_autoreleasePoolPop(v6);
  v9 = (as::client *)v32;
  v10 = v9;
  if (v9)
  {
    v11 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v9));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "AVAudioApplication.mm";
      v27 = 1024;
      v28 = 674;
      _os_log_impl(&dword_19EF50000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Request to initiate playback from background failed", buf, 0x12u);
    }
    objc_msgSend(v32, "code");
    v4 = FormatNSErrorForReturn();
  }

  v12 = v31;
  if (v31 == v30)
  {
    v13 = 4;
    v12 = v30;
    goto LABEL_9;
  }
  if (v31)
  {
    v13 = 5;
LABEL_9:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }

  v14 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = v24;
  if (v24)
  {
    v18 = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  return (v10 == 0) | v4 & 1;
}

+ (BOOL)setEnhanceDialoguePreference:(int64_t)a3 error:(id *)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  as::client *v10;
  as::client *v11;
  NSObject *v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  id *v19;
  __n128 v21;
  id *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  void *v29;
  _BYTE v30[24];
  _BYTE *v31;
  id v32;
  uint64_t v33;

  v4 = (char)a4;
  v33 = *MEMORY[0x1E0C80C00];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v22);
  EphemeralAudioApp::GetConnection((os_unfair_lock_t *)&v22, &v21);
  if (v21.n128_u64[0])
  {
    as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v21.n128_u64[0], &v29);
    v6 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnhanceDialoguePreference:reply:", v8, v9);

    objc_autoreleasePoolPop(v6);
    v10 = (as::client *)v32;
    v11 = v10;
    if (v10)
    {
      v12 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v10));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "AVAudioApplication.mm";
        v25 = 1024;
        v26 = 698;
        v27 = 1024;
        v28 = a3;
        _os_log_impl(&dword_19EF50000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Request to set Enhance Dialogue preference (%d) failed", buf, 0x18u);
      }
      objc_msgSend(v32, "code");
      v4 = FormatNSErrorForReturn();
    }

    v14 = v31;
    if (v31 == v30)
    {
      v15 = 4;
      v14 = v30;
    }
    else
    {
      if (!v31)
      {
LABEL_12:

        v13 = (v11 == 0) | v4;
        goto LABEL_13;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }
  v13 = FormatNSErrorForReturn();
LABEL_13:
  v16 = (std::__shared_weak_count *)v21.n128_u64[1];
  if (v21.n128_u64[1])
  {
    v17 = (unint64_t *)(v21.n128_u64[1] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v22;
  v22 = 0;
  if (v19)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&v22, v19);
  return v13 & 1;
}

+ (BOOL)setEnhanceDialogueLevel:(int64_t)a3 error:(id *)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  as::client *v10;
  as::client *v11;
  NSObject *v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  id *v19;
  __n128 v21;
  id *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  void *v29;
  _BYTE v30[24];
  _BYTE *v31;
  id v32;
  uint64_t v33;

  v4 = (char)a4;
  v33 = *MEMORY[0x1E0C80C00];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v22);
  EphemeralAudioApp::GetConnection((os_unfair_lock_t *)&v22, &v21);
  if (v21.n128_u64[0])
  {
    as::client::XPCConnection::sync_message<>((as::client::XPCConnection *)v21.n128_u64[0], &v29);
    v6 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::sync_proxy(&v29);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong}>::reply((uint64_t)&v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnhanceDialogueLevel:reply:", v8, v9);

    objc_autoreleasePoolPop(v6);
    v10 = (as::client *)v32;
    v11 = v10;
    if (v10)
    {
      v12 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v10));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "AVAudioApplication.mm";
        v25 = 1024;
        v26 = 720;
        v27 = 1024;
        v28 = a3;
        _os_log_impl(&dword_19EF50000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Request to set Enhance Dialogue level (%d) failed", buf, 0x18u);
      }
      objc_msgSend(v32, "code");
      v4 = FormatNSErrorForReturn();
    }

    v14 = v31;
    if (v31 == v30)
    {
      v15 = 4;
      v14 = v30;
    }
    else
    {
      if (!v31)
      {
LABEL_12:

        v13 = (v11 == 0) | v4;
        goto LABEL_13;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_12;
  }
  v13 = FormatNSErrorForReturn();
LABEL_13:
  v16 = (std::__shared_weak_count *)v21.n128_u64[1];
  if (v21.n128_u64[1])
  {
    v17 = (unint64_t *)(v21.n128_u64[1] + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  v19 = v22;
  v22 = 0;
  if (v19)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&v22, v19);
  return v13 & 1;
}

+ (BOOL)getEnhanceDialogueLevel:(int64_t *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  char v11;
  char v12;
  as::client *v13;
  NSObject *v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  id *v21;
  __n128 v23;
  id *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  void *v31;
  _BYTE v32[24];
  _BYTE *v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  EphemeralAudioApp::EphemeralAudioApp((EphemeralAudioApp *)&v24);
  EphemeralAudioApp::GetConnection((os_unfair_lock_t *)&v24, &v23);
  if (v23.n128_u64[0])
  {
    as::client::XPCConnection::sync_message<objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((as::client::XPCConnection *)v23.n128_u64[0], (uint64_t)&v31);
    v5 = (void *)MEMORY[0x1A1AF1EA0]();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>::sync_proxy(&v31);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>::reply((uint64_t)&v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getEnhanceDialogueLevelWithReply:", v7);

    objc_autoreleasePoolPop(v5);
    v8 = v35;
    v9 = v34;
    if (v9)
    {
      v10 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog((as::client *)objc_msgSend(v34, "code")));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "AVAudioApplication.mm";
        v27 = 1024;
        v28 = 744;
        _os_log_impl(&dword_19EF50000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Request to get Enhance Dialogue level failed", buf, 0x12u);
      }
      v11 = FormatNSErrorForReturn();
    }
    else
    {
      v13 = (as::client *)objc_msgSend(v8, "intValue");
      if ((v13 & 0x80000000) == 0)
      {
        v13 = (as::client *)objc_msgSend(v8, "intValue");
        if ((int)v13 < 4)
        {
          *a3 = (int)objc_msgSend(v8, "intValue");
          v12 = 1;
LABEL_13:

          v16 = v33;
          if (v33 == v32)
          {
            v17 = 4;
            v16 = v32;
          }
          else
          {
            if (!v33)
            {
LABEL_18:

              goto LABEL_19;
            }
            v17 = 5;
          }
          (*(void (**)(void))(*v16 + 8 * v17))();
          goto LABEL_18;
        }
      }
      v14 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v13));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = objc_msgSend(v8, "intValue");
        *(_DWORD *)buf = 136315650;
        v26 = "AVAudioApplication.mm";
        v27 = 1024;
        v28 = 748;
        v29 = 1024;
        v30 = v15;
        _os_log_impl(&dword_19EF50000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid value %d retrieved for Enhance Dialogue level", buf, 0x18u);
      }

      v11 = FormatNSErrorForReturn();
    }
    v12 = v11;

    goto LABEL_13;
  }
  v12 = FormatNSErrorForReturn();
LABEL_19:
  v18 = (std::__shared_weak_count *)v23.n128_u64[1];
  if (v23.n128_u64[1])
  {
    v19 = (unint64_t *)(v23.n128_u64[1] + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = v24;
  v24 = 0;
  if (v21)
    std::default_delete<caulk::synchronized<as::client::AVAudioApplicationImpl,caulk::mach::unfair_lock,caulk::empty_atomic_interface<as::client::AVAudioApplicationImpl>>>::operator()[abi:ne180100]((uint64_t)&v24, v21);
  return v12;
}

+ (BOOL)appleTVSupportsEnhanceDialogue
{
  _BOOL8 IsAppleTV;
  int ProductType;

  IsAppleTV = PlatformUtilities_iOS::ProductIsAppleTV((PlatformUtilities_iOS *)a1);
  if (IsAppleTV)
  {
    ProductType = PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)IsAppleTV);
    LOBYTE(IsAppleTV) = ProductType == 79 || ProductType == 82;
  }
  return IsAppleTV;
}

+ (BOOL)iosDeviceSupportsEnhanceDialogue
{
  _BOOL8 IsAPhone;
  _BOOL4 v3;

  IsAPhone = PlatformUtilities_iOS::ProductIsAPhone((PlatformUtilities_iOS *)a1);
  if (IsAPhone || (v3 = PlatformUtilities_iOS::ProductIsiPad((PlatformUtilities_iOS *)IsAPhone)))
    LOBYTE(v3) = (_get_cpu_capabilities() & 0x78000000) != 0;
  return v3;
}

+ (BOOL)currentRouteSupportsEnhanceDialogue:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  BOOL v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  BOOL v20;
  BOOL v21;
  __CFString *v22;
  __CFString *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v6)
  {
    v21 = 0;
    goto LABEL_43;
  }
  v27 = *(_QWORD *)v29;
  while (2)
  {
    v26 = v6;
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v29 != v27)
        objc_enumerationMutation(obj);
      v8 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
      if (+[AVAudioApplication appleTVSupportsEnhanceDialogue](AVAudioApplication, "appleTVSupportsEnhanceDialogue"))
      {
        objc_msgSend(v8, "portType");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v9 == CFSTR("HDMIOutput"))
        {
          v9 = CFSTR("HDMIOutput");
LABEL_41:

LABEL_42:
          v21 = 1;
          goto LABEL_43;
        }
        objc_msgSend(v8, "portType");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v10 == CFSTR("BluetoothA2DPOutput"))
        {
          v22 = CFSTR("BluetoothA2DPOutput");
LABEL_40:

          goto LABEL_41;
        }
        objc_msgSend(v8, "portType");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == CFSTR("BluetoothHFP");

        if (v12)
          goto LABEL_42;
      }
      if (!+[AVAudioApplication iosDeviceSupportsEnhanceDialogue](AVAudioApplication, "iosDeviceSupportsEnhanceDialogue"))goto LABEL_32;
      objc_msgSend(v8, "portType");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v9 == CFSTR("Speaker"))
      {
        v9 = CFSTR("Speaker");
        goto LABEL_41;
      }
      objc_msgSend(v8, "portType");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v13 == CFSTR("Headphones"))
      {
        v22 = CFSTR("Headphones");
        goto LABEL_40;
      }
      objc_msgSend(v8, "portType");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v14 == CFSTR("LineOut"))
      {
        v20 = 1;
      }
      else
      {
        objc_msgSend(v8, "portType");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v15 == CFSTR("BluetoothA2DPOutput"))
        {
          v20 = 1;
        }
        else
        {
          objc_msgSend(v8, "portType");
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v16 == CFSTR("BluetoothHFP"))
          {
            v20 = 1;
          }
          else
          {
            objc_msgSend(v8, "portType");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v17 == CFSTR("BluetoothLE"))
            {
              v20 = 1;
            }
            else
            {
              objc_msgSend(v8, "portType");
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v24 == CFSTR("USBAudio"))
              {
                v20 = 1;
              }
              else
              {
                objc_msgSend(v8, "portType");
                v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v18 == CFSTR("DisplayPort"))
                {
                  v20 = 1;
                }
                else
                {
                  objc_msgSend(v8, "portType");
                  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  v20 = v19 == CFSTR("HDMIOutput");

                }
              }

            }
          }

        }
      }

      if (v20)
        goto LABEL_42;
LABEL_32:

    }
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    v21 = 0;
    if (v6)
      continue;
    break;
  }
LABEL_43:

  return v21;
}

- (id)sessionIDs
{
  char *value;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  as::client *v7;
  as::client *v8;
  NSObject *v9;
  int v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __n128 v19;
  __n128 v20;
  __n128 v21[3];
  int v22;
  unsigned int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  void *v32;
  _BYTE v33[24];
  _BYTE *v34;
  id v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v21);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  as::client::XPCConnection::sync_message<NSArray * {__strong}>((as::client::XPCConnection *)v21[0].n128_u64[0], &v32);
  v3 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21[1];
  v20 = v21[2];
  v5 = v23;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionIDs:clientID:reply:", &v19, v5, v6);

  objc_autoreleasePoolPop(v3);
  v7 = (as::client *)v35;
  if (v7)
  {
    v8 = v7;
    v9 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v22;
      -[as::client description](v8, "description", *(_OWORD *)&v19, *(_OWORD *)&v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v25 = "AVAudioApplication.mm";
      v26 = 1024;
      v27 = 817;
      v28 = 1024;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_19EF50000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get session IDs for app: %d, err: %@", buf, 0x22u);

    }
    v12 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v12 = v36;
  }

  v13 = v34;
  if (v34 == v33)
  {
    v14 = 4;
    v13 = v33;
    goto LABEL_12;
  }
  if (v34)
  {
    v14 = 5;
LABEL_12:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

  v15 = (std::__shared_weak_count *)v21[0].n128_u64[1];
  if (v21[0].n128_u64[1])
  {
    v16 = (unint64_t *)(v21[0].n128_u64[1] + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v12;
}

- (BOOL)stemClickMutingEnabled
{
  as::client *v2;
  as::client *v3;
  BOOL v4;
  NSObject *v5;
  char v6;
  int v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[AVAudioApplication privateGetMXProperty:](self, "privateGetMXProperty:", *MEMORY[0x1E0D49B08]);
  v2 = v9;
  v3 = v2;
  if (v8)
    v4 = 1;
  else
    v4 = v2 == 0;
  if (v4)
  {
    v5 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v2));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "AVAudioApplication.mm";
      v12 = 1024;
      v13 = 839;
      _os_log_impl(&dword_19EF50000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get PrefersBluetoothAccessoryMuting", buf, 0x12u);
    }
    v6 = 0;
  }
  else
  {
    v6 = -[as::client BOOLValue](v2, "BOOLValue");
  }

  return v6;
}

- (void)privateHandlePing
{
  char *value;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  as::client *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  as::client *v12;
  as::client *v13;
  uint64_t v14;
  as::client *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  AVAudioApplication *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _OWORD v44[2];
  __n128 v45[3];
  int v46;
  unsigned int v47;
  _BYTE buf[12];
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[14];
  _BYTE v53[128];
  _BYTE v54[128];
  void *v55;
  _BYTE v56[24];
  _BYTE *v57;
  id v58;
  id v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  value = (char *)self->_impl.__ptr_.__value_;
  os_unfair_lock_lock((os_unfair_lock_t)value);
  as::client::AVAudioApplicationImpl::GetConnection((__n128 *)(value + 8), v45);
  if (value)
    os_unfair_lock_unlock((os_unfair_lock_t)value);
  as::client::XPCConnection::sync_message<NSArray * {__strong}>((as::client::XPCConnection *)v45[0].n128_u64[0], &v55);
  v3 = (void *)MEMORY[0x1A1AF1EA0]();
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::sync_proxy(&v55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v45[1];
  v44[1] = v45[2];
  v5 = v47;
  caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},NSArray * {__strong}>::reply((uint64_t)&v55);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getApplicationMessages:clientID:reply:", v44, v5, v6);

  objc_autoreleasePoolPop(v3);
  if (v58)
  {
    v8 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v7));
    obj = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "AVAudioApplication.mm";
      v49 = 1024;
      v50 = 860;
      v51 = 2112;
      *(_QWORD *)v52 = v58;
      v9 = v58;
      _os_log_impl(&dword_19EF50000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Server returned an error:. %@", buf, 0x1Cu);

    }
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v59;
    v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v33)
    {
      v32 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v41 != v32)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v11 = v10;
          v12 = (as::client *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
          v13 = v12;
          if (v12)
          {
            v14 = *(_QWORD *)v37;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v37 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v15);
                v17 = objc_retainAutorelease(*(id *)as::client::gSessionClientLog(v12));
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "AVAudioApplication.mm";
                  v49 = 1024;
                  v50 = 871;
                  v51 = 1024;
                  *(_DWORD *)v52 = v46;
                  *(_WORD *)&v52[4] = 2112;
                  *(_QWORD *)&v52[6] = v16;
                  _os_log_impl(&dword_19EF50000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d Handling application deferred message, PID = %d, notificationName = %@", buf, 0x22u);
                }
                objc_msgSend(v11, "objectForKey:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("AVAudioApplicationInputMuteStateChangeNotification")))
                {
                  objc_msgSend(v18, "valueForKey:", CFSTR("AVAudioApplicationMuteStateKey"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    v20 = self->_impl.__ptr_.__value_;
                    os_unfair_lock_lock((os_unfair_lock_t)v20);
                    as::AudioAppState::setPropertyApp((id *)v20 + 10, CFSTR("InputMute"), v19);
                    if (v20)
                      os_unfair_lock_unlock((os_unfair_lock_t)v20);
                  }

                }
                v21 = self;
                v22 = v18;
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("AVAudioApplicationInputMuteStateChangeNotification")))
                {
                  objc_msgSend(v22, "valueForKey:", CFSTR("AVAudioApplicationMuteStateKey"));
                  v23 = objc_claimAutoreleasedReturnValue();
                  v24 = (void *)v23;
                  if (v23)
                  {
                    v60[0] = CFSTR("AVAudioApplicationMuteStateKey");
                    *(_QWORD *)buf = v23;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v60, 1);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AVAudioApplication postNotificationName:userInfo:](v21, "postNotificationName:userInfo:", CFSTR("AVAudioApplicationInputMuteStateChangeNotification"), v25);

                  }
                }

                v15 = (as::client *)((char *)v15 + 1);
              }
              while (v13 != v15);
              v12 = (as::client *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
              v13 = v12;
            }
            while (v12);
          }

        }
        v33 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v33);
    }

  }
  v26 = v57;
  if (v57 == v56)
  {
    v27 = 4;
    v26 = v56;
  }
  else
  {
    if (!v57)
      goto LABEL_37;
    v27 = 5;
  }
  (*(void (**)(void))(*v26 + 8 * v27))();
LABEL_37:

  v28 = (std::__shared_weak_count *)v45[0].n128_u64[1];
  if (v45[0].n128_u64[1])
  {
    v29 = (unint64_t *)(v45[0].n128_u64[1] + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__AVAudioApplication_Internal__postNotificationName_userInfo___block_invoke;
  v10[3] = &unk_1E4250238;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __62__AVAudioApplication_Internal__postNotificationName_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (uint64_t)privateCreateAudioApplicationInServer:
{
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (void)privateCreateAudioApplicationInServer:
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "privateRecreateAudioApplicationInServer");

}

- (id)privateCreateAudioApplicationInServer:
{
  id *v1;
  id *v2;

  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  *v2 = &off_1E424F538;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end
