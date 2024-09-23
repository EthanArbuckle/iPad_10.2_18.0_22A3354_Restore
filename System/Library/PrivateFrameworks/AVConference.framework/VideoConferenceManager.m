@implementation VideoConferenceManager

+ (id)defaultVideoConferenceManager
{
  id result;
  void *v3;

  result = (id)defaultVideoConferenceManager__VideoConferenceManager;
  if (!defaultVideoConferenceManager__VideoConferenceManager)
  {
    v3 = (void *)objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVideoConferenceManager__VideoConferenceManager)
      defaultVideoConferenceManager__VideoConferenceManager = objc_alloc_init(VideoConferenceManager);
    objc_sync_exit(v3);
    return (id)defaultVideoConferenceManager__VideoConferenceManager;
  }
  return result;
}

- (VideoConferenceManager)init
{
  VideoConferenceManager *v2;
  VideoConferenceManager *v3;
  NSObject *v4;
  objc_super v6;
  pthread_mutexattr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VideoConferenceManager;
  v2 = -[VideoConferenceManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    v2->sipRefCount = 0;
    v2->vcList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v3->resultQueue = objc_alloc_init(ICEResultWaitQueue);
    uuid_clear(v3->_clientUUID);
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3->_xpcCommandQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VideoConferenceManager.xpcCommandQueue", v4);
    v7.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)v7.__opaque = 0xAAAAAAAAAAAAAAAALL;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v3->stateLock, &v7);
    pthread_mutex_init(&v3->sipLock, &v7);
    pthread_mutexattr_destroy(&v7);
    v3->isVTPInitialized = 0;
  }
  return v3;
}

+ (void)addNSError:(id)a3 toConferenceXPCArgumentDictionary:(id)a4
{
  void *v6;
  void *v7;

  if (a3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(a3, "code"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(a3, "domain"), CFSTR("conferenceErrorDomain"), v7, CFSTR("conferenceErrorCode"), objc_msgSend(a3, "userInfo"), CFSTR("conferenceErrorUserInfo"), 0);
    objc_msgSend(a4, "setObject:forKeyedSubscript:", v6, CFSTR("conferenceError"));

  }
}

- (void)videoConference:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5
{
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", a4, CFSTR("conferenceCallNewBlob"), v8, CFSTR("conferenceCallID"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceLocalIPChange", v7, a3);

}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  uint64_t v7;
  void *v9;
  void *v10;
  id v11;

  v7 = *(_QWORD *)&a5;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("conferenceConnectionStarted"), v9, 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a6, v10);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStartConnection", v10, a3);

}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 withUserInfo:(id)a6 error:(id)a7
{
  uint64_t v9;
  void *v11;
  void *v12;
  id v13;

  v9 = *(_QWORD *)&a5;
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", a4);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v13, CFSTR("conferenceConnectionStarted"), a6, CFSTR("conferenceUserInfo"), v11, CFSTR("conferenceCallID"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a7, v12);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStartConnection", v12, a3);

}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5 callMetadata:(id)a6
{
  void *v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceCallID"), a6, CFSTR("conferenceCallMetadata"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a5, v9);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidStopConnection", v9, a3);

}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseAudio:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("conferenceCallID"), v9, CFSTR("conferenceAudioPause"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a6, v10);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidPauseAudio", v10, a3);

}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 isSendingAudio:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("conferenceCallID"), v9, CFSTR("conferenceAudioSending"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a6, v10);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceIsSendingAudio", v10, a3);

}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 didPauseVideo:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("conferenceCallID"), v9, CFSTR("conferenceVideoPause"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a6, v10);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidPauseVideo", v10, a3);

}

- (void)videoConference:(id)a3 receivedNoRemotePacketsForTime:(double)a4 callID:(unsigned int)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a4);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("conferenceCallID"), v8, CFSTR("conferenceNoRemotePacketsTime"), 0);
  if (objc_msgSend(a3, "shouldReinitializeCallWithDuration:forCallID:", v5, a4))
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReinitializeCall", v9, a3);

}

- (void)videoConference:(id)a3 remoteMediaStalled:(BOOL)a4 callID:(unsigned int)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceIsRemoteMediaStalled"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteMediaStalled", v8, a3);

}

- (void)videoConference:(id)a3 didReceiveFirstRemoteFrameForCallID:(unsigned int)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("conferenceCallID"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidReceiveRemoteFrame", v5, a3);

}

- (void)videoConference:(id)a3 remoteAudioPaused:(BOOL)a4 callID:(unsigned int)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceAudioPause"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteAudioPause", v8, a3);

}

- (void)videoConference:(id)a3 remoteVideoPaused:(BOOL)a4 callID:(unsigned int)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceVideoPause"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteVideoPause", v8, a3);

}

- (void)videoConference:(id)a3 didRemoteVideoAttributesChange:(id)a4 forCallID:(unsigned int)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(a4, "copyEncodedDictionary");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceRemoteVideoAttributes"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteAttributesChange", v8, a3);

}

- (void)videoConference:(id)a3 didRemoteScreenAttributesChange:(id)a4 forCallID:(unsigned int)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(a4, "copyEncodedDictionary");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceRemoteScreenAttributes"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidRemoteScreenAttributesChange", v8, a3);

}

- (void)videoConference:(id)a3 updateInputFrequencyLevel:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("conferenceInputFreqMetering"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateInputFrequencyMetering", v5, a3);

}

