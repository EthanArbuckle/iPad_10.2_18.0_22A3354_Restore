@implementation AVBorealisServer

- (AVBorealisServer)init
{
  AVBorealisServer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *notificationQueue;
  NSObject *v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *clientConnections;
  uint64_t v10;
  NSXPCListener *serverListener;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  AVBorealisServer *v19;
  Class *v20;
  AVBorealisServerHysteresisNotifier *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  unsigned int *v26;
  void *v27;
  objc_class *v28;
  uint64_t v29;
  Class v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  Class v35;
  uint8_t *v36;
  objc_super v38;
  uint8_t v39[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint8_t *v44;
  uint8_t buf[80];
  char __path[88];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)AVBorealisServer;
  v2 = -[AVBorealisServer init](&v38, sel_init);
  if (!v2)
    return v2;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("BorealisManager.notification", v3);
  notificationQueue = v2->_notificationQueue;
  v2->_notificationQueue = (OS_dispatch_queue *)v4;

  v6 = v2->_notificationQueue;
  if (GetAudioWorkQueuePriority(void)::once != -1)
    dispatch_once(&GetAudioWorkQueuePriority(void)::once, &__block_literal_global_7090);
  GetCustomRootQueue(GetAudioWorkQueuePriority(void)::gAudioWorkQueuePriority);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v6, v7);

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  clientConnections = v2->_clientConnections;
  v2->_clientConnections = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.voicetrigger.xpc"));
  serverListener = v2->_serverListener;
  v2->_serverListener = (NSXPCListener *)v10;

  -[NSXPCListener setDelegate:](v2->_serverListener, "setDelegate:", v2);
  strcpy(__path, "/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices");
  v12 = dlopen(__path, 1);
  v2->_mobileAssistantDylib = v12;
  if (v12)
  {
    v13 = dlsym(v12, "AFSiriActivationBuiltInMicVoice");
    v2->_afSiriActivationBuiltInMicVoiceFuncPtr = v13;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1918;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v13;
        v14 = MEMORY[0x1E0C81028];
        v15 = "%25s:%-5d Successfully found address of AFSiriActivationBuiltInMicVoice in MAF: 0x%p";
        v16 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        v17 = 28;
LABEL_13:
        _os_log_impl(&dword_1A0F4D000, v14, v16, v15, buf, v17);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1915;
      v14 = MEMORY[0x1E0C81028];
      v15 = "%25s:%-5d Unable to find AFSiriActivationBuiltInMicVoice in MAF";
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 18;
      goto LABEL_13;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1922;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = __path;
    v14 = MEMORY[0x1E0C81028];
    v15 = "%25s:%-5d Unable to open %s";
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_10;
  }
  v18 = operator new();
  v19 = v2;
  *(_QWORD *)v18 = &off_1E4509538;
  *(_DWORD *)(v18 + 8) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 32) = 0;
  *(_DWORD *)(v18 + 40) = -1;
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 48) = "com.apple.audio.AOP.enable";
  *(_QWORD *)(v18 + 56) = "com.apple.audio.AOP.SiriPrefsAOPStateMismatch";
  *(_QWORD *)(v18 + 72) = 0;
  *(_DWORD *)(v18 + 64) = 0;
  *(_BYTE *)(v18 + 68) = 0;
  v20 = v19;
  *(_QWORD *)(v18 + 80) = v20;
  *(_DWORD *)(v18 + 88) = 0;
  *(_QWORD *)(v18 + 96) = *(_QWORD *)(*(_QWORD *)AQIONodeManager::systemMixEngine((AQIONodeManager *)v20) + 32);
  *(_QWORD *)(v18 + 104) = 0;
  *(_BYTE *)(v18 + 112) = 0;
  *(_DWORD *)(v18 + 116) = 0;
  *(_QWORD *)(v18 + 120) = 0;
  v21 = [AVBorealisServerHysteresisNotifier alloc];
  objc_msgSend(*(id *)(v18 + 80), "notificationQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVBorealisServerHysteresisNotifier initWithSerialQueue:](v21, "initWithSerialQueue:", v22);
  v24 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = v23;

  objc_msgSend(*(id *)(v18 + 80), "notificationQueue");
  v25 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN18BorealisServerImplC2EP16AVBorealisServer_block_invoke;
  *(_QWORD *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
  *(_QWORD *)&buf[32] = v18;
  dispatch_async(v25, buf);

  BorealisServerImpl::registerStateChangedNotificationHandlers((BorealisServerImpl *)v18, 1, v26);
  v27 = *(void **)(v18 + 72);
  *(_QWORD *)(v18 + 72) = 0;

  v20[1] = (Class)v18;
  (*(void (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
  -[NSXPCListener resume](v2->_serverListener, "resume");
  strcpy((char *)buf, "/System/Library/PrivateFrameworks/VoiceTrigger.framework/VoiceTrigger");
  v28 = (objc_class *)dlopen((const char *)buf, 1);
  v20[7] = v28;
  if (v28)
  {
    NSClassFromString(CFSTR("VTStateManager"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v20[8];
    v20[8] = (Class)v29;

    v31 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[Class hardwareSupportsVoiceTrigger](v20, "hardwareSupportsVoiceTrigger"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", v32, CFSTR("VoiceTriggerAvailable"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(objc_alloc(v20[8]), "initWithProperty:callbackWithMessageAndTimestamp:", v33, &__block_literal_global_408);
    v35 = v20[9];
    v20[9] = (Class)v34;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v36 = (uint8_t *)v20[9];
      *(_DWORD *)v39 = 136315650;
      v40 = "AVBorealisServer.mm";
      v41 = 1024;
      v42 = 1944;
      v43 = 2112;
      v44 = v36;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Allocated VTStateManager: %@", v39, 0x1Cu);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v39 = 136315650;
    v40 = "AVBorealisServer.mm";
    v41 = 1024;
    v42 = 1947;
    v43 = 2080;
    v44 = buf;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to open %s", v39, 0x1Cu);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v39 = 136315394;
    v40 = "AVBorealisServer.mm";
    v41 = 1024;
    v42 = 1951;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%25s:%-5d Voice Trigger Server listening", v39, 0x12u);
  }

  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *notificationQueue;
  BorealisServerImpl *serverImpl;
  NSMutableArray *clientConnections;
  objc_super v6;

  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = 0;

  serverImpl = self->serverImpl;
  if (serverImpl)
  {
    (*((void (**)(BorealisServerImpl *))serverImpl->var0 + 1))(serverImpl);
    self->serverImpl = 0;
  }
  clientConnections = self->_clientConnections;
  self->_clientConnections = 0;

  v6.receiver = self;
  v6.super_class = (Class)AVBorealisServer;
  -[AVBorealisServer dealloc](&v6, sel_dealloc);
}

- (void)initializeWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "AVBorealisServer.mm";
    v6 = 1024;
    v7 = 1972;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d Initialize Voice Trigger", (uint8_t *)&v4, 0x12u);
  }
  v3[2](v3, 0);

}

- (void)enableVoiceTriggerListening:(BOOL)a3 reply:(id)a4
{
  unsigned int v4;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  unsigned int v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "AVBorealisServer.mm";
    v9 = 1024;
    v10 = 1979;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableVoiceTriggerListening: %d", (uint8_t *)&v7, 0x18u);
  }
  BorealisServerImpl::enableVoiceTriggerListening(self->serverImpl, v4, 0, v6);

}

- (void)setListeningProperty:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, void *);
  unsigned int *v6;
  AudioObjectID SpeechDetectionDeviceID;
  OSStatus v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  os_log_type_t v12;
  uint32_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  AudioObjectPropertyAddress v17;
  _BOOL4 inData;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  AudioObjectID v26;
  __int16 v27;
  OSStatus v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "AVBorealisServer.mm";
    v21 = 1024;
    v22 = 1985;
    v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d setListeningProperty: %d", buf, 0x18u);
  }
  SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v6);
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    v17.mElement = 0;
    inData = v4;
    *(_QWORD *)&v17.mSelector = 0x676C6F626470656CLL;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, &v17))
    {
      v8 = AudioObjectSetPropertyData(SpeechDetectionDeviceID, &v17, 0, 0, 4u, &inData);
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v20 = "AVBorealisServer.mm";
          v22 = 1056;
          v9 = "Disable";
          v23 = 2080;
          *(_DWORD *)buf = 136316162;
          v21 = 1024;
          if (v4)
            v9 = "Enable";
          v24 = v9;
          v25 = 1024;
          v26 = SpeechDetectionDeviceID;
          v27 = 1024;
          v28 = v8;
          v10 = MEMORY[0x1E0C81028];
          v11 = "%25s:%-5d setListeningProperty failure to %s listening property on device %d [err2 (%d)]";
          v12 = OS_LOG_TYPE_ERROR;
          v13 = 40;
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v16 = "Disable";
        v20 = "AVBorealisServer.mm";
        v22 = 1053;
        v23 = 2080;
        *(_DWORD *)buf = 136315906;
        v21 = 1024;
        if (v4)
          v16 = "Enable";
        v24 = v16;
        v25 = 1024;
        v26 = SpeechDetectionDeviceID;
        v10 = MEMORY[0x1E0C81028];
        v11 = "%25s:%-5d setListeningProperty (%s) on device %d";
        v12 = OS_LOG_TYPE_DEFAULT;
        v13 = 34;
        goto LABEL_21;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v20 = "AVBorealisServer.mm";
      v21 = 1024;
      v22 = 1060;
      v23 = 1024;
      LODWORD(v24) = SpeechDetectionDeviceID;
      v10 = MEMORY[0x1E0C81028];
      v11 = "%25s:%-5d setListeningProperty device(%d) doesn't have property.";
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 24;
LABEL_21:
      _os_log_impl(&dword_1A0F4D000, v10, v12, v11, buf, v13);
    }
    os_unfair_recursive_lock_unlock();
    v15 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = "Disabling";
    v20 = "AVBorealisServer.mm";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v14 = "Enabling";
    v21 = 1024;
    v22 = 1064;
    v23 = 2080;
    v24 = v14;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d %s setListeningProperty - No valid audio device found", buf, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 560227702, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
  v5[2](v5, v15);

}

