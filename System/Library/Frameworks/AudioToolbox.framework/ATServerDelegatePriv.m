@implementation ATServerDelegatePriv

- (int)handleInterruptionWithID:(unsigned int)a3 clientPID:(int)a4 interruptionState:(unsigned int)a5 interruptionInfo:(id)a6
{
  AudioToolboxServerHandleInterruptionWithID(a4, *(uint64_t *)&a3, *(uint64_t *)&a5, (uint64_t)a6);
  return 0;
}

- (void)setTelephonyClientSessionID:(unsigned int)a3
{
  uint64_t v3;
  AQIONodeManager *v4;

  v3 = *(_QWORD *)&a3;
  v4 = (AQIONodeManager *)AQIONodeManager::systemMixEngine((AQIONodeManager *)self);
  AQIONodeManager::_SetTelephonyClientSessionID(v4, v3, 0);
}

- (int)refreshRecordPermissions:(id *)a3
{
  __int128 v3;
  __int128 v4;
  AQ::Server *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  unsigned __int8 v9;
  pid_t v10;
  NSObject *v11;
  unsigned __int8 v12;
  void *v14;
  unsigned int *v15;
  unsigned int *v16;
  NSObject *v17;
  id v18;
  __compressed_pair<std::string::__rep, std::allocator<char>> v19;
  audit_token_t atoken;
  audit_token_t *v21;
  _QWORD v22[3];
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  audit_token_t v26;
  _QWORD v27[2];
  _QWORD v28[3];
  _QWORD *v29;
  _QWORD v30[2];
  __compressed_pair<std::string::__rep, std::allocator<char>> v31;
  AQMESession buf;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v31.__value_.var0.__s.__data_ = *(_OWORD *)a3->var0;
  *((_OWORD *)&v31.__value_.var0.__l + 1) = v3;
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&atoken.val[4] = v4;
  v5 = (AQ::Server *)audit_token_to_pid(&atoken);
  v6 = (int)v5;
  if (gAQMELogScope)
  {
    v7 = *(NSObject **)gAQMELogScope;
    if (!*(_QWORD *)gAQMELogScope)
      goto LABEL_7;
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
  }
  v5 = (AQ::Server *)os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v5)
  {
    buf.mProcessID = 136315650;
    *(_QWORD *)&buf.mSessionID = "AudioToolboxServers.mm";
    *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
    *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 419;
    WORD1(buf.mSubsessionRef.mCFObject) = 1024;
    HIDWORD(buf.mSubsessionRef.mCFObject) = v6;
    _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioToolboxServerRefreshRecordPermissions for pid %d", (uint8_t *)&buf, 0x18u);
  }
LABEL_7:
  v8 = AQ::Server::global(v5);
  v19 = v31;
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
    goto LABEL_18;
  v26 = (audit_token_t)v19;
  v10 = audit_token_to_pid(&v26);
  if (!gAQMELogScope)
  {
    v11 = MEMORY[0x1E0C81028];
LABEL_13:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      buf.mProcessID = 136315650;
      *(_QWORD *)&buf.mSessionID = "AQ_Server.cpp";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 188;
      WORD1(buf.mSubsessionRef.mCFObject) = 1024;
      HIDWORD(buf.mSubsessionRef.mCFObject) = v10;
      _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d AQServer::RefreshRecordPermissionsForClients (pid = %d)", (uint8_t *)&buf, 0x18u);
    }
    goto LABEL_15;
  }
  v11 = *(NSObject **)gAQMELogScope;
  if (*(_QWORD *)gAQMELogScope)
    goto LABEL_13;
LABEL_15:
  {
    CASIsDarwinOS(void)::global = os_variant_is_darwinos();
  }
  if (CASIsDarwinOS(void)::global)
    goto LABEL_17;
  if (!sSessionServer)
  {
    v17 = MEMORY[0x1E0C81028];
    v18 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      buf.mProcessID = 136315394;
      *(_QWORD *)&buf.mSessionID = "AudioSessionServerImp.mm";
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 1184;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioSessionServer has not been initialized", (uint8_t *)&buf, 0x12u);
    }