- (void)videoConference:(id)a3 updateOutputFrequencyLevel:(id)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a4, CFSTR("conferenceOutputFreqMetering"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateOutputFrequencyMetering", v5, a3);

}

- (void)videoConference:(id)a3 updateInputMeterLevel:(float)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;

  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v7 = a4;
  v9 = (id)objc_msgSend(v6, "initWithFloat:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceInputMetering"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateInputMetering", v8, a3);

}

- (void)videoConference:(id)a3 updateOutputMeterLevel:(float)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;

  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v7 = a4;
  v9 = (id)objc_msgSend(v6, "initWithFloat:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceOutputMetering"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceUpdateOutputMetering", v8, a3);

}

- (void)videoConference:(id)a3 isRemoteAudioBelowThreshold:(BOOL)a4
{
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("conferenceAudioBelowThreshold");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteAudioBelowThreshold", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1), a3);
}

- (void)videoConference:(id)a3 inititiateRelayRequest:(unsigned int)a4 requestDict:(id)a5
{
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceCallID"), a5, CFSTR("conferenceRelayRequest"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceInitiateRelayRequest", v7, a3);

}

- (void)videoConference:(id)a3 sendRelayUpdate:(unsigned int)a4 updateDict:(id)a5
{
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceCallID"), a5, CFSTR("conferenceRelayRequest"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceSendRelayUpdate", v7, a3);

}

- (void)videoConference:(id)a3 cancelRelayRequest:(unsigned int)a4 requestDict:(id)a5
{
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceCallID"), a5, CFSTR("conferenceRelayRequest"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceCancelRelayRequest", v7, a3);

}

- (void)videoConference:(id)a3 videoQualityNotificationForCallID:(unsigned int)a4 isDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v6);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v10, CFSTR("conferenceIsVideoDegraded"), v12, CFSTR("conferenceIsRemote"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceVideoDegraded", v11, a3);

}

- (void)videoConference:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceCallID"), v9, CFSTR("conferenceNetworkHint"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceNetworkHint", v8, a3);

}

- (void)videoConference:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a5;
  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v8;
      v16 = 2080;
      v17 = "-[VideoConferenceManager videoConference:didReceiveARPLData:fromCallID:]";
      v18 = 1024;
      v19 = 445;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> Relaying incoming ARPL data from VideoConference to AVConference via XPC (in VideoConferenceManager) <<<<<", buf, 0x1Cu);
    }
  }
  if (!a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VideoConferenceManager videoConference:didReceiveARPLData:fromCallID:]";
      v18 = 1024;
      v19 = 448;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> DATA ERROR (in VideoConferenceManager) <<<<<", buf, 0x1Cu);
    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v5);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, CFSTR("conferenceCallID"), a4, CFSTR("conferenceARPLData"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReceivedARPL", v13, a3);

}

- (void)videoConference:(id)a3 didChangeLocalVariablesForCallID:(unsigned int)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("conferenceCallID"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceDidChangeLocalVariables", v5, a3);

}

- (void)videoConference:(id)a3 didReceiveData:(id)a4 forCallID:(unsigned int)a5
{
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v8, CFSTR("conferenceCallID"), a4, CFSTR("conferenceData"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceReceivedData", v7, a3);

}

- (void)videoConference:(id)a3 remoteAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v9, CFSTR("conferenceCallID"), v7, CFSTR("conferenceAudioEnabled"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteAudioEnabled", v8, a3);

}

- (void)videoConference:(id)a3 localAudioEnabled:(BOOL)a4 forCallID:(unsigned int)a5 error:(id)a6
{
  _BOOL8 v7;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v11, CFSTR("conferenceCallID"), v9, CFSTR("conferenceAudioEnabled"), 0);
  +[VideoConferenceManager addNSError:toConferenceXPCArgumentDictionary:](VideoConferenceManager, "addNSError:toConferenceXPCArgumentDictionary:", a6, v10);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceLocalAudioEnabled", v10, a3);

}

- (void)videoConference:(id)a3 closeConnectionForCallID:(unsigned int)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("conferenceCallID"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceCloseConnection", v5, a3);

}

- (void)videoConference:(id)a3 remoteCallingModeChanged:(unsigned int)a4 forCallID:(unsigned int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)&a5;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceCallID"), v9, CFSTR("conferenceCallingMode"), 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "conferenceRemoteCallingModeChanged", v8, a3);

}

- (tagHANDLE)SIPHandle
{
  _opaque_pthread_mutex_t *p_stateLock;
  tagHANDLE *hSIP;

  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  hSIP = self->hSIP;
  pthread_mutex_unlock(p_stateLock);
  return hSIP;
}

- (void)setupVTPCallback
{
  VTP_SetCallback((uint64_t)VTPCallback, (uint64_t)self);
}