- (void)enableListeningOnPorts:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *notificationQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AVBorealisServer *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "AVBorealisServer.mm";
    v17 = 1024;
    v18 = 1996;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableListeningOnPorts: (%@)", buf, 0x1Cu);
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVBorealisServer_enableListeningOnPorts_reply___block_invoke;
  block[3] = &unk_1E4509440;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(notificationQueue, block);

}

- (void)portsActiveReply:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AVBorealisServer_portsActiveReply___block_invoke;
  v7[3] = &unk_1E4509778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

- (void)enableSpeakerStateListening:(BOOL)a3 reply:(id)a4
{
  id v6;
  NSObject *notificationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVBorealisServer_enableSpeakerStateListening_reply___block_invoke;
  block[3] = &unk_1E4509468;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(notificationQueue, block);

}

- (void)speakerStateActiveReply:(id)a3
{
  id v4;
  NSObject *notificationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__AVBorealisServer_speakerStateActiveReply___block_invoke;
  v7[3] = &unk_1E4509778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(notificationQueue, v7);

}

- (void)speakerStateMutedReply:(id)a3
{
  id v4;
  BorealisServerImpl *serverImpl;
  id v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  void *v10;
  id v11;
  BorealisServerImpl *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)&v9[4] = "AVBorealisServer.mm";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 2059;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerMuted", v9, 0x12u);
  }
  serverImpl = self->serverImpl;
  v6 = v4;
  objc_msgSend(serverImpl->var14, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v9 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v9[8] = 3221225472;
  *(_QWORD *)&v9[16] = ___ZN18BorealisServerImpl12speakerMutedEU13block_pointerFvbP7NSErrorE_block_invoke;
  v10 = &unk_1E450C5F8;
  v11 = v6;
  v12 = serverImpl;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)updateVoiceTriggerConfiguration:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  BorealisServerImpl *serverImpl;
  void (**v10)(id, void *);
  unsigned int *v11;
  AudioObjectID SpeechDetectionDeviceID;
  void *v13;
  CAListenerProxy **v14;
  _QWORD *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  OSStatus v25;
  void *v26;
  AudioObjectPropertyAddress inAddress;
  id inData;
  uint8_t v29[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  OSStatus v34;
  __int16 v35;
  AudioObjectID v36;
  _BYTE v37[24];
  _BYTE *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint8_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "AVBorealisServer.mm";
    v41 = 1024;
    v42 = 2065;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d updateVoiceTriggerConfiguration", buf, 0x12u);
  }
  if (!isHACProduct())
  {
    if (!v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "AVBorealisServer.mm";
        v41 = 1024;
        v42 = 2078;
        _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d First pass configuration data is nil", buf, 0x12u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v8);
      goto LABEL_15;
    }
    serverImpl = self->serverImpl;
    inData = v6;
    v10 = v7;
    SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v11);
    inAddress.mElement = 0;
    *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"ctvabolg";
    if (!SpeechDetectionDeviceID)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "AVBorealisServer.mm";
        v41 = 1024;
        v42 = 1222;
        _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Updating voice trigger configuration - No valid audio device found", buf, 0x12u);
      }
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 560227702, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, v19);

      }
      goto LABEL_33;
    }
    os_unfair_recursive_lock_lock_with_options();
    v13 = (void *)objc_msgSend(v10, "copy");
    v14 = (CAListenerProxy **)operator new();
    v15 = (_QWORD *)AQIONodeManager::systemMixEngine((AQIONodeManager *)v14);
    v16 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v15 + 16))(*v15);
    v43 = 0;
    CAListenerProxy::HALListener::HALListener((uint64_t)v14, v16, SpeechDetectionDeviceID, 1u, &inAddress, (uint64_t)buf);
    v17 = v43;
    if (v43 == buf)
    {
      v18 = 4;
      v17 = buf;
    }
    else
    {
      if (!v43)
        goto LABEL_22;
      v18 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_22:
    v20 = _Block_copy(v13);
    v38 = 0;
    v21 = (char *)operator new(0x20uLL);
    *(_QWORD *)&v22 = serverImpl;
    *((_QWORD *)&v22 + 1) = v20;
    *(_QWORD *)v21 = &off_1E4509738;
    *(_OWORD *)(v21 + 8) = v22;
    *((_QWORD *)v21 + 3) = v14;
    v38 = v21;
    CAListenerProxy::HALListener::SetListenerProc((CAListenerProxy::HALListener *)v14, (uint64_t)v37);
    v23 = v38;
    if (v38 == v37)
    {
      v24 = 4;
      v23 = v37;
    }
    else
    {
      if (!v38)
      {
LABEL_27:
        v25 = AudioObjectSetPropertyData(SpeechDetectionDeviceID, &inAddress, 0, 0, 8u, &inData);
        if (v25)
        {
          CAListenerProxy::remove(v14[1], (CAListenerProxy::Listener *)v14);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v29 = 136315906;
            v30 = "AVBorealisServer.mm";
            v31 = 1024;
            v32 = 1213;
            v33 = 1024;
            v34 = v25;
            v35 = 1024;
            v36 = SpeechDetectionDeviceID;
            _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d First pass model update returned error : %d on device %d", v29, 0x1Eu);
          }
          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v25, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v10[2](v10, v26);

          }
        }

        os_unfair_recursive_lock_unlock();
LABEL_33:

        goto LABEL_34;
      }
      v24 = 5;
    }
    (*(void (**)(void))(*v23 + 8 * v24))();
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "AVBorealisServer.mm";
    v41 = 1024;
    v42 = 2069;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Configuration of AOP via AVVTC unsupported on this product", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 1852797029, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);