LABEL_17:
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_18;
  }
  AudioSessionServerInstance();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getSessionIDsForToken:", &v19);

  v16 = v23;
  v15 = v24;
  if (v23 != v24)
  {
    do
    {
      AQMESession::AQMESession(&buf, *v16, 0);
      v21 = (audit_token_t *)&v19;
      v22[0] = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::RefreshRecordPermissionsForClients(audit_token_t)::$_0>;
      v22[1] = &v21;
      v27[0] = &buf;
      v27[1] = v22;
      v28[0] = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::forEachQueueInSession(AQMESession const&,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
      v28[1] = v27;
      v29 = v28;
      v30[0] = caulk::function_ref<void ()>::functor_invoker<AQ::Server::Base::forEachQueue(BOOL,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
      v30[1] = &v29;
      (*(void (**)(uint64_t, _QWORD, _QWORD *))(*(_QWORD *)v8 + 40))(v8, 0, v30);
      std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf.mDescription.var0);
      if (*((char *)&buf.mDescription.__r_.__value_.var0.__l + 23) < 0)
        operator delete(buf.mDescription.__r_.__value_.var0.__l.__data_);
      if (buf.mSubsessionRef.mCFObject)
        CFRelease(buf.mSubsessionRef.mCFObject);
      ++v16;
    }
    while (v16 != v15);
    v15 = v23;
  }
  if (v15)
  {
    v24 = v15;
    operator delete(v15);
  }
LABEL_18:
  CADeprecated::TSingleton<RemoteIOServer>::instance();
  buf.mDescription.__r_ = v31;
  *(_QWORD *)&buf.mProcessID = MEMORY[0x1E0C809B0];
  buf.mSourceSessionID = (optional<unsigned int>)3221225472;
  buf.mSubsessionRef.mCFObject = ___ZN14RemoteIOServer34RefreshRecordPermissionsForClientsE13audit_token_t_block_invoke;
  buf.mSubsessionID = (unint64_t)&__block_descriptor_64_e9_v16__0_v8l;
  CADeprecated::XMachServer::DoForEachClient();
  return 0;
}