- (void)createSIPWithPacketMultiplexMode:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  tagHANDLE **p_hSIP;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  tagHANDLE *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
      v19 = 1024;
      v20 = 554;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being asserted by SIP", (uint8_t *)&v15, 0x1Cu);
    }
  }
  -[VCNetworkAgent addAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "addAssertion");
  if (!self->isVTPInitialized)
  {
    +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
    VTP_SetCallback((uint64_t)VTPCallback, (uint64_t)self);
    self->isVTPInitialized = 1;
  }
  self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
  p_hSIP = &self->hSIP;
  v8 = SIPCreateHandle((uint64_t *)&self->hSIP, (uint64_t)SIPCallback, (uint64_t)self, 0);
  if (v8)
  {
    v9 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
        v19 = 1024;
        v20 = 566;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SOMETHING WENT WRONG MAKING THE SIP HANDLE!%08x", (uint8_t *)&v15, 0x22u);
      }
    }
    SIPCloseHandle();
    *p_hSIP = (tagHANDLE *)0xFFFFFFFFLL;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *p_hSIP;
      v15 = 136315906;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VideoConferenceManager createSIPWithPacketMultiplexMode:]";
      v19 = 1024;
      v20 = 571;
      v21 = 1024;
      v22 = (int)v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIP Handle created:0x%x", (uint8_t *)&v15, 0x22u);
    }
  }
  SIPSetPacketMultiplexMode((uint64_t)self->hSIP, a3);
  SIPSetAllowSameSourceDestination((uint64_t)self->hSIP, 1);
  SIPSetCellConditionChangeHandler((uint64_t)self->hSIP, (uint64_t)CellConditionChangeCallback, (uint64_t)self);
  self->sipRefCount = 0;
}

- (void)startSIPWithPacketMultiplexMode:(int)a3 transportType:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  int sipRefCount;
  tagHANDLE *hSIP;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v5 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      sipRefCount = self->sipRefCount;
      v11 = 136315906;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]";
      v15 = 1024;
      v16 = 585;
      v17 = 1024;
      v18 = sipRefCount;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceManager:  starting sip with refCount = %d", (uint8_t *)&v11, 0x22u);
    }
  }
  pthread_mutex_lock(&self->sipLock);
  hSIP = self->hSIP;
  if (hSIP != (tagHANDLE *)0xFFFFFFFFLL
    || (-[VideoConferenceManager createSIPWithPacketMultiplexMode:](self, "createSIPWithPacketMultiplexMode:", v5),
        hSIP = self->hSIP,
        hSIP != (tagHANDLE *)0xFFFFFFFFLL))
  {
    if ((SIPStartListen((uint64_t)hSIP, a4 != 0, self->_clientUUID) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:].cold.1();
      }
      SIPCloseHandle();
      self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    }
    else
    {
      ++self->sipRefCount;
    }
  }
  pthread_mutex_unlock(&self->sipLock);
}

- (BOOL)isSIPHandleValid:(tagHANDLE *)a3
{
  tagHANDLE *hSIP;
  BOOL v4;
  BOOL v5;
  int v6;
  uint64_t v8;
  NSObject *v9;
  tagHANDLE *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  hSIP = self->hSIP;
  v4 = hSIP != a3 || hSIP == (tagHANDLE *)0xFFFFFFFFLL;
  v5 = !v4;
  if (v4)
  {
    v6 = (int)a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = self->hSIP;
        v12 = 136316162;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VideoConferenceManager isSIPHandleValid:]";
        v16 = 1024;
        v17 = 609;
        v18 = 1024;
        v19 = v6;
        v20 = 1024;
        v21 = (int)v11;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d SIPCallback tried to use stale/invalid handle %d. actual is %d", (uint8_t *)&v12, 0x28u);
      }
    }
  }
  return v5;
}

- (void)cleanupVTP
{
  dispatch_time_t v3;
  NSObject *global_queue;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = dispatch_time(0, 120000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__VideoConferenceManager_cleanupVTP__block_invoke;
  v5[3] = &unk_1E9E521C0;
  v5[4] = self;
  dispatch_after(v3, global_queue, v5);
}

uint64_t __36__VideoConferenceManager_cleanupVTP__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(v4 + 216);
      LODWORD(v4) = *(_QWORD *)(v4 + 192) == 0xFFFFFFFFLL;
      v10 = 136316162;
      v11 = v2;
      v12 = 2080;
      v13 = "-[VideoConferenceManager cleanupVTP]_block_invoke";
      v14 = 1024;
      v15 = 620;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Entering cleanupVTP...with isVTPInitialized = %d and sip is invalid = %d", (uint8_t *)&v10, 0x28u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 192) == 0xFFFFFFFFLL)
  {
    if (*(_BYTE *)(v6 + 216))
    {
      +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315650;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VideoConferenceManager cleanupVTP]_block_invoke";
          v14 = 1024;
          v15 = 628;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished cleanupVTP...", (uint8_t *)&v10, 0x1Cu);
        }
      }
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));
}

- (void)stopSIPWithTransportType:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  int sipRefCount;
  int v8;
  BOOL v9;
  int v10;
  tagHANDLE *hSIP;
  tagHANDLE *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *global_queue;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1DF087EC4](&dword_1D8A54000, "-[VideoConferenceManager stopSIPWithTransportType:]");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      sipRefCount = self->sipRefCount;
      *(_DWORD *)buf = 136315906;
      v18 = v5;
      v19 = 2080;
      v20 = "-[VideoConferenceManager stopSIPWithTransportType:]";
      v21 = 1024;
      v22 = 638;
      v23 = 1024;
      v24 = sipRefCount;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceManager:  stopping sip with refCount = %d", buf, 0x22u);
    }
  }
  pthread_mutex_lock(&self->sipLock);
  v8 = self->sipRefCount;
  v9 = __OFSUB__(v8, 1);
  v10 = v8 - 1;
  if (v10 < 0 == v9)
    self->sipRefCount = v10;
  hSIP = self->hSIP;
  if (hSIP == (tagHANDLE *)0xFFFFFFFFLL
    || (SIPStopListen((uint64_t)hSIP, a3 != 0), v12 = self->hSIP, v12 == (tagHANDLE *)0xFFFFFFFFLL)
    || self->sipRefCount > 0)
  {
    pthread_mutex_unlock(&self->sipLock);
  }
  else
  {
    self->hSIP = (tagHANDLE *)0xFFFFFFFFLL;
    self->sipRefCount = 0;
    pthread_mutex_unlock(&self->sipLock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VideoConferenceManager stopSIPWithTransportType:]";
        v21 = 1024;
        v22 = 656;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being un-asserted by SIP", buf, 0x1Cu);
      }
    }
    -[VCNetworkAgent removeAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "removeAssertion");
    global_queue = dispatch_get_global_queue(0, 0);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__VideoConferenceManager_stopSIPWithTransportType___block_invoke;
    v16[3] = &unk_1E9E52960;
    v16[4] = self;
    v16[5] = v12;
    dispatch_async(global_queue, v16);
  }
}