LABEL_15:

LABEL_34:
}

- (void)enableBargeInMode:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "AVBorealisServer.mm";
    v9 = 1024;
    v10 = 2090;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d enableBargeInMode", (uint8_t *)&v7, 0x12u);
  }
  BorealisServerImpl::enableBargeInMode((uint64_t)self->serverImpl, v4, v6);

}

- (void)voiceTriggerPastDataFramesAvailable:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  BorealisServerImpl *serverImpl;
  unsigned int *v6;
  AudioObjectID SpeechDetectionDeviceID;
  OSStatus PropertyData;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  unsigned int outData;
  UInt32 ioDataSize[4];
  AudioObjectPropertyAddress inAddress;
  __int16 v15;
  int v16;
  __int16 v17;
  UInt32 *v18;
  __int16 v19;
  AudioObjectID v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  outData = 0;
  serverImpl = self->serverImpl;
  SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v6);
  if (!SpeechDetectionDeviceID)
    goto LABEL_13;
  os_unfair_recursive_lock_lock_with_options();
  if (!serverImpl->var10
    || (*(_QWORD *)&inAddress.mSelector = 0x676C6F6264617064,
        inAddress.mElement = 0,
        !AudioObjectHasProperty(SpeechDetectionDeviceID, &inAddress)))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      inAddress.mSelector = 136315394;
      *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
      v15 = 1024;
      v16 = 1519;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d Property not supported or hardware doesn't support voice trigger", (uint8_t *)&inAddress, 0x12u);
    }
    goto LABEL_12;
  }
  *(_QWORD *)&inAddress.mSelector = 0x676C6F6264617064;
  inAddress.mElement = 0;
  ioDataSize[0] = 4;
  PropertyData = AudioObjectGetPropertyData(SpeechDetectionDeviceID, &inAddress, 0, 0, ioDataSize, &outData);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    inAddress.mSelector = 136315650;
    *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
    v15 = 1024;
    v16 = 1513;
    v17 = 1024;
    LODWORD(v18) = outData;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d PastData available : %u", (uint8_t *)&inAddress, 0x18u);
  }
  if (!PropertyData)
  {
LABEL_12:
    os_unfair_recursive_lock_unlock();
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)ioDataSize, PropertyData);
    inAddress.mSelector = 136315906;
    *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
    v15 = 1024;
    v16 = 1515;
    v17 = 2080;
    v18 = ioDataSize;
    v19 = 1024;
    v20 = SpeechDetectionDeviceID;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error %s fetching past data available frames on device 0x%x", (uint8_t *)&inAddress, 0x22u);
  }
  os_unfair_recursive_lock_unlock();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], PropertyData, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  v11 = outData;
  if (v10)
  {
    inAddress.mSelector = 136315650;
    *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
    v15 = 1024;
    v16 = 2104;
    v17 = 1024;
    LODWORD(v18) = outData;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d past frames %u", (uint8_t *)&inAddress, 0x18u);
    v11 = outData;
  }
  v4[2](v4, v11, v9);

}