- (int)muteSessionInput:(unsigned int)a3 clientPID:(int)a4 muted:(BOOL)a5
{
  _BOOL8 v5;
  NSObject *v8;
  const char *v10;
  AQ::Server *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t (*v18)(const AQMESession ***, uint64_t);
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  uint64_t (**v22)(unsigned __int8 ***, uint64_t);
  AQMESession *p_buf;
  int v24;
  BOOL v25;
  uint64_t (*v26)(unsigned __int8 ***, uint64_t);
  uint64_t (**v27)(unsigned __int8 ***, uint64_t);
  uint64_t v28;
  int v29;
  _QWORD v30[2];
  int v31;
  BOOL v32;
  _QWORD v33[2];
  uint64_t (**v34)(const AQMESession ***, uint64_t);
  _QWORD v35[2];
  AQMESession buf;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    return -50;
  v5 = a5;
  if (!gAQMELogScope)
  {
    v8 = MEMORY[0x1E0C81028];
LABEL_7:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = "unmuting";
      buf.mProcessID = 136315906;
      *(_QWORD *)&buf.mSessionID = "AudioToolboxServers.mm";
      *(_DWORD *)(&buf.mSourceSessionID.__engaged_ + 2) = 728;
      WORD1(buf.mSubsessionRef.mCFObject) = 2080;
      *(_WORD *)&buf.mSourceSessionID.__engaged_ = 1024;
      if (v5)
        v10 = "muting";
      *(void **)((char *)&buf.mSubsessionRef.mCFObject + 4) = (void *)v10;
      WORD2(buf.mSubsessionID) = 1024;
      *(_DWORD *)((char *)&buf.mSubsessionID + 6) = a3;
      _os_log_impl(&dword_1A0F4D000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d %s all client input, session id: 0x%x", (uint8_t *)&buf, 0x22u);
    }
    goto LABEL_11;
  }
  v8 = *(NSObject **)gAQMELogScope;
  if (*(_QWORD *)gAQMELogScope)
    goto LABEL_7;
LABEL_11:
  AQMESession::AQMESession(&buf, a3, a4);
  CADeprecated::TSingleton<RemoteIOServer>::instance();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v18 = (uint64_t (*)(const AQMESession ***, uint64_t))MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = ___ZN14RemoteIOServer13SetInputMutedERK11AQMESessionbf_block_invoke;
  v21 = &unk_1E4513C98;
  v24 = 1036831949;
  v25 = v5;
  v22 = &v26;
  p_buf = &buf;
  CADeprecated::XMachServer::DoForEachClient();
  _Block_object_dispose(&v26, 8);
  v12 = AQ::Server::global(v11);
  v13 = v12;
  v32 = v5;
  if ((v14 & 1) == 0)
  {
    if ((_DWORD)v12)
    {
      CASIsDarwinOS(void)::global = os_variant_is_darwinos();
    }
  }
  if (!CASIsDarwinOS(void)::global)
  {
    v31 = 0;
    v30[0] = &v32;
    v30[1] = &v31;
    v26 = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::SetInputMuted(AQMESession const&,BOOL)::$_0>;
    v27 = (uint64_t (**)(unsigned __int8 ***, uint64_t))v30;
    v33[0] = &buf;
    v33[1] = &v26;
    v18 = caulk::function_ref<void ()(QueueAccessor &)>::functor_invoker<AQ::Server::Base::forEachQueueInSession(AQMESession const&,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
    v19 = (uint64_t)v33;
    v34 = &v18;
    v35[0] = caulk::function_ref<void ()>::functor_invoker<AQ::Server::Base::forEachQueue(BOOL,caulk::function_ref<void ()(QueueAccessor &)> const&)::$_0>;
    v35[1] = &v34;
    v12 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD *))(*(_QWORD *)v13 + 40))(v13, 0, v35);
  }
  if (PhaseServer::HasPlatform((PhaseServer *)v12))
  {
    v15 = (void *)PhaseServer::instance(void)::global;
    v16 = AQMESession::sessionID(&buf);
    LODWORD(v17) = 1008981770;
    objc_msgSend(v15, "muteSessionInput:mute:fadeTime:", v16, v5, v17);
  }
  if (_os_feature_enabled_impl()
    && _os_feature_enabled_impl()
    && (gAQME_TelephonyClientSession
     && AQMESession::sessionID((AQMESession *)gAQME_TelephonyClientSession) == a3
     || gAQME_VPIOClientSession && AQMESession::sessionID((AQMESession *)gAQME_VPIOClientSession) == a3))
  {
    AudioToolboxServerSetTelephonyMutes(v5 | 0x100, 0);
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf.mDescription.var0);
  if (*((char *)&buf.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(buf.mDescription.__r_.__value_.var0.__l.__data_);
  if (buf.mSubsessionRef.mCFObject)
    CFRelease(buf.mSubsessionRef.mCFObject);
  return 0;
}

- (int)updateMicrophoneInjectionPreference:(int64_t)a3 forSession:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  int v13;
  unint64_t *v14;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a4 == -1)
    return -50;
  v4 = *(_QWORD *)&a4;
  v6 = AQIONodeManager::systemMixEngine((AQIONodeManager *)self);
  os_unfair_recursive_lock_lock_with_options();
  v7 = *(uint64_t **)(v6 + 56);
  v8 = *(uint64_t **)(v6 + 64);
  if (v7 == v8)
  {
    v13 = 0;
  }
  else
  {
    do
    {
      v9 = *v7;
      v10 = (std::__shared_weak_count *)v7[1];
      if (v10)
      {
        p_shared_owners = (unint64_t *)&v10->__shared_owners_;
        do
          v12 = __ldxr(p_shared_owners);
        while (__stxr(v12 + 1, p_shared_owners));
      }
      v13 = (*(uint64_t (**)(uint64_t, uint64_t, int64_t))(*(_QWORD *)v9 + 144))(v9, v4, a3);
      if (v10)
      {
        v14 = (unint64_t *)&v10->__shared_owners_;
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
      }
      if (!v13)
        break;
      v7 += 2;
    }
    while (v7 != v8);
  }
  os_unfair_recursive_lock_unlock();
  if (gAQMELogScope)
  {
    v16 = *(NSObject **)gAQMELogScope;
    if (!*(_QWORD *)gAQMELogScope)
      return v13;
  }
  else
  {
    v16 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)a3)
    {
      if ((_DWORD)a3 == 0x2000)
      {
        v17 = "SpokenAudioBypassesMicMute";
      }
      else if ((_DWORD)a3 == 1)
      {
        v17 = "SpokenAudio";
      }
      else
      {
        v17 = "Unknown";
      }
    }
    else
    {
      v17 = "None";
    }
    v19 = 136316162;
    v20 = "AudioToolboxServers.mm";
    v21 = 1024;
    v22 = 783;
    v23 = 2080;
    v24 = v17;
    v25 = 1024;
    v26 = v4;
    v27 = 1024;
    v28 = v13;
    _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AudioToolboxServerMixToTelephonyUplink; injectionMode: %s, session id: 0x%x, status: %d",
      (uint8_t *)&v19,
      0x28u);
  }
  return v13;
}