void __51__VideoConferenceManager_stopSIPWithTransportType___block_invoke(uint64_t a1)
{
  SnapshotTimer *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(SnapshotTimer);
  -[SnapshotTimer checkinWithTimeout:forTask:](v2, "checkinWithTimeout:forTask:", CFSTR("Closing SIP Handle"), 45.0);
  SIPCloseHandle();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VideoConferenceManager stopSIPWithTransportType:]_block_invoke";
      v10 = 1024;
      v11 = 669;
      v12 = 1024;
      v13 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIP Handle closed:0x%x", (uint8_t *)&v6, 0x22u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "cleanupVTP");
  -[SnapshotTimer checkout](v2, "checkout");

}

- (void)addVideoConference:(id)a3
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  if ((-[NSMutableArray containsObject:](self->vcList, "containsObject:", a3) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VideoConferenceManager addVideoConference:]";
        v12 = 1024;
        v13 = 688;
        v14 = 2112;
        v15 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being asserted by addVideoConference '%@'", (uint8_t *)&v8, 0x26u);
      }
    }
    -[VCNetworkAgent addAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "addAssertion");
    -[NSMutableArray addObject:](self->vcList, "addObject:", a3);
  }
  pthread_mutex_unlock(p_stateLock);
}

- (void)removeVideoConference:(id)a3
{
  _opaque_pthread_mutex_t *p_stateLock;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  if (-[NSMutableArray containsObject:](self->vcList, "containsObject:", a3))
  {
    -[NSMutableArray removeObject:](self->vcList, "removeObject:", a3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VideoConferenceManager removeVideoConference:]";
        v12 = 1024;
        v13 = 702;
        v14 = 2112;
        v15 = a3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NetworkAgent is being un-asserted by removeVideoConference '%@'", (uint8_t *)&v8, 0x26u);
      }
    }
    -[VCNetworkAgent removeAssertion](+[VCNetworkAgent sharedInstance](VCNetworkAgent, "sharedInstance"), "removeAssertion");
  }
  if (objc_msgSend(a3, "isEqual:", self->activeConference))
    self->activeConference = 0;
  if (objc_msgSend(a3, "isEqual:", self->conferenceWithMic))
    self->conferenceWithMic = 0;
  pthread_mutex_unlock(p_stateLock);
}

- (void)setConferenceWithMic:(id)a3
{
  void *v5;
  _opaque_pthread_mutex_t *p_stateLock;
  NSMutableArray *vcList;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  self->conferenceWithMic = (VideoConference *)a3;
  if (a3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    vcList = self->vcList;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vcList, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(vcList);
          v12 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (v12 != a3 && objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "hasMic"))
            objc_msgSend(v5, "addObject:", v12);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vcList, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v9);
    }
  }
  pthread_mutex_unlock(p_stateLock);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "setHasMic:", 0);
      }
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v14);
  }

}

- (VideoConference)conferenceWithMic
{
  return self->conferenceWithMic;
}

- (id)conferenceForCallID:(unsigned int)a3
{
  uint64_t v3;
  _opaque_pthread_mutex_t *p_stateLock;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->vcList);
  pthread_mutex_unlock(p_stateLock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    if ((objc_msgSend(v11, "matchesCallID:", v3) & 1) != 0)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)hasVideoConference:(id)a3
{
  _opaque_pthread_mutex_t *p_stateLock;

  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  LOBYTE(a3) = -[NSMutableArray containsObject:](self->vcList, "containsObject:", a3);
  pthread_mutex_unlock(p_stateLock);
  return (char)a3;
}