- (void)getInputChannelInfoCompletion:(id)a3
{
  void (**v3)(id, void *, void *);
  unsigned int *v4;
  AudioObjectID SpeechDetectionDeviceID;
  uint64_t v6;
  signed int v7;
  uint64_t v8;
  AudioObjectID v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  unsigned int v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[16];
  AudioObjectPropertyAddress inAddress;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE *v30;
  __int16 v31;
  AudioObjectID v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, void *))a3;
  v22 = 0;
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    v6 = 0;
    v10 = 0;
    v17 = 0;
    v8 = 1;
    goto LABEL_19;
  }
  SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(0, &v22, v4);
  v6 = 0;
  v7 = v22;
  v8 = 1;
  if (v22)
  {
    v10 = 0;
  }
  else
  {
    v9 = SpeechDetectionDeviceID;
    v10 = 0;
    if (SpeechDetectionDeviceID)
    {
      os_unfair_recursive_lock_lock_with_options();
      *(_QWORD *)&inAddress.mSelector = 0x676C6F6273647370;
      inAddress.mElement = 0;
      if (AudioObjectHasProperty(v9, &inAddress))
      {
        BorealisServerImpl::getDictionaryForPropertySelector(0x73647370u, 0, &v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = v22;
        if (v22 || !v11)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            CAX4CCString::CAX4CCString((CAX4CCString *)v25, v13);
            inAddress.mSelector = 136316162;
            *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
            v27 = 1024;
            v28 = 1543;
            v29 = 2080;
            v30 = v25;
            v31 = 1024;
            v32 = v9;
            v33 = 2112;
            v34 = v12;
            _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Error %s fetching barge-in param dict on device 0x%x. Dict(%@)", (uint8_t *)&inAddress, 0x2Cu);
            v6 = 0;
            v10 = 0;
            v8 = 1;
          }
          else
          {
            v6 = 0;
            v10 = 0;
          }
        }
        else
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DSP channels"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v14, "unsignedIntValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mics"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v15, "unsignedIntValue");

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("refs"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v16, "unsignedIntValue");

        }
      }
      else
      {
        v6 = 0;
        v10 = 0;
      }
      os_unfair_recursive_lock_unlock();
      v7 = v22;
      if (!v22)
        goto LABEL_18;
LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  if (v22)
    goto LABEL_11;
LABEL_18:
  v17 = 0;
LABEL_19:
  v23[0] = CFSTR("dsp-count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = CFSTR("mic-count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v19;
  v23[2] = CFSTR("speaker-ref-count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    inAddress.mSelector = 136315650;
    *(_QWORD *)&inAddress.mScope = "AVBorealisServer.mm";
    v27 = 1024;
    v28 = 2121;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d getInputChannelInfoCompletion: %@", (uint8_t *)&inAddress, 0x1Cu);
  }
  v3[2](v3, v21, v17);

}

- (void)listeningEnabledReply:(id)a3
{
  id v4;
  BorealisServerImpl *serverImpl;
  id v6;
  unsigned int *v7;
  AudioObjectID SpeechDetectionDeviceID;
  OSStatus PropertyData;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  NSObject *v13;
  id v14;
  int outData;
  _BYTE buf[40];
  int v17;
  OSStatus v18;
  UInt32 ioDataSize[4];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2127;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled", buf, 0x12u);
  }
  serverImpl = self->serverImpl;
  v6 = v4;
  outData = 0;
  SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v7);
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    strcpy(buf, "lepdbolg");
    buf[9] = 0;
    *(_WORD *)&buf[10] = 0;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, (const AudioObjectPropertyAddress *)buf))
    {
      strcpy(buf, "lepdbolg");
      buf[9] = 0;
      *(_WORD *)&buf[10] = 0;
      ioDataSize[0] = 4;
      PropertyData = AudioObjectGetPropertyData(SpeechDetectionDeviceID, (const AudioObjectPropertyAddress *)buf, 0, 0, ioDataSize, &outData);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1248;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = outData;
        _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled : %u", buf, 0x18u);
      }
      if (!PropertyData || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      CAX4CCString::CAX4CCString((CAX4CCString *)ioDataSize, PropertyData);
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1250;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = ioDataSize;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SpeechDetectionDeviceID;
      v10 = MEMORY[0x1E0C81028];
      v11 = "%25s:%-5d Error %s querying listeningEnabled on device 0x%x";
      v12 = 34;
    }
    else
    {
      PropertyData = 2003332927;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_15:
        os_unfair_recursive_lock_unlock();
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1254;
      v10 = MEMORY[0x1E0C81028];
      v11 = "%25s:%-5d Property not supported";
      v12 = 18;
    }
    _os_log_impl(&dword_1A0F4D000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
    goto LABEL_15;
  }
  PropertyData = 560227702;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVBorealisServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1259;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d speech detection device not found!", buf, 0x12u);
  }
LABEL_16:
  objc_msgSend(serverImpl->var14, "notificationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = ___ZN18BorealisServerImpl21listeningEnabledReplyEU13block_pointerFvbP7NSErrorE_block_invoke;
  *(_QWORD *)&buf[24] = &unk_1E450C5F8;
  *(_QWORD *)&buf[32] = v6;
  v17 = outData;
  v18 = PropertyData;
  v14 = v6;
  dispatch_async(v13, buf);

}