- (BOOL)spatialAudioEnabled:(unsigned int)a3 mode:(id)a4
{
  AQIONodeManager *v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int *v9;
  int v10;
  NSObject *v11;
  id v12;
  unsigned __int8 v14[12];
  unsigned int v15;
  int v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = *(AQIONodeManager **)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D49110]))
    v6 = 1836019574;
  else
    v6 = 1936684398;
  AudioGetSessionSpatialPreferencesForContentType(v4, v6, v14);
  v7 = v15;
  if (v15)
  {
    v8 = 0;
    v9 = &v16;
    do
    {
      v10 = *v9++;
      v8 |= v10 == 1835824233;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v11 = MEMORY[0x1E0C81028];
  v12 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v18 = "ATServerDelegatePriv.mm";
    v19 = 1024;
    v20 = 93;
    v21 = 1024;
    v22 = v8 & 1;
    v23 = 1024;
    v24 = (int)v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%25s:%-5d spatialEnabled is %d SessionID is 0x%x", buf, 0x1Eu);
  }

  return v8 & 1;
}

- (BOOL)dolbyDigitalEncoderAvailable
{
  uint64_t PropertyInfo;
  uint64_t v3;
  OSStatus v4;
  NSObject *v5;
  id v6;
  BOOL result;
  UInt32 v8;
  UInt32 v9;
  uint64_t v10;
  char *v11;
  OSStatus Property;
  OSStatus v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  int *v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  UInt32 outPropertyDataSize;
  int inSpecifier;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  outPropertyDataSize = 0;
  inSpecifier = 1633889587;
  PropertyInfo = AudioFormatGetPropertyInfo(0x6176656Eu, 4u, &inSpecifier, &outPropertyDataSize);
  if ((_DWORD)PropertyInfo)
  {
    v4 = PropertyInfo;
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "ATServerDelegatePriv.mm";
      v25 = 1024;
      v26 = 108;
      v27 = 1024;
      v28 = v4;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioFormatGetPropertyInfo kAudioFormatProperty_Encoders error %d", buf, 0x18u);
    }

    return 0;
  }
  v8 = outPropertyDataSize;
  v9 = outPropertyDataSize / 0xC;
  MEMORY[0x1E0C80A78](PropertyInfo, v3);
  v11 = (char *)&v20 - v10;
  Property = AudioFormatGetProperty(0x6176656Eu, 4u, &inSpecifier, &outPropertyDataSize, (char *)&v20 - v10);
  if (Property)
  {
    v13 = Property;
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "ATServerDelegatePriv.mm";
      v25 = 1024;
      v26 = 119;
      v27 = 1024;
      v28 = v13;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d AudioFormatGetProperty kAudioFormatProperty_Encoders error %d", buf, 0x18u);
    }

    return 0;
  }
  if (v8 < 0xC)
    return 0;
  v16 = 12 * v9 - 12;
  v17 = (int *)(v11 + 4);
  do
  {
    v18 = *v17;
    v17 += 3;
    result = v18 == 1633889587;
    v19 = v18 == 1633889587 || v16 == 0;
    v16 -= 12;
  }
  while (!v19);
  return result;
}

- (id)spatialPreferencesForSession:(unsigned int)a3 contentType:(unsigned int)a4
{
  const AQMEIO_Binding *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const AQMEIO_Binding *v21[2];
  char v22;
  std::__shared_weak_count *v23;
  char v24;
  AQMESession v25;

  v17 = 0;
  v18 = 0;
  v20 = 0;
  v19 = 0;
  v6 = (const AQMEIO_Binding *)AQIONodeManager::systemMixEngine((AQIONodeManager *)self);
  AQMESession::AQMESession(&v25, a3, 0);
  v21[0] = v6;
  v21[1] = (const AQMEIO_Binding *)0x300000000;
  v22 = 0;
  v24 = 0;
  SpatializationManager::GetPreferences(&v25, v21, a4, (unsigned __int8 *)&v17, 0, 0);
  if (v24)
  {
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
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v25.mDescription.var0);
  if (*((char *)&v25.mDescription.__r_.__value_.var0.__l + 23) < 0)
    operator delete(v25.mDescription.__r_.__value_.var0.__l.__data_);
  if (v25.mSubsessionRef.mCFObject)
    CFRelease(v25.mSubsessionRef.mCFObject);
  v10 = objc_alloc_init(MEMORY[0x1E0CFF1E0]);
  objc_msgSend(v10, "setPrefersHeadTrackedSpatialization:", (_BYTE)v17 != 0);
  objc_msgSend(v10, "setPrefersLossyAudioSources:", BYTE1(v17) != 0);
  objc_msgSend(v10, "setAlwaysSpatialize:", BYTE2(v17) != 0);
  objc_msgSend(v10, "setMaximumSpatializableChannels:", v18);
  v11 = (void *)objc_opt_new();
  v12 = HIDWORD(v18);
  if (HIDWORD(v18))
  {
    v13 = (unsigned int *)&v19;
    do
    {
      v14 = *v13++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      --v12;
    }
    while (v12);
  }
  objc_msgSend(v10, "setSpatialAudioSources:", v11);

  return v10;
}

@end