- (id)conferenceForParticipantID:(id)a3
{
  _opaque_pthread_mutex_t *p_stateLock;
  VideoConference *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  v6 = self->activeConference;
  pthread_mutex_unlock(p_stateLock);
  if (!v6 || !-[VideoConference matchesParticipantID:](v6, "matchesParticipantID:", a3))
  {
    pthread_mutex_lock(p_stateLock);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->vcList);
    pthread_mutex_unlock(p_stateLock);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_5:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v6 = *(VideoConference **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if (-[VideoConference matchesParticipantID:](v6, "matchesParticipantID:", a3))
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          v6 = 0;
          if (v9)
            goto LABEL_5;
          return v6;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)conferenceForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  _opaque_pthread_mutex_t *p_stateLock;
  VideoConference *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  v6 = self->activeConference;
  pthread_mutex_unlock(p_stateLock);
  if (!v6
    || !-[VideoConference conferenceMatchesSourceDestinationInfo:](v6, "conferenceMatchesSourceDestinationInfo:", a3))
  {
    pthread_mutex_lock(p_stateLock);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->vcList);
    pthread_mutex_unlock(p_stateLock);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v12, "conferenceMatchesSourceDestinationInfo:", a3) & 1) != 0)
            return v12;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
    if (!-[VideoConference hasSessionWaitingForSIPInvite](v6, "hasSessionWaitingForSIPInvite"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
LABEL_14:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v7);
          v6 = *(VideoConference **)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if (-[VideoConference hasSessionWaitingForSIPInvite](v6, "hasSessionWaitingForSIPInvite"))
            break;
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
            v6 = 0;
            if (v14)
              goto LABEL_14;
            return v6;
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

- (void)pauseVideoConferences:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *global_queue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VideoConferenceManager pauseVideoConferences:]";
      v15 = 1024;
      v16 = 824;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterruptMe: (%d) pauseVideoConferences begin", buf, 0x22u);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__VideoConferenceManager_pauseVideoConferences___block_invoke;
  v9[3] = &unk_1E9E521E8;
  v9[4] = self;
  v10 = v3;
  dispatch_async(global_queue, v9);

}

void __48__VideoConferenceManager_pauseVideoConferences___block_invoke(uint64_t a1)
{
  void *v2;
  size_t v3;
  NSObject *global_queue;
  _QWORD block[5];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160));
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = objc_msgSend(v2, "count");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VideoConferenceManager_pauseVideoConferences___block_invoke_2;
  block[3] = &unk_1E9E544C8;
  block[4] = v2;
  v6 = *(_BYTE *)(a1 + 40);
  dispatch_apply(v3, global_queue, block);
}

void __48__VideoConferenceManager_pauseVideoConferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  objc_msgSend(v4, "setPauseAudio:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v4, "setPauseVideo:", *(unsigned __int8 *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 40);
      if (objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2))
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2), "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VideoConferenceManager pauseVideoConferences:]_block_invoke_2";
      v13 = 1024;
      v14 = 839;
      v15 = 1024;
      v16 = v7;
      v17 = 2080;
      v18 = v8;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d InterruptMe: (%d) Pausing audio and video for conference %s", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)broadcastCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  _opaque_pthread_mutex_t *p_stateLock;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->stateLock;
  pthread_mutex_lock(&self->stateLock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->vcList);
  pthread_mutex_unlock(p_stateLock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "handleCellTechChange:cellularMaxPktLen:", v5, v4);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v10);
  }

}

- (void)getClientUUID:(unsigned __int8)a3[16]
{
  _opaque_pthread_mutex_t *p_sipLock;

  p_sipLock = &self->sipLock;
  pthread_mutex_lock(&self->sipLock);
  uuid_copy(a3, self->_clientUUID);
  pthread_mutex_unlock(p_sipLock);
}

- (VideoConference)activeConference
{
  return self->activeConference;
}

- (void)setActiveConference:(id)a3
{
  self->activeConference = (VideoConference *)a3;
}

- (ICEResultWaitQueue)resultQueue
{
  return self->resultQueue;
}

- (NSMutableArray)vcList
{
  return self->vcList;
}