- (void)siriClientsRecordingReply:(id)a3
{
  id v4;
  BorealisServerImpl *serverImpl;
  id v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  void *v10;
  id v11;
  BorealisServerImpl *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)&v9[4] = "AVBorealisServer.mm";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 2133;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d siriClientsRecording", v9, 0x12u);
  }
  serverImpl = self->serverImpl;
  v6 = v4;
  objc_msgSend(serverImpl->var14, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v9 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v9[8] = 3221225472;
  *(_QWORD *)&v9[16] = ___ZN18BorealisServerImpl25siriClientsRecordingReplyEU13block_pointerFvmP7NSErrorE_block_invoke;
  v10 = &unk_1E450C5F8;
  v11 = v6;
  v12 = serverImpl;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (void)setAggressiveECMode:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, void *);
  unsigned int *v6;
  OSStatus PropertyData;
  uint8x8_t v8;
  int16x8_t v9;
  AudioObjectID SpeechDetectionDeviceID;
  float v11;
  OSStatus v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  AudioObjectID *p_inObjectID;
  AudioObjectPropertyAddress *v22;
  AudioObjectPropertyAddress *v23;
  int v24;
  AudioObjectPropertyAddress v25;
  AudioObjectPropertyAddress inAddress;
  AudioObjectID inObjectID;
  UInt32 ioDataSize;
  int outData;
  __int32 inQualifierData;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  AudioObjectPropertyAddress *p_inAddress;
  __int16 v37;
  AudioObjectID v38;
  __int16 v39;
  OSStatus v40;
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "AVBorealisServer.mm";
    v33 = 1024;
    v34 = 2139;
    v35 = 1024;
    LODWORD(p_inAddress) = v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAggressiveECMode: %d", buf, 0x18u);
  }
  if (isHACProduct())
  {
    outData = 0;
    inQualifierData = 1936290409;
    ioDataSize = 4;
    p_inObjectID = *(AudioObjectID **)"diuibolg";
    LODWORD(v22) = 0;
    PropertyData = AudioObjectGetPropertyData(1u, (const AudioObjectPropertyAddress *)&p_inObjectID, 4u, &inQualifierData, &ioDataSize, &outData);
    v8.i32[0] = inQualifierData;
    v9 = (int16x8_t)vmovl_u8(v8);
    *(int16x4_t *)v9.i8 = vrev64_s16(*(int16x4_t *)v9.i8);
    inAddress.mSelector = vmovn_s16(v9).u32[0];
    LOBYTE(inAddress.mScope) = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v32 = "AVBorealisServer.mm";
      v33 = 1024;
      v34 = 1833;
      v35 = 2080;
      p_inAddress = &inAddress;
      v37 = 1024;
      v38 = outData;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d useCaseID: %s, deviceID: %d", buf, 0x22u);
    }
    if (PropertyData)
    {
      LOBYTE(v25.mSelector) = HIBYTE(PropertyData);
      BYTE1(v25.mSelector) = BYTE2(PropertyData);
      BYTE2(v25.mSelector) = BYTE1(PropertyData);
      HIBYTE(v25.mSelector) = PropertyData;
      LOBYTE(v25.mScope) = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "AVBorealisServer.mm";
        v33 = 1024;
        v34 = 1837;
        v35 = 2080;
        p_inAddress = &v25;
        _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Could not get deviceID error: %s ", buf, 0x1Cu);
      }
    }
    SpeechDetectionDeviceID = outData;
  }
  else
  {
    SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(0, 0, v6);
  }
  inObjectID = SpeechDetectionDeviceID;
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    *(_QWORD *)&inAddress.mSelector = 0x696E70746467706DLL;
    inAddress.mElement = 0;
    *(_QWORD *)&v25.mSelector = 0x696E70746467686DLL;
    v25.mElement = 0;
    outData = 1987339878;
    p_inObjectID = &inObjectID;
    v22 = &inAddress;
    v23 = &v25;
    v24 = 1987339878;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, &inAddress)
      && AudioObjectHasProperty(inObjectID, &v25)
      && (inQualifierData = 0,
          *(_DWORD *)buf = 4,
          !AudioObjectGetPropertyData(inObjectID, &v25, 4u, &v24, (UInt32 *)buf, &inQualifierData))
      && inQualifierData)
    {
      v11 = 0.0;
      if (v4)
        v11 = 1.0;
      inQualifierData = LODWORD(v11);
      v12 = AudioObjectSetPropertyData(inObjectID, &inAddress, 4u, &outData, 4u, &inQualifierData);
      if (!v12)
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        v20 = "Disable";
        v32 = "AVBorealisServer.mm";
        *(_DWORD *)buf = 136315906;
        v33 = 1024;
        if (v4)
          v20 = "Enable";
        v34 = 1656;
        v35 = 2080;
        p_inAddress = (AudioObjectPropertyAddress *)v20;
        v37 = 1024;
        v38 = inObjectID;
        v14 = MEMORY[0x1E0C81028];
        v15 = "%25s:%-5d setAggressiveECMode (%s) on device %d";
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 34;
        goto LABEL_25;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = "Disable";
        v32 = "AVBorealisServer.mm";
        *(_DWORD *)buf = 136316162;
        v33 = 1024;
        if (v4)
          v13 = "Enable";
        v34 = 1659;
        v35 = 2080;
        p_inAddress = (AudioObjectPropertyAddress *)v13;
        v37 = 1024;
        v38 = inObjectID;
        v39 = 1024;
        v40 = v12;
        v14 = MEMORY[0x1E0C81028];
        v15 = "%25s:%-5d setAggressiveECMode failure to %s listening property on device %d [err2 (%d)]";
        v16 = OS_LOG_TYPE_ERROR;
        v17 = 40;
        goto LABEL_25;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v32 = "AVBorealisServer.mm";
      v33 = 1024;
      v34 = 1663;
      v35 = 1024;
      LODWORD(p_inAddress) = inObjectID;
      v14 = MEMORY[0x1E0C81028];
      v15 = "%25s:%-5d setAggressiveECMode device(%d) doesn't have property.";
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 24;
LABEL_25:
      _os_log_impl(&dword_1A0F4D000, v14, v16, v15, buf, v17);
    }
LABEL_26:
    os_unfair_recursive_lock_unlock();
    v18 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = "Disabling";
    v32 = "AVBorealisServer.mm";
    *(_DWORD *)buf = 136315650;
    if (v4)
      v19 = "Enabling";
    v33 = 1024;
    v34 = 1667;
    v35 = 2080;
    p_inAddress = (AudioObjectPropertyAddress *)v19;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d %s setAggressiveECMode - No valid audio device found", buf, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 560227702, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
  v5[2](v5, v18);

}

- (void)activateSecureSession:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  id v6;
  BorealisServerImpl *serverImpl;
  id v8;
  NSObject *v9;
  void *v10;
  _BYTE v11[24];
  void *v12;
  id v13;
  BorealisServerImpl *v14;
  BOOL v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v11 = 136315650;
    *(_QWORD *)&v11[4] = "AVBorealisServer.mm";
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = 2150;
    *(_WORD *)&v11[18] = 1024;
    *(_DWORD *)&v11[20] = v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d activateSecureSession: %d", v11, 0x18u);
  }
  serverImpl = self->serverImpl;
  v8 = v6;
  if (isHACProduct())
  {
    objc_msgSend(serverImpl->var14, "notificationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v11 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v11[8] = 3221225472;
    *(_QWORD *)&v11[16] = ___ZN18BorealisServerImpl21activateSecureSessionEbU13block_pointerFvP7NSErrorE_block_invoke;
    v12 = &unk_1E45097A0;
    v14 = serverImpl;
    v15 = v4;
    v13 = v8;
    dispatch_async(v9, v11);

    v10 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136315394;
      *(_QWORD *)&v11[4] = "AVBorealisServer.mm";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 1696;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d Session activation/deactivation unsupported", v11, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 1852797029, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v10);
  }

}

- (void)sendVoiceTriggerOccuredNotification:(id)a3 triggerTime:(unint64_t)a4
{
  id v6;
  void (*afSiriActivationBuiltInMicVoiceFuncPtr)(unint64_t, id, _QWORD *);
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  void *v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  unint64_t v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "AVBorealisServer.mm";
    v33 = 1024;
    v34 = 2156;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending voice trigger notification with trigger dictionary %@", buf, 0x1Cu);
  }
  afSiriActivationBuiltInMicVoiceFuncPtr = (void (*)(unint64_t, id, _QWORD *))self->_afSiriActivationBuiltInMicVoiceFuncPtr;
  if (afSiriActivationBuiltInMicVoiceFuncPtr)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __68__AVBorealisServer_sendVoiceTriggerOccuredNotification_triggerTime___block_invoke;
    v27[3] = &unk_1E4509490;
    v28 = v6;
    v29 = a4;
    afSiriActivationBuiltInMicVoiceFuncPtr(a4, v28, v27);

  }
  -[AVBorealisServer clientConnections](self, "clientConnections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") == 0;

  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "AVBorealisServer.mm";
      v33 = 1024;
      v34 = 2186;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[AVBorealisServer clientConnections](self, "clientConnections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v11)
    {
      v13 = *(_QWORD *)v24;
      v14 = MEMORY[0x1E0C81028];
      *(_QWORD *)&v12 = 136315650;
      v22 = v12;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "remoteObjectProxy", v22);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (v18)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v21 = objc_msgSend(v16, "processIdentifier");
              *(_DWORD *)buf = v22;
              v32 = "AVBorealisServer.mm";
              v33 = 1024;
              v34 = 2181;
              v35 = 1024;
              LODWORD(v36) = v21;
              _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v19 = objc_msgSend(v16, "processIdentifier");
              *(_DWORD *)buf = v22;
              v32 = "AVBorealisServer.mm";
              v33 = 1024;
              v34 = 2177;
              v35 = 1024;
              LODWORD(v36) = v19;
              _os_log_impl(&dword_1A0F4D000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sendVoiceTriggerOccuredNotification for client PID (%d)", buf, 0x18u);
            }
            objc_msgSend(v16, "remoteObjectProxy");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "voiceTriggerNotification:", v6);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v11);
    }

  }
}

- (void)sendActiveStateChangedNotificationForPort:(unint64_t)a3 isActive:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  BorealisServerImpl::getCachedPortStateInfo(self->serverImpl);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v31 = "AVBorealisServer.mm";
    v32 = 1024;
    v33 = 2193;
    v34 = 2048;
    v35 = v7;
    v36 = 2048;
    v37 = 8;
    v38 = 2112;
    v39 = v7;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d cached port info %p count: %lu %@", buf, 0x30u);
  }
  v8 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("active"), v10, CFSTR("currentPort"), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v31 = "AVBorealisServer.mm";
    v32 = 1024;
    v33 = 2196;
    v34 = 2048;
    v35 = v24;
    v36 = 2112;
    v37 = (uint64_t)v24;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending speaker state changed notification with dictionary (%p) %@", buf, 0x26u);
  }
  -[AVBorealisServer clientConnections](self, "clientConnections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") == 0;

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "AVBorealisServer.mm";
      v32 = 1024;
      v33 = 2213;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[AVBorealisServer clientConnections](self, "clientConnections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v26;
      v16 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v18, "remoteObjectProxy");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v23 = objc_msgSend(v18, "processIdentifier");
              *(_DWORD *)buf = 136315650;
              v31 = "AVBorealisServer.mm";
              v32 = 1024;
              v33 = 2209;
              v34 = 1024;
              LODWORD(v35) = v23;
              _os_log_impl(&dword_1A0F4D000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            if (a3 == 1)
            {
              objc_msgSend(v18, "remoteObjectProxy");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "speakerStateChangedNotification:", v24);

            }
            objc_msgSend(v18, "remoteObjectProxy");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "portStateChangedNotification:", v7);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

  }
}