- (void)registerBlocksForConference
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke;
  v5[3] = &unk_1E9E53848;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceInitialize", v5, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceTerminate", &__block_literal_global_91, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceWarmUpForCall", &__block_literal_global_27_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceInitializeNewCall", &__block_literal_global_29, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsUsingBlobFormat", &__block_literal_global_38, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsUsingBlobFormat", &__block_literal_global_43, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetReportingIdentifier", &__block_literal_global_45_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetSessionID", &__block_literal_global_51, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceAddGKSCallEvent", &__block_literal_global_53, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetConnectionBlob", &__block_literal_global_57, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetInviteData", &__block_literal_global_63, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetCallMetadata", &__block_literal_global_70_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPeerCN", &__block_literal_global_74, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceNetworkQualityForCall", &__block_literal_global_78, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRequiresWifi", &__block_literal_global_82, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetRequiresWifi", &__block_literal_global_86, self->_xpcCommandQueue);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_13;
  v4[3] = &unk_1E9E53848;
  v4[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceStartConnectionUsingInviteData", v4, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceStopCallID", &__block_literal_global_105, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceCancelCallID", &__block_literal_global_107, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRemoteCancelledCallID", &__block_literal_global_109, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetCallReport", &__block_literal_global_111, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetActive", &__block_literal_global_119, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRemoteIPChange", &__block_literal_global_123, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsOutputMeteringEnabled", &__block_literal_global_125, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsOutputMeteringEnabled", &__block_literal_global_129, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsInputMeteringEnabled", &__block_literal_global_131, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:", "conferenceSetIsInputMeteringEnabled", &__block_literal_global_135);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsInputFrequencyMeteringEnabled", &__block_literal_global_137_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsInputFrequencyMeteringEnabled", &__block_literal_global_141, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsOutputFrequencyMeteringEnabled", &__block_literal_global_143, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsOutputFrequencyMeteringEnabled", &__block_literal_global_147, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetOutputMeterLevel", &__block_literal_global_149_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetInputMeterLevel", &__block_literal_global_151, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsMicrophoneMuted", &__block_literal_global_153, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsMicrophoneMuted", &__block_literal_global_157, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameRate", &__block_literal_global_159_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalBitRate", &__block_literal_global_163, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameRate", &__block_literal_global_167_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteBitRate", &__block_literal_global_171, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalPacketLossRate", &__block_literal_global_175, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemotePacketLossRate", &__block_literal_global_179, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRoundTripTime", &__block_literal_global_181, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetStatsForCallID", &__block_literal_global_185, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetIsSpeakerEnabled", &__block_literal_global_189_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetIsSpeakerEnabled", &__block_literal_global_193, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetNATType", &__block_literal_global_195_1, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetAudioSending", &__block_literal_global_199_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPauseAudio", &__block_literal_global_203, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPauseVideo", &__block_literal_global_207_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetServerInfo", &__block_literal_global_211, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameWidth", &__block_literal_global_216, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLocalFrameHeight", &__block_literal_global_220, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameWidth", &__block_literal_global_224_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetRemoteFrameHeight", &__block_literal_global_228, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceProcessRelayRequestResponse", &__block_literal_global_232_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceProcessRelayRequestUpdate", &__block_literal_global_234, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSendARPL", &__block_literal_global_236, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSendData", &__block_literal_global_241, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceGetLastActiveCallID", &__block_literal_global_248, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetLastActiveCallID", &__block_literal_global_251, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceRelayedCallType", &__block_literal_global_254, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceUpdateCapabilities", &__block_literal_global_259, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceShouldSendBlackFrame", &__block_literal_global_262_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetState", &__block_literal_global_267_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetVisualRectangle", &__block_literal_global_272_0, self->_xpcCommandQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "conferenceSetPeerProtocolVersion", &__block_literal_global_277, self->_xpcCommandQueue);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  VideoConference *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE src[22];
  __int16 v17;
  int v18;
  __int16 v19;
  VideoConference *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceClientUUID"));
  if (v5)
  {
    memset(src, 170, 16);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    objc_msgSend(v6, "getUUIDBytes:", src);
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));
    uuid_copy((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), src);
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 88));

  }
  v7 = -[VideoConference initWithClientPid:]([VideoConference alloc], "initWithClientPid:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTPID")), "intValue"));
  -[VideoConference setDelegate:](v7, "setDelegate:", +[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"));
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "addVideoConference:", v7);
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceTransportType"));
  -[VideoConference setTransportType:](v7, "setTransportType:", objc_msgSend(v8, "unsignedIntValue"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v8, "unsignedIntValue");
      *(_DWORD *)src = 136316162;
      *(_QWORD *)&src[4] = v9;
      *(_WORD *)&src[12] = 2080;
      *(_QWORD *)&src[14] = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
      v17 = 1024;
      v18 = 59;
      v19 = 2048;
      v20 = v7;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d allocated new VideoConference object %p, with transportType %d", src, 0x2Cu);
    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VideoConference inputAudioPowerSpectrumToken](v7, "inputAudioPowerSpectrumToken"));
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VideoConference outputAudioPowerSpectrumToken](v7, "outputAudioPowerSpectrumToken"));
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("CONTEXT"), v12, CFSTR("conferenceInitialized"), v13, CFSTR("conferenceInputAudioPowerSpectrumToken"), v14, CFSTR("conferenceOutputAudioPowerSpectrumToken"), 0);

  return v4;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = 0;
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D80]);
    v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("CONTEXT"), 0);
  }
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "stopAllCalls:", 0);
    objc_msgSend(v5, "setDelegate:", 0);
    objc_msgSend(v5, "startDeallocTimerWithTimeout:", 15);

    objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "removeVideoConference:", v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        v13 = 1024;
        v14 = 100;
        v15 = 2048;
        v16 = v5;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d released old VideoConference object %p", buf, 0x26u);
      }
    }
  }
  return v3;
}

{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceInputMetering"));
    if (v4)
      objc_msgSend(v3, "setInputMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_26(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "warmupForCall");
  return 0;
}

{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isOutputFrequencyMeteringEnabled"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceOutputFreqMetering"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceDeviceRole"));
  v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceReportingHierarchyToken"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(v4, "initializeNewCallWithDeviceRole:reportingHierarchyToken:", objc_msgSend(v5, "intValue"), v6));
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceCallID"), 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke_2";
      v15 = 1024;
      v16 = 129;
      v17 = 1024;
      v18 = objc_msgSend(v5, "intValue");
      v19 = 1024;
      v20 = objc_msgSend(v7, "intValue");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initializeNewCallWithDeviceRole:%d (server side) callID=%d", buf, 0x28u);
    }
  }

  return v3;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_37(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "useViceroyBlobFormat"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceUsingBlobFormat"), 0);

  return v6;
}

{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "remotePacketLossRateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceRemotePacketLossRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2_42(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceUsingBlobFormat"));
    if (v4)
      objc_msgSend(v3, "setUseViceroyBlobFormat:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_3(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "setPeerReportingID:sessionID:callID:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferencePeerReportingIdentifier")), objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceSessionID")), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"));
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceSessionID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "setSessionID:callID:", v4, objc_msgSend(v5, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_5(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceSessionID"));
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallEvent"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceParticipantID"));
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v5 = 0;
  if (v7 && v8)
  {
    v13 = objc_msgSend(v8, "unsignedIntValue");
    v9 = (void *)objc_msgSend(v6, "inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:", v7, &v13, 0, a3, 0.0);
    v10 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v11 = (void *)objc_msgSend(v10, "initWithUnsignedInt:", v13);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InviteDataConnectionBlob")), CFSTR("conferenceConnectionBlob"), v11, CFSTR("conferenceCallID"), 0);

  }
  return v5;
}