- (void)sendSpeakerMuteStateChangedNotification:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "AVBorealisServer.mm";
    v26 = 1024;
    v27 = 2219;
    v28 = 1024;
    v29 = v3;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending speaker mute state changed notification. isMuted: %d", buf, 0x18u);
  }
  -[AVBorealisServer clientConnections](self, "clientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") == 0;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "AVBorealisServer.mm";
      v26 = 1024;
      v27 = 2231;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[AVBorealisServer clientConnections](self, "clientConnections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v20;
      v11 = MEMORY[0x1E0C81028];
      *(_QWORD *)&v9 = 136315650;
      v18 = v9;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v13, "remoteObjectProxy", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v17 = objc_msgSend(v13, "processIdentifier");
              *(_DWORD *)buf = v18;
              v25 = "AVBorealisServer.mm";
              v26 = 1024;
              v27 = 2227;
              v28 = 1024;
              v29 = v17;
              _os_log_impl(&dword_1A0F4D000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            objc_msgSend(v13, "remoteObjectProxy");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "speakerMuteStateChangedNotification:", v3);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)heySiriEnabled
{
  BorealisServerImpl *serverImpl;
  BOOL v3;

  serverImpl = self->serverImpl;
  os_unfair_recursive_lock_lock_with_options();
  v3 = serverImpl->var12 && serverImpl->var11;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)speechDetectionVADCreated
{
  BorealisServerImpl *serverImpl;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  serverImpl = self->serverImpl;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "AVBorealisServer.mm";
    v5 = 1024;
    v6 = 1574;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d speechDetectionVADCreated()", (uint8_t *)&v3, 0x12u);
  }
  os_unfair_recursive_lock_lock_with_options();
  if (serverImpl->var10 && serverImpl->var12 && serverImpl->var11)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = 136315394;
      v4 = "AVBorealisServer.mm";
      v5 = 1024;
      v6 = 1581;
      _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d attempt to force enable AOP voice trigger", (uint8_t *)&v3, 0x12u);
    }
    BorealisServerImpl::enableVoiceTriggerListening(serverImpl, 1u, 1, &__block_literal_global_335);
    notify_post("com.apple.coreaudio.speechDetectionVAD.created");
  }
  os_unfair_recursive_lock_unlock();
}

- (void)siriClientRecordStateChanged:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[AVBorealisServer notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AVBorealisServer_siriClientRecordStateChanged___block_invoke;
  v6[3] = &unk_1E45094B8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (BOOL)hardwareSupportsVoiceTrigger
{
  return self->serverImpl->var10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *notificationQueue;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  AVBorealisServer *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v29 = "AVBorealisServer.mm";
    v30 = 1024;
    v31 = 2275;
    v32 = 2112;
    v33 = v7;
    v34 = 1024;
    v35 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d newConnection: %@ from PID: %d", buf, 0x22u);
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5EF3E8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5F4938);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_1E4509508;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v23);
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v20[3] = &unk_1E4509508;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v20);
  notificationQueue = self->_notificationQueue;
  v14 = v10;
  v15 = 3221225472;
  v16 = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2_169;
  v17 = &unk_1E45094E0;
  v12 = v7;
  v18 = v12;
  v19 = self;
  dispatch_async(notificationQueue, &v14);
  objc_msgSend(v12, "resume", v14, v15, v16, v17);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "AVBorealisServer.mm";
    v30 = 1024;
    v31 = 2328;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%25s:%-5d Done", buf, 0x12u);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

- (NSXPCListener)serverListener
{
  return self->_serverListener;
}

- (void)setServerListener:(id)a3
{
  objc_storeStrong((id *)&self->_serverListener, a3);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void)mobileAssistantDylib
{
  return self->_mobileAssistantDylib;
}

- (void)setMobileAssistantDylib:(void *)a3
{
  self->_mobileAssistantDylib = a3;
}

- (void)afSiriActivationBuiltInMicVoiceFuncPtr
{
  return self->_afSiriActivationBuiltInMicVoiceFuncPtr;
}

- (void)setAfSiriActivationBuiltInMicVoiceFuncPtr:(void *)a3
{
  self->_afSiriActivationBuiltInMicVoiceFuncPtr = a3;
}

- (void)voiceTriggerDylib
{
  return self->_voiceTriggerDylib;
}

- (void)setVoiceTriggerDylib:(void *)a3
{
  self->_voiceTriggerDylib = a3;
}

- (Class)clsVTStateManager
{
  return self->_clsVTStateManager;
}

- (void)setClsVTStateManager:(Class)a3
{
  objc_storeStrong((id *)&self->_clsVTStateManager, a3);
}

- (VTStateManager)vtStateManager
{
  return self->_vtStateManager;
}

- (void)setVtStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_vtStateManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtStateManager, 0);
  objc_storeStrong((id *)&self->_clsVTStateManager, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_serverListener, 0);
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v11 = "AVBorealisServer.mm";
    v12 = 1024;
    v13 = 2287;
    v14 = 2112;
    v15 = v2;
    v16 = 1024;
    v17 = objc_msgSend(v2, "processIdentifier");
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption Handler: %@, client PID: %d)", buf, 0x22u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v4;
  if (WeakRetained && v4)
  {
    objc_msgSend(WeakRetained, "notificationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_167;
    v7[3] = &unk_1E45094E0;
    v8 = v5;
    v9 = WeakRetained;
    dispatch_async(v6, v7);

  }
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  _BOOL4 v11;
  id v12;
  int v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    v18 = "AVBorealisServer.mm";
    v19 = 1024;
    v20 = 2298;
    v21 = 2112;
    v22 = v2;
    v23 = 1024;
    v24 = objc_msgSend(v2, "processIdentifier");
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidation Handler: %@, client PID: %d exited", buf, 0x22u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = (id *)(a1 + 32);
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained[1];
  v7 = *(id *)(v6 + 72);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "processIdentifier");
    v10 = objc_loadWeakRetained(v4);
    v11 = v9 == objc_msgSend(v10, "processIdentifier");

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_loadWeakRetained(v4);
        v13 = objc_msgSend(v12, "processIdentifier");
        *(_DWORD *)buf = 136315650;
        v18 = "AVBorealisServer.mm";
        v19 = 1024;
        v20 = 2304;
        v21 = 1024;
        LODWORD(v22) = v13;
        _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling Barge-In since PID: %d exited.", buf, 0x18u);

      }
      BorealisServerImpl::enableBargeInMode(v6, 0, 0);
    }
  }
  if (v5)
  {
    objc_msgSend(WeakRetained, "notificationQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_168;
    v15[3] = &unk_1E45094E0;
    v15[4] = WeakRetained;
    v16 = v5;
    dispatch_async(v14, v15);

  }
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2_169(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "processIdentifier");
    *(_DWORD *)buf = 136315650;
    v16 = "AVBorealisServer.mm";
    v17 = 1024;
    v18 = 2317;
    v19 = 1024;
    v20 = v2;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d Adding connection for client PID (%d)", buf, 0x18u);
  }
  objc_msgSend(*(id *)(a1 + 40), "clientConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "AVBorealisServer.mm";
    v17 = 1024;
    v18 = 2320;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d Client connections dump:", buf, 0x12u);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "clientConnections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v10 = objc_msgSend(v9, "processIdentifier");
          *(_DWORD *)buf = 136315906;
          v16 = "AVBorealisServer.mm";
          v17 = 1024;
          v18 = 2322;
          v19 = 1024;
          v20 = v10;
          v21 = 2112;
          v22 = v9;
          _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d \tFor client PID (%d): %@", buf, 0x22u);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v23, 16);
    }
    while (v5);
  }

}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_168(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_167(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "clientConnections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __49__AVBorealisServer_siriClientRecordStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_DWORD *)(v2 + 116);
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = v3 + 1;
LABEL_5:
    *(_DWORD *)(v2 + 116) = v4;
    goto LABEL_6;
  }
  if (v3)
  {
    v4 = v3 - 1;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "AVBorealisServer.mm";
    v28 = 1024;
    v29 = 1609;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d mNumRecordingSiriClients trying to go negative", buf, 0x12u);
    v4 = *(_DWORD *)(v2 + 116);
  }
  else
  {
    v4 = 0;
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVBorealisServer.mm";
    v28 = 1024;
    v29 = 1612;
    v30 = 1024;
    v31 = v4;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d recording siri clients %d", buf, 0x18u);
    v4 = *(_DWORD *)(v2 + 116);
  }
  v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVBorealisServer.mm";
    v28 = 1024;
    v29 = 1590;
    v30 = 1024;
    v31 = v4 != 0;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %d", buf, 0x18u);
    v5 = *(_DWORD *)(v2 + 116);
  }
  *(_BYTE *)(v2 + 64) = v4 != 0;
  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "clientConnections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v11 = v5;
      v12 = *(_QWORD *)v22;
      v13 = MEMORY[0x1E0C81028];
      *(_QWORD *)&v10 = 136315650;
      v20 = v10;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "remoteObjectProxy", v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16 == 0;

          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v19 = objc_msgSend(v15, "processIdentifier");
              *(_DWORD *)buf = v20;
              v27 = "AVBorealisServer.mm";
              v28 = 1024;
              v29 = 2256;
              v30 = 1024;
              v31 = v19;
              _os_log_impl(&dword_1A0F4D000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            objc_msgSend(v15, "remoteObjectProxy");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "siriClientRecordStateChangedNotification:recordingCount:", *(unsigned __int8 *)(a1 + 40), v11);

          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "AVBorealisServer.mm";
    v28 = 1024;
    v29 = 2260;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
  }
}

void __68__AVBorealisServer_sendVoiceTriggerOccuredNotification_triggerTime___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BYTE v17[14];
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 136316162;
      v13 = "AVBorealisServer.mm";
      v14 = 1024;
      v15 = 2164;
      v16 = 1024;
      *(_DWORD *)v17 = a2;
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v5;
      v18 = 2112;
      v19 = v11;
      v7 = MEMORY[0x1E0C81028];
      v8 = "%25s:%-5d failed to send voicetrigger MAF. success(%d), err(%@). %@";
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 44;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v12 = 136315650;
    v13 = "AVBorealisServer.mm";
    v14 = 1024;
    v15 = 2167;
    v16 = 2048;
    *(_QWORD *)v17 = v6;
    v7 = MEMORY[0x1E0C81028];
    v8 = "%25s:%-5d voicetrigger sent to MAF. triggerTime(%lld)";
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 28;
LABEL_7:
    _os_log_impl(&dword_1A0F4D000, v7, v9, v8, (uint8_t *)&v12, v10);
  }

}

void __44__AVBorealisServer_speakerStateActiveReply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v5;
  _BYTE v6[24];
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)&v6[4] = "AVBorealisServer.mm";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 2052;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateActive", v6, 0x12u);
  }
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(v2 + 80), "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v6 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v6[8] = 3221225472;
  *(_QWORD *)&v6[16] = ___ZN18BorealisServerImpl12isPortActiveEmU13block_pointerFvbP7NSErrorE_block_invoke;
  v7 = &unk_1E4509708;
  v9 = v2;
  v10 = 1;
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __54__AVBorealisServer_enableSpeakerStateListening_reply___block_invoke(uint64_t a1)
{
  int v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(unsigned __int8 *)(a1 + 48);
    v4 = 136315650;
    v5 = "AVBorealisServer.mm";
    v6 = 1024;
    v7 = 2039;
    v8 = 1024;
    v9 = v2;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableSpeakerStateListening %d", (uint8_t *)&v4, 0x18u);
  }
  BorealisServerImpl::enableListeningOnPort(*(BorealisServerImpl **)(*(_QWORD *)(a1 + 32) + 8), 1, *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __37__AVBorealisServer_portsActiveReply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BorealisServerImpl::getCachedPortStateInfo(*(BorealisServerImpl **)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315906;
    v5 = "AVBorealisServer.mm";
    v6 = 1024;
    v7 = 2024;
    v8 = 2048;
    v9 = v2;
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%25s:%-5d portsActiveReply: (%p) (%@)", (uint8_t *)&v4, 0x26u);
  }
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __49__AVBorealisServer_enableListeningOnPorts_reply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (_QWORD)v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "BOOLValue");
        v9 = v6;
        if (v9)
        {
          if ((objc_msgSend(CFSTR("AVVoiceTriggerPort_BuiltinSpeaker"), "isEqualToString:", v9) & 1) != 0)
          {
            v10 = 1;
          }
          else if (objc_msgSend(CFSTR("AVVoiceTriggerPort_BluetoothSpeaker"), "isEqualToString:", v9))
          {
            v10 = 2;
          }
          else
          {
            v10 = 0;
          }
        }
        else
        {
          v10 = 0;
        }

        BorealisServerImpl::enableListeningOnPort(*(BorealisServerImpl **)(*(_QWORD *)(a1 + 40) + 8), v10, v8);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __24__AVBorealisServer_init__block_invoke(uint64_t a1, int a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315650;
    v4 = "AVBorealisServer.mm";
    v5 = 1024;
    v6 = 1941;
    v7 = 1024;
    v8 = a2;
    _os_log_impl(&dword_1A0F4D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%25s:%-5d VTStateManager callback message: %d (0-start,1-stop,2-modelupdate)", (uint8_t *)&v3, 0x18u);
  }
}

@end