id __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceParticipantID"));
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v9 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceInviteData"));
  v10 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceNonCellularCandidateTimeout"));
  v5 = 0;
  if (v7 && v8)
  {
    v11 = (void *)v10;
    v16 = objc_msgSend(v8, "unsignedIntValue");
    objc_msgSend(v11, "doubleValue");
    v12 = objc_msgSend(v6, "inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:", v7, &v16, v9, a3);
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
    v14 = (void *)objc_msgSend(v13, "initWithUnsignedInt:", v16);
    if (v14)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("conferenceCallID"));
    if (v12)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("conferenceInviteData"));

  }
  return v5;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "callMetadataForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"));
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("conferenceCallMetadata"), 0);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferencePeerCN"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "setPeerCN:callID:", v4, objc_msgSend(v5, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_10(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  if (!v5)
    return 0;
  objc_msgSend(v4, "networkQualityForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", v6);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceNetworkQuality"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_11(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "requiresWifi"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceRequiresWifi"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRequiresWifi"));
    if (v4)
      objc_msgSend(v3, "setRequiresWifi:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  VCCapabilities *v15;
  VCCapabilities *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v24 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceOldCallID"));
  v9 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceIsCaller"));
  v10 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceParticipantID"));
  v23 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceInviteData"));
  v22 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRelayRequest"));
  v11 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCapabilities"));
  v12 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceDestination"));
  v13 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("USERXPCARGUMENTS"));
  if (v13)
    v14 = xpc_dictionary_dup_fd(v13, "FILEDESCRIPTOR");
  else
    v14 = -1;
  v15 = -[VCCapabilities initWithEncodedDictionary:]([VCCapabilities alloc], "initWithEncodedDictionary:", v11);
  v16 = v15;
  if (v7 && v8 && v9 && v10 && v15)
  {
    LODWORD(v21) = v14;
    LOBYTE(v20) = 1;
    v17 = objc_msgSend(v24, "startConnectionWithParticipantID:callID:oldCallID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", v10, objc_msgSend(v7, "unsignedIntValue"), objc_msgSend(v8, "unsignedIntValue"), v23, objc_msgSend(v9, "BOOLValue"), v22, v20, v15, v21, v12, a3);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v17);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v18, CFSTR("conferenceConnectionStarted"), 0);

    objc_msgSend(v24, "setDelegate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    close(v14);
    v6 = 0;
  }

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
      objc_msgSend(v3, "stopCallID:", objc_msgSend(v4, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
      objc_msgSend(v3, "cancelCallID:", objc_msgSend(v4, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
      objc_msgSend(v3, "remoteCancelledCallID:", objc_msgSend(v4, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_17(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallReport"));
    v6 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallReportProtobuf"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallReportProtobufID"));
    if (v4 && v5)
      objc_msgSend(v3, "setCallReport:withReport:", objc_msgSend(v4, "unsignedIntValue"), v5);
    if (v4 && v6 && v7)
      objc_msgSend(v3, "setCallReportProtobuf:withProtobufData:forMetricID:", objc_msgSend(v4, "unsignedIntValue"), v6, objc_msgSend(v7, "integerValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_18(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceActive"));
  if (!v5)
    return 0;
  v6 = objc_msgSend(v4, "setActive:", objc_msgSend(v5, "BOOLValue"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v6);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceActive"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_19(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceConnectionBlob"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "processRemoteIPChange:callID:", v5, objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_20(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isOutputMeteringEnabled"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceOutputMetering"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_21(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceOutputMetering"));
    if (v4)
      objc_msgSend(v3, "setOutputMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_22(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isInputMeteringEnabled"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceInputMetering"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_24(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isInputFrequencyMeteringEnabled"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceInputFreqMetering"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceInputFreqMetering"));
    if (v4)
      objc_msgSend(v3, "setInputFrequencyMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceOutputFreqMetering"));
    if (v4)
      objc_msgSend(v3, "setOutputFrequencyMeteringEnabled:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_28(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "outputMeterLevel");
  v6 = (void *)objc_msgSend(v5, "initWithFloat:");
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("conferenceOutputMetering"), 0);

  return v7;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_29(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "inputMeterLevel");
  v6 = (void *)objc_msgSend(v5, "initWithFloat:");
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("conferenceInputMetering"), 0);

  return v7;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_30(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isMicrophoneMuted"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceMicrophoneMute"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceMicrophoneMute"));
    if (v4)
      objc_msgSend(v3, "setMicrophoneMuted:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_32(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "localFramerateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceLocalFrameRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_33(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "localBitrateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceLocalBitRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_34(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "remoteFramerateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceRemoteFrameRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_35(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "remoteBitrateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceRemoteBitRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_36(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "localPacketLossRateForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceRemotePacketLossRate"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_38(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  objc_msgSend(v4, "roundTripTimeForCallID:", objc_msgSend(v5, "unsignedIntValue"));
  v7 = (void *)objc_msgSend(v6, "initWithDouble:");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("conferenceRoundTripTime"), 0);

  return v8;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v4;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "statsForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"));
  return objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("conferenceCallStats"), 0);
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_40(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceSpeakerEnabled"));
    if (v4)
      objc_msgSend(v3, "setEnableSpeakerPhone:", objc_msgSend(v4, "BOOLValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_41(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", objc_msgSend(v4, "isSpeakerPhoneEnabled"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceSpeakerEnabled"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_42(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v4, "natType"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceNATType"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceAudioSending"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "setSendAudio:forCallID:", objc_msgSend(v4, "BOOLValue"), objc_msgSend(v5, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_44(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceAudioPause"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v6)
    {
      if (v7)
        objc_msgSend(v5, "setPauseAudio:callID:error:", objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "unsignedIntValue"), a3);
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_45(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceVideoPause"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v6)
    {
      if (v7)
        objc_msgSend(v5, "setPauseVideo:callID:error:", objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "unsignedIntValue"), a3);
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceServerInfo"));
    if (v3)
      +[GKSConnectivitySettings setServerAddresses:](GKSConnectivitySettings, "setServerAddresses:", v3);
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_47(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v4, "localFrameWidth"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceLocalFrameWidth"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_48(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", objc_msgSend(v4, "localFrameHeight"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceLocalFrameHeight"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_49(uint64_t a1, void *a2)
{
  double v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "remoteFrameSizeForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (int)v4);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceRemoteFrameWidth"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_50(uint64_t a1, void *a2)
{
  double v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "remoteFrameSizeForCallID:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", (int)v4);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceRemoteFrameHeight"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_51(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRelayRequest"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "processRelayRequestResponse:responseDict:didOriginateRequest:", objc_msgSend(v4, "unsignedIntValue"), v5, 1);
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_52(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRelayRequest"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "processRelayUpdate:updateDict:didOriginateRequest:", objc_msgSend(v4, "unsignedIntValue"), v5, 1);
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v3;
        v20 = 2080;
        v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        v22 = 1024;
        v23 = 1071;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> [incomingArgs objectForKey:CLIENT_DIED_KEY] != nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
  }
  else
  {
    if (!a2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v5;
        v20 = 2080;
        v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke_53";
        v22 = 1024;
        v23 = 1049;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: Incoming arguments are nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v8 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceARPLData"));
    if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v9;
        v20 = 2080;
        v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        v22 = 1024;
        v23 = 1057;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: Call ID is nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    if (!v11 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v12;
        v20 = 2080;
        v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        v22 = 1024;
        v23 = 1063;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> ERROR: VideoConference context is nil (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(v7, "intValue");
        v18 = 136315906;
        v19 = v14;
        v20 = 2080;
        v21 = "-[VideoConferenceManager(VideoConference) registerBlocksForConference]_block_invoke";
        v22 = 1024;
        v23 = 1066;
        v24 = 1024;
        v25 = v16;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d >>>>> Relaying outgoing ARPL data from AVConference via XPC to VideoConference with callID=%d (in VideoConferenceManagerCategories) <<<<<", (uint8_t *)&v18, 0x22u);
      }
    }
    objc_msgSend(v11, "sendARPLData:toCallID:", v8, objc_msgSend(v7, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_240(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT")), "sendData:toCallID:encrypted:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceData")), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID")), "unsignedIntValue"), objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceEncryptData")), "BOOLValue"));
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_2_247(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
    return 0;
  v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", objc_msgSend(v4, "lastActiveCall"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("conferenceCallID"), 0);

  return v6;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_3_250(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    if (v4)
      objc_msgSend(v3, "setLastActiveCall:", objc_msgSend(v4, "unsignedIntegerValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_4_253(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceRelayedCallType"));
    if (v4)
      objc_msgSend(v3, "updateRelayedCallType:forCallID:", objc_msgSend(v5, "unsignedCharValue"), objc_msgSend(v4, "unsignedIntValue"));
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_5_258(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  VCCapabilities *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = -[VCCapabilities initWithEncodedDictionary:]([VCCapabilities alloc], "initWithEncodedDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCapabilities")));
    if (v4)
      objc_msgSend(v3, "updateCapabilities:forCallID:", v5, objc_msgSend(v4, "unsignedIntValue"));

  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_6_261(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceShouldSendBlackFrameState"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "shouldSendBlackFrame:callID:", objc_msgSend(v5, "BOOLValue"), v4);
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_7_266(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceState"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "setConferenceState:forCallID:", objc_msgSend(v5, "unsignedIntValue"), objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_8_271(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceVisualRectangle"));
    if (v4)
    {
      v6 = v5;
      if (v5)
      {
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "doubleValue");
        v8 = v7;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 1), "doubleValue");
        v10 = v9;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 2), "doubleValue");
        v12 = v11;
        objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 3), "doubleValue");
        objc_msgSend(v3, "setConferenceVisualRectangle:forCallID:", objc_msgSend(v4, "unsignedIntValue"), v8, v10, v12, v13);
      }
    }
  }
  return 0;
}

uint64_t __70__VideoConferenceManager_VideoConference__registerBlocksForConference__block_invoke_9_276(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CLIENTDIED")))
  {
    v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CONTEXT"));
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceCallID"));
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("conferenceProtocolVersion"));
    if (v4)
    {
      if (v5)
        objc_msgSend(v3, "setPeerProtocolVersion:forCallID:", objc_msgSend(v5, "unsignedIntValue"), objc_msgSend(v4, "unsignedIntValue"));
    }
  }
  return 0;
}

- (void)startSIPWithPacketMultiplexMode:transportType:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VideoConferenceManager startSIPWithPacketMultiplexMode:transportType:]";
  v4 = 1024;
  v5 = 595;
  v6 = 1024;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d SOMETHING WENT WRONG IN SIP LISTEN! %08x", v2, 0x22u);
}

@end
