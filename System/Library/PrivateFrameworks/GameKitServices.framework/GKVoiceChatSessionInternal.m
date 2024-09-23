@implementation GKVoiceChatSessionInternal

- (GKVoiceChatPeerInfoProvider)gameStateSession
{
  return (GKVoiceChatPeerInfoProvider *)objc_loadWeak((id *)&self->_gameStateSession);
}

- (void)interfaceStateDidChangeWithWifiUp:(BOOL)a3 cellUp:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  unsigned int sessionState;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[GKVoiceChatSessionInternal interfaceStateDidChangeWithWifiUp:cellUp:]";
      v13 = 1024;
      v14 = 79;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSesion_Internal current wifi state: %d", (uint8_t *)&v9, 0x22u);
    }
  }
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  self->_currentWifiState = v4;
  sessionState = self->_sessionState;
  if (v4)
  {
    if (!sessionState)
    {
      -[GKRWLock unlock](self->_rwLock, "unlock");
      -[GKVoiceChatSessionInternal startSessionInternal](self, "startSessionInternal");
      return;
    }
  }
  else if (sessionState == 1)
  {
    -[GKRWLock unlock](self->_rwLock, "unlock");
    -[GKVoiceChatSessionInternal stopSessionInternal](self, "stopSessionInternal");
    return;
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (GKVoiceChatSessionInternal)initWithGameStateSession:(id)a3 publicWrapper:(id)a4 sessionName:(id)a5
{
  char *v8;
  id v9;
  Boolean keyExistsAndHasValidFormat;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKVoiceChatSessionInternal;
  v8 = -[GKVoiceChatSessionInternal init](&v12, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = objc_msgSend(a5, "copy");
    objc_storeWeak((id *)v8 + 4, a3);
    *((_DWORD *)v8 + 6) = 1065353216;
    objc_msgSend(v8, "calculateConferenceID");
    *((_QWORD *)v8 + 5) = objc_msgSend((id)objc_msgSend(a3, "peerID"), "copy");
    *((_QWORD *)v8 + 15) = objc_alloc_init(GKRWLock);
    *((_QWORD *)v8 + 6) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    *((_QWORD *)v8 + 7) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    *((_QWORD *)v8 + 8) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    *((_QWORD *)v8 + 9) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    *((_QWORD *)v8 + 11) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
    v8[96] = 1;
    *(_QWORD *)(v8 + 100) = 0xFFFFFFFF7FFFFFFFLL;
    v8[108] = 1;
    *((_DWORD *)v8 + 28) = 3;
    *((_QWORD *)v8 + 18) = dispatch_queue_create("com.apple.GKVoiceChatSession.sendQueue", 0);
    *((_QWORD *)v8 + 21) = a4;
    *((_QWORD *)v8 + 17) = -[VoiceChatSessionRoster initWithGameStateSession:peerID:voiceChatSession:sendQueue:]([VoiceChatSessionRoster alloc], "initWithGameStateSession:peerID:voiceChatSession:sendQueue:", a3, *((_QWORD *)v8 + 5), v8, *((_QWORD *)v8 + 18));
    keyExistsAndHasValidFormat = 0;
    v8[28] = CFPreferencesGetAppBooleanValue(CFSTR("focusCallbacks"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat) != 0;
    v9 = objc_alloc_init((Class)off_24D465850);
    *((_QWORD *)v8 + 22) = v9;
    objc_msgSend(v9, "setInterfaceListenerDelegate:", v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend((id)objc_msgSend(a3, "voiceChatSessionListener"), "registerNewGKVoiceChatSession:", v8);
  }
  return (GKVoiceChatSessionInternal *)v8;
}

+ (void)brokenHash:(id)a3 response:(char *)a4
{
  __int128 v6;
  CC_MD5_CTX v7;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.data[13] = v6;
  *(_OWORD *)&v7.data[6] = v6;
  *(_OWORD *)&v7.data[10] = v6;
  *(_OWORD *)&v7.Nl = v6;
  *(_OWORD *)&v7.data[2] = v6;
  *(_OWORD *)&v7.A = v6;
  CC_MD5_Init(&v7);
  CC_MD5_Update(&v7, (const void *)objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "length"));
  CC_MD5_Final((unsigned __int8 *)a4, &v7);
}

- (void)calculateConferenceID
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 0xAAAAAAAAAAAAAAAALL;
  v4 = 0xAAAAAAAAAAAAAAAALL;
  +[GKVoiceChatSessionInternal brokenHash:response:](GKVoiceChatSessionInternal, "brokenHash:response:", self->_sessionName, &v3);
  self->_conferenceID = HIDWORD(v4);
}

- (id)encodePeerID:(id)a3
{
  unsigned int v4;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "longLongValue");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), v4 | ((unint64_t)self->_conferenceID << 32));
}

- (id)decodePeerID:(id)a3
{
  if (a3)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), strtoull((const char *)objc_msgSend(a3, "UTF8String"), 0, 10));
  else
    return 0;
}

- (void)dealloc
{
  NSObject *sendQueue;
  uint64_t v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];

  self->_roster = 0;
  objc_storeWeak((id *)&self->_gameStateSession, 0);

  self->_peerID = 0;
  self->_rwLock = 0;

  self->_myPausedList = 0;
  self->_connectedPeers = 0;

  self->_connectedVoicePeers = 0;
  self->_connectedFocusPeers = 0;

  self->_mutedPeers = 0;
  self->_peerChannelQuality = 0;
  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }

  self->_sessionName = 0;
  self->_vcService = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v8 = v4;
      v9 = 2080;
      v10 = "-[GKVoiceChatSessionInternal dealloc]";
      v11 = 1024;
      v12 = 205;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSessionInternal getting dealloced", buf, 0x1Cu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatSessionInternal;
  -[GKVoiceChatSessionInternal dealloc](&v6, sel_dealloc);
}

- (void)cleanup
{
  -[GKVoiceChatSessionInternal stopSession](self, "stopSession");
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  self->_sessionState = 4;
  -[VoiceChatSessionRoster cleanup](self->_roster, "cleanup");
  -[GKRWLock unlock](self->_rwLock, "unlock");
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_cleanupProc_, self, 0);
}

- (void)cleanupProc:(id)a3
{
  GKVoiceChatPeerInfoProvider *v4;

  -[GKRWLock wrlock](self->_rwLock, "wrlock", a3);
  -[GKVoiceChatServicePrivate setClient:](self->_vcService, "setClient:", 0);
  -[GKVoiceChatServiceFocus setSpeakingDelegate:](self->_vcService, "setSpeakingDelegate:", 0);
  -[GKVoiceChatServiceFocus setQualityDelegate:](self->_vcService, "setQualityDelegate:", 0);
  -[GKVoiceChatServicePrivate cleanup](self->_vcService, "cleanup");
  -[GKRWLock unlock](self->_rwLock, "unlock");
  v4 = -[GKVoiceChatSessionInternal gameStateSession](self, "gameStateSession");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)-[GKVoiceChatPeerInfoProvider voiceChatSessionListener](v4, "voiceChatSessionListener"), "removeSession:", self);
}

- (void)startSession
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v3;
        v9 = 2080;
        v10 = "-[GKVoiceChatSessionInternal startSession]";
        v11 = 1024;
        v12 = 247;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start-voice-chat-session", (uint8_t *)&v7, 0x1Cu);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[GKVoiceChatSessionInternal startSession]";
        v11 = 1024;
        v12 = 248;
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Calling startSession!", (uint8_t *)&v7, 0x1Cu);
      }
    }
    self->_sessionState = 0;
    -[GKInterfaceListener hasConnectionWithWifi:cell:](self->_wifiListener, "hasConnectionWithWifi:cell:", &self->_currentWifiState, 0);
    -[GKInterfaceListener startChangeListener](self->_wifiListener, "startChangeListener");
    -[GKRWLock unlock](self->_rwLock, "unlock");
    -[GKVoiceChatSessionInternal startSessionInternal](self, "startSessionInternal");
  }
  else
  {
    -[GKRWLock unlock](self->_rwLock, "unlock");
  }
}

- (void)startSessionInternal
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[GKVoiceChatSessionInternal startSessionInternal]";
  v6 = 1024;
  v7 = 280;
  _os_log_error_impl(&dword_215C5C000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Not starting voicechat. Don't have permission to use microphone", (uint8_t *)&v2, 0x1Cu);
}

- (void)stopSession
{
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 3)
  {
    -[GKRWLock unlock](self->_rwLock, "unlock");
  }
  else
  {
    self->_sessionState = 3;
    -[GKInterfaceListener stopChangeListener](self->_wifiListener, "stopChangeListener");
    -[GKRWLock unlock](self->_rwLock, "unlock");
    -[GKVoiceChatSessionInternal stopSessionInternal](self, "stopSessionInternal");
  }
}

- (void)stopSessionInternal
{
  NSMutableArray *connectedFocusPeers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSMutableArray *connectedPeers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 1)
    self->_sessionState = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  connectedFocusPeers = self->_connectedFocusPeers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedFocusPeers, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(connectedFocusPeers);
        -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedFocusPeers, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  connectedPeers = self->_connectedPeers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(connectedPeers);
        -[GKVoiceChatServicePrivate stopVoiceChatWithParticipantID:](self->_vcService, "stopVoiceChatWithParticipantID:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j)));
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }
  -[GKVoiceChatServiceFocus setFocus:](self->_vcService, "setFocus:", 0);
  -[GKVoiceChatServiceFocus setCurrentFocus:](self->_vcService, "setCurrentFocus:", 0);
  -[VoiceChatSessionRoster stopBeacon](self->_roster, "stopBeacon");
  -[NSMutableArray removeAllObjects](self->_myPausedList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_connectedPeers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_connectedVoicePeers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_connectedFocusPeers, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_peerChannelQuality, "removeAllObjects");
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)setMute:(BOOL)a3 forPeer:(id)a4
{
  _BOOL4 v5;
  NSMutableArray *mutedPeers;

  v5 = a3;
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  mutedPeers = self->_mutedPeers;
  if (v5)
  {
    if ((-[NSMutableArray containsObject:](mutedPeers, "containsObject:", a4) & 1) == 0)
      -[NSMutableArray addObject:](self->_mutedPeers, "addObject:", a4);
  }
  else
  {
    -[NSMutableArray removeObject:](mutedPeers, "removeObject:", a4);
  }
  if (self->_sessionState == 1)
  {
    if (-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus"))
      -[GKVoiceChatSessionInternal updatedMutedPeers:forPeer:](self, "updatedMutedPeers:forPeer:", self->_mutedPeers, 0);
    else
      -[GKVoiceChatSessionInternal sendMutedPeers](self, "sendMutedPeers");
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (BOOL)getMuteStateForPeer:(id)a3
{
  -[GKRWLock rdlock](self->_rwLock, "rdlock");
  LOBYTE(a3) = -[NSMutableArray containsObject:](self->_mutedPeers, "containsObject:", a3);
  -[GKRWLock unlock](self->_rwLock, "unlock");
  return (char)a3;
}

- (NSArray)peerList
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_connectedFocusPeers);
}

- (void)setActiveSession:(BOOL)a3
{
  GKVoiceChatServiceFocus *vcService;

  vcService = self->_vcService;
  if (vcService)
  {
    -[GKVoiceChatServiceFocus setHasMic:](vcService, "setHasMic:");
    self->activeSession = a3;
  }
}

- (BOOL)isActiveSession
{
  GKVoiceChatServiceFocus *vcService;
  BOOL result;

  vcService = self->_vcService;
  if (!vcService)
    return self->activeSession;
  result = -[GKVoiceChatServiceFocus hasMic](vcService, "hasMic");
  self->activeSession = result;
  return result;
}

- (NSString)sessionName
{
  return (NSString *)(id)-[NSString copy](self->_sessionName, "copy");
}

- (unsigned)conferenceID
{
  return self->_conferenceID;
}

- (float)sessionVolume
{
  GKVoiceChatServiceFocus *vcService;
  float result;

  vcService = self->_vcService;
  if (!vcService)
    return self->sessionVolume;
  -[GKVoiceChatServicePrivate remoteParticipantVolume](vcService, "remoteParticipantVolume");
  self->sessionVolume = result;
  return result;
}

- (void)setSessionVolume:(float)a3
{
  double v3;
  float v5;
  double v6;

  LODWORD(v3) = 1.0;
  if (a3 <= 1.0)
    *(float *)&v3 = a3;
  if (a3 >= 0.0)
    v5 = *(float *)&v3;
  else
    v5 = 0.0;
  *(float *)&v6 = v5;
  -[GKVoiceChatServicePrivate setRemoteParticipantVolume:](self->_vcService, "setRemoteParticipantVolume:", v6, v3);
  self->sessionVolume = v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
    LOBYTE(v5) = objc_msgSend(a3, "conferenceID") == self->_conferenceID;
  return v5;
}

- (void)handlePeerDisconnected:(id)a3
{
  -[NSMutableArray removeObject:](self->_connectedVoicePeers, "removeObject:");
  -[NSMutableDictionary removeObjectForKey:](self->_peerChannelQuality, "removeObjectForKey:", a3);
  self->needsRecalculateGoodChannels = 1;
  if (-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus"))
  {
    if (-[NSMutableArray containsObject:](self->_connectedFocusPeers, "containsObject:", a3))
    {
      -[NSMutableArray removeObject:](self->_connectedFocusPeers, "removeObject:", a3);
      -[GKVoiceChatSessionInternal sendConnectedPeers](self, "sendConnectedPeers");
      -[GKVoiceChatSessionInternal updatedConnectedPeers:](self, "updatedConnectedPeers:", self->_connectedFocusPeers);
      -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, a3, 0);
    }
  }
}

- (void)updatedSubscribedBeaconList:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *connectedPeers;
  const char *v9;
  NSString *peerID;
  const char *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE buf[12];
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      connectedPeers = self->_connectedPeers;
      if (connectedPeers)
        v9 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectedPeers, "description"), "UTF8String");
      else
        v9 = "<nil>";
      peerID = self->_peerID;
      if (peerID)
        v11 = -[NSString UTF8String](-[NSString description](peerID, "description"), "UTF8String");
      else
        v11 = "<nil>";
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v5;
      v46 = 2080;
      v47 = "-[GKVoiceChatSessionInternal updatedSubscribedBeaconList:]";
      v48 = 1024;
      v49 = 464;
      v50 = 2080;
      v51 = v7;
      v52 = 2080;
      v53 = v9;
      v54 = 2080;
      v55 = v11;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSession_Internal: updatedSubscribedBeaconList: newSubscribedList = %s (our existing members = %s) us (%s)", buf, 0x3Au);
    }
  }
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 1)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = self->_connectedPeers;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(a3, "containsObject:", v18) & 1) == 0)
            objc_msgSend(v12, "addObject:", v18);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v15);
    }
    *(_QWORD *)buf = 0;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(a3);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((-[NSMutableArray containsObject:](self->_connectedPeers, "containsObject:", v23) & 1) == 0)
          {
            v24 = -[NSString longLongValue](self->_peerID, "longLongValue");
            if (v24 < objc_msgSend(v23, "longLongValue"))
              -[GKVoiceChatServiceFocus startVoiceChatWithParticipantID:error:](self->_vcService, "startVoiceChatWithParticipantID:error:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", v23), buf);
            -[NSMutableArray addObject:](self->_connectedPeers, "addObject:", v23);
            -[GKVoiceChatSessionInternal informClientVoiceChatConnecting:](self, "informClientVoiceChatConnecting:", v23);
          }
        }
        v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      }
      while (v20);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v12);
          v29 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
          -[GKVoiceChatServicePrivate stopVoiceChatWithParticipantID:](self->_vcService, "stopVoiceChatWithParticipantID:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", v29));
          -[NSMutableArray removeObject:](self->_connectedPeers, "removeObject:", v29);
          -[GKVoiceChatSessionInternal handlePeerDisconnected:](self, "handlePeerDisconnected:", v29);
        }
        v26 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      }
      while (v26);
    }
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)updatedFocusID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  const char *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_sessionState == 1;
      v8 = -[NSString longLongValue](self->_peerID, "longLongValue");
      *(_DWORD *)buf = 136316418;
      v9 = "NO";
      v12 = v5;
      v14 = "-[GKVoiceChatSessionInternal updatedFocusID:]";
      v13 = 2080;
      v15 = 1024;
      if (v8 == (_DWORD)v3)
        v9 = "YES";
      v16 = 510;
      v17 = 1024;
      v18 = v3;
      v19 = 1024;
      v20 = v7;
      v21 = 2080;
      v22 = v9;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d My new focus = %u, _sessionState == kVoiceChatSessionRunning = %d.  Am I the focus?  %s", buf, 0x32u);
    }
  }
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 1)
  {
    -[GKVoiceChatServiceFocus setFocus:](self->_vcService, "setFocus:", -[NSString longLongValue](self->_peerID, "longLongValue") == v3);
    -[GKVoiceChatServiceFocus setCurrentFocus:](self->_vcService, "setCurrentFocus:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), -[VoiceChatSessionRoster focusID](self->_roster, "focusID"))));
    -[GKVoiceChatSessionInternal unPauseAll](self, "unPauseAll");
    if (-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus"))
    {
      -[GKVoiceChatSessionInternal updatedMutedPeers:forPeer:](self, "updatedMutedPeers:forPeer:", self->_mutedPeers, 0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_connectedVoicePeers);
      objc_msgSend(v10, "insertObject:atIndex:", self->_peerID, 0);
      objc_msgSend(v10, "removeObjectsInArray:", self->_myPausedList);
      -[GKVoiceChatSessionInternal updatedFocusPeers:](self, "updatedFocusPeers:", v10);

      -[GKVoiceChatSessionInternal sendConnectedPeers](self, "sendConnectedPeers");
      -[GKVoiceChatSessionInternal updatedConnectedPeers:](self, "updatedConnectedPeers:", self->_connectedFocusPeers);
    }
    else
    {
      -[GKVoiceChatSessionInternal sendMutedPeers](self, "sendMutedPeers");
    }
    if (self->focusCallbacks)
      -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatFocusChange_, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v3), 0);
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)updatedMutedPeers:(id)a3 forPeer:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v7, "addObject:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++)));
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[GKVoiceChatServiceFocus updatedMutedPeers:forParticipantID:](self->_vcService, "updatedMutedPeers:forParticipantID:", v7, -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a4));

}

- (void)sendMutedPeers
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v1, v2, " [%s] %s:%d sendMutedPeers failed to serialize. %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

uint64_t __44__GKVoiceChatSessionInternal_sendMutedPeers__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(_QWORD *)(a1 + 48), &v2);
}

- (void)parseMutedPeers:(id)a3 forPeer:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = 0;
  v6 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListFromData:mutabilityOption:format:errorDescription:", a3, 0, 0, &v8);
  if (v6)
  {
    v7 = v6;
    -[GKRWLock wrlock](self->_rwLock, "wrlock");
    -[GKVoiceChatSessionInternal updatedMutedPeers:forPeer:](self, "updatedMutedPeers:forPeer:", v7, a4);
    -[GKRWLock unlock](self->_rwLock, "unlock");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKVoiceChatSessionInternal parseMutedPeers:forPeer:].cold.1();
    }

  }
}

- (void)pauseAll
{
  NSMutableArray *connectedVoicePeers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(connectedVoicePeers);
        -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 1, -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)unPauseAll
{
  NSMutableArray *connectedVoicePeers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(connectedVoicePeers);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (!-[NSMutableArray containsObject:](self->_myPausedList, "containsObject:", v8)
          || !-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus"))
        {
          -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 0, -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", v8));
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (void)pruneBadLinks
{
  NSMutableArray *connectedVoicePeers;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  float v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  connectedVoicePeers = self->_connectedVoicePeers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(connectedVoicePeers);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerChannelQuality, "objectForKeyedSubscript:", v9), "floatValue");
        if (v10 > 0.25
          && ((-[NSMutableArray containsObject:](self->_myPausedList, "containsObject:", v9) | v6) & 1) == 0)
        {
          -[GKVoiceChatSessionInternal addPeerToFocusPausedList:](self, "addPeerToFocusPausedList:", v9);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_connectedVoicePeers);
          objc_msgSend(v11, "insertObject:atIndex:", self->_peerID, 0);
          objc_msgSend(v11, "removeObjectsInArray:", self->_myPausedList);
          -[GKVoiceChatSessionInternal updatedFocusPeers:](self, "updatedFocusPeers:", v11);

          -[GKVoiceChatSessionInternal sendConnectedPeers](self, "sendConnectedPeers");
          -[GKVoiceChatSessionInternal updatedConnectedPeers:](self, "updatedConnectedPeers:", self->_connectedFocusPeers);
          v6 = 1;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerChannelQuality, "setObject:forKeyedSubscript:", &unk_24D4701A8, v9);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedVoicePeers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  self->needsRecalculateGoodChannels = 1;
  -[GKVoiceChatSessionInternal goodChannels](self, "goodChannels");
}

- (void)addPeerToFocusPausedList:(id)a3
{
  NSMutableArray *myPausedList;

  myPausedList = self->_myPausedList;
  if (!myPausedList)
  {
    myPausedList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 16);
    self->_myPausedList = myPausedList;
  }
  -[NSMutableArray addObject:](myPausedList, "addObject:", a3);
  -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 1, -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a3));
}

- (void)removeFromFocusPausedList:(id)a3
{
  -[NSMutableArray removeObject:](self->_myPausedList, "removeObject:");
  -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 0, -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a3));
}

- (void)updatedFocusPeers:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  NSMutableArray *connectedFocusPeers;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", a3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", self->_connectedFocusPeers);
  if ((objc_msgSend(a3, "containsObject:", self->_peerID) & 1) != 0)
  {
    objc_msgSend(v5, "removeObjectsInArray:", self->_connectedFocusPeers);
    objc_msgSend(v5, "removeObject:", self->_peerID);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v5);
          -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStart_, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), 0);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v8);
    }
    objc_msgSend(v6, "removeObjectsInArray:", a3);
    objc_msgSend(v6, "removeObject:", self->_peerID);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v6);
          -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), 0);
        }
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v12);
    }
    -[NSMutableArray setArray:](self->_connectedFocusPeers, "setArray:", a3);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    connectedFocusPeers = self->_connectedFocusPeers;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedFocusPeers, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(connectedFocusPeers);
          -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k), 0);
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedFocusPeers, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v17);
    }
    -[NSMutableArray removeAllObjects](self->_connectedFocusPeers, "removeAllObjects");
  }

}

- (void)updatedConnectedPeers:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addObject:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  if (!-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus")
    && (objc_msgSend(a3, "containsObject:", self->_peerID) & 1) == 0)
  {
    -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 1, -[GKVoiceChatServiceFocus currentFocus](self->_vcService, "currentFocus"));
  }
  -[GKVoiceChatServiceFocus updatedConnectedPeers:](self->_vcService, "updatedConnectedPeers:", v5);

}

- (void)sendConnectedPeers
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v1, v2, " [%s] %s:%d sendConnectedPeers failed to serialize. %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

uint64_t __48__GKVoiceChatSessionInternal_sendConnectedPeers__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(_QWORD *)(a1 + 48), &v2);
}

- (void)parseConnectedPeers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = 0;
  v4 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListFromData:mutabilityOption:format:errorDescription:", a3, 0, 0, &v6);
  if (v4)
  {
    v5 = v4;
    -[GKRWLock wrlock](self->_rwLock, "wrlock");
    -[GKVoiceChatSessionInternal updatedFocusPeers:](self, "updatedFocusPeers:", v5);
    -[GKVoiceChatSessionInternal updatedConnectedPeers:](self, "updatedConnectedPeers:", v5);
    -[GKRWLock unlock](self->_rwLock, "unlock");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKVoiceChatSessionInternal parseConnectedPeers:].cold.1();
    }

  }
}

- (unsigned)peerCount
{
  return -[NSMutableArray count](self->_connectedVoicePeers, "count");
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
  self->talkingPeersLimit = a3;
  -[GKVoiceChatServiceFocus setTalkingPeersLimit:](self->_vcService, "setTalkingPeersLimit:");
}

- (unsigned)talkingPeersLimit
{
  return self->talkingPeersLimit;
}

- (void)setIsUsingSuppression:(BOOL)a3
{
  self->isUsingSuppression = a3;
  -[GKVoiceChatServiceFocus setIsUsingSuppression:](self->_vcService, "setIsUsingSuppression:");
}

- (BOOL)isUsingSuppression
{
  return self->isUsingSuppression;
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  int v12;
  VoiceChatSessionRoster *v13;
  _BYTE v14[12];
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v5 = *(_QWORD *)&a5;
  v23 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v11 = (_DWORD)v5 == 2 || (_DWORD)v5 == 5;
      *(_DWORD *)v14 = 136316162;
      v12 = v11;
      *(_QWORD *)&v14[4] = v8;
      v15 = 2080;
      v16 = "-[GKVoiceChatSessionInternal(GKSessionVoiceChatDelegate) session:peer:didChangeState:]";
      v17 = 1024;
      v18 = 791;
      v19 = 2080;
      v20 = v10;
      v21 = 1024;
      v22 = v12;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerID %s didChangeState == connected (%d)", v14, 0x2Cu);
    }
  }
  -[GKRWLock wrlock](self->_rwLock, "wrlock", *(_QWORD *)v14);
  if ((_DWORD)v5 == 3 && -[NSMutableArray containsObject:](self->_connectedPeers, "containsObject:", a4))
  {
    -[GKVoiceChatServiceFocus remoteCancelled:](self->_vcService, "remoteCancelled:", -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a4));
    -[NSMutableArray removeObject:](self->_connectedPeers, "removeObject:", a4);
    -[GKVoiceChatSessionInternal handlePeerDisconnected:](self, "handlePeerDisconnected:", a4);
  }
  v13 = self->_roster;
  -[GKRWLock unlock](self->_rwLock, "unlock");
  -[VoiceChatSessionRoster peer:didChangeState:](v13, "peer:didChangeState:", a4, v5);

}

- (void)session:(id)a3 didReceiveOOBAudioPacket:(id)a4 fromPeerID:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  const char *v12;
  unsigned int sessionState;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(a4, "subtype");
      if (a5)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v11 = "<nil>";
      if (-[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a5))
        v12 = (const char *)objc_msgSend((id)objc_msgSend(-[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a5), "description"), "UTF8String");
      else
        v12 = "<nil>";
      v14 = 136316418;
      v15 = v8;
      v16 = 2080;
      v17 = "-[GKVoiceChatSessionInternal(GKSessionVoiceChatDelegate) session:didReceiveOOBAudioPacket:fromPeerID:]";
      v18 = 1024;
      v19 = 817;
      v20 = 1024;
      v21 = v10;
      v22 = 2080;
      v23 = v11;
      v24 = 2080;
      v25 = v12;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session didReceiveOOBAudioPacket of type %u from %s %s", (uint8_t *)&v14, 0x36u);
    }
  }
  -[GKRWLock rdlock](self->_rwLock, "rdlock");
  sessionState = self->_sessionState;
  -[GKRWLock unlock](self->_rwLock, "unlock");
  if (sessionState != 4)
  {
    switch(objc_msgSend(a4, "subtype"))
    {
      case 0u:
        -[GKVoiceChatServiceFocus receivedData:fromParticipantID:](self->_vcService, "receivedData:fromParticipantID:", objc_msgSend(a4, "payload"), -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", a5));
        break;
      case 1u:
        -[VoiceChatSessionRoster receivedBeacon:fromPeer:](self->_roster, "receivedBeacon:fromPeer:", objc_msgSend(a4, "payload"), a5);
        break;
      case 2u:
        -[GKVoiceChatSessionInternal parseConnectedPeers:](self, "parseConnectedPeers:", objc_msgSend(a4, "payload"));
        break;
      case 3u:
        -[GKVoiceChatSessionInternal parseMutedPeers:forPeer:](self, "parseMutedPeers:forPeer:", objc_msgSend(a4, "payload"), a5);
        break;
      default:
        return;
    }
  }
}

- (void)informClientVoiceChatDidStart:(id)a3
{
  -[GKVoiceChatSessionDelegate gkVoiceChatSession:stateUpdate:forPeer:](self->delegate, "gkVoiceChatSession:stateUpdate:forPeer:", self->_publicWrapper, 0, a3);
}

- (void)informClientVoiceChatConnecting:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __87__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatConnecting___block_invoke;
  v3[3] = &unk_24D4661B8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __87__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatConnecting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "gkVoiceChatSession:stateUpdate:forPeer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 4, *(_QWORD *)(a1 + 40));
}

- (void)informClientVoiceChatCouldNotConnect:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __92__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatCouldNotConnect___block_invoke;
  v3[3] = &unk_24D4661B8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __92__GKVoiceChatSessionInternal_VoiceChatClientInternal__informClientVoiceChatCouldNotConnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "gkVoiceChatSession:stateUpdate:forPeer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), 5, *(_QWORD *)(a1 + 40));
}

- (void)informClientVoiceChatDidStop:(id)a3
{
  -[GKVoiceChatSessionDelegate gkVoiceChatSession:stateUpdate:forPeer:](self->delegate, "gkVoiceChatSession:stateUpdate:forPeer:", self->_publicWrapper, 1, a3);
}

- (void)informClientVoiceChatSpeaking:(id)a3
{
  -[GKVoiceChatSessionDelegate gkVoiceChatSession:stateUpdate:forPeer:](self->delegate, "gkVoiceChatSession:stateUpdate:forPeer:", self->_publicWrapper, 2, a3);
}

- (void)informClientVoiceChatSilent:(id)a3
{
  -[GKVoiceChatSessionDelegate gkVoiceChatSession:stateUpdate:forPeer:](self->delegate, "gkVoiceChatSession:stateUpdate:forPeer:", self->_publicWrapper, 3, a3);
}

- (void)informClientVoiceChatFocusChange:(id)a3
{
  -[GKVoiceChatSessionDelegate gkVoiceChatSession:stateUpdate:forPeer:](self->delegate, "gkVoiceChatSession:stateUpdate:forPeer:", self->_publicWrapper, 6, a3);
}

- (void)voiceChatService:(id)a3 sendData:(id)a4 toParticipantID:(id)a5
{
  GKVoiceChatSessionMessage *v7;
  void *v8;
  GKVoiceChatPeerInfoProvider *v9;
  NSObject *sendQueue;
  _QWORD block[7];

  v7 = -[GKVoiceChatSessionMessage initWithPayload:conferenceID:subtype:]([GKVoiceChatSessionMessage alloc], "initWithPayload:conferenceID:subtype:", a4, self->_conferenceID, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", -[GKVoiceChatSessionInternal decodePeerID:](self, "decodePeerID:", a5), 0);
  v9 = -[GKVoiceChatSessionInternal gameStateSession](self, "gameStateSession");
  sendQueue = self->_sendQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__GKVoiceChatSessionInternal_VoiceChatClient__voiceChatService_sendData_toParticipantID___block_invoke;
  block[3] = &unk_24D4661E0;
  block[4] = v9;
  block[5] = v7;
  block[6] = v8;
  dispatch_async(sendQueue, block);

}

uint64_t __89__GKVoiceChatSessionInternal_VoiceChatClient__voiceChatService_sendData_toParticipantID___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(_QWORD *)(a1 + 48), &v2);
}

- (id)participantID
{
  return -[GKVoiceChatSessionInternal encodePeerID:](self, "encodePeerID:", self->_peerID);
}

- (void)voiceChatService:(id)a3 didStartWithParticipantID:(id)a4
{
  id v6;

  v6 = -[GKVoiceChatSessionInternal decodePeerID:](self, "decodePeerID:", a4);
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 1)
  {
    if ((-[NSMutableArray containsObject:](self->_connectedVoicePeers, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_connectedVoicePeers, "addObject:", v6);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerChannelQuality, "setObject:forKeyedSubscript:", &unk_24D4701A8, v6);
      self->needsRecalculateGoodChannels = 1;
    }
    if (-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus"))
    {
      if ((-[NSMutableArray containsObject:](self->_connectedFocusPeers, "containsObject:", v6) & 1) == 0)
      {
        -[NSMutableArray addObject:](self->_connectedFocusPeers, "addObject:", v6);
        -[GKVoiceChatSessionInternal sendConnectedPeers](self, "sendConnectedPeers");
        -[GKVoiceChatSessionInternal updatedConnectedPeers:](self, "updatedConnectedPeers:", self->_connectedFocusPeers);
        -[GKVoiceChatSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStart_, v6, 0);
        if (self->congestionState == 1)
          -[GKVoiceChatServiceFocus pauseAudio:toParticipantID:](self->_vcService, "pauseAudio:toParticipantID:", 1, a4);
      }
    }
    if (-[VoiceChatSessionRoster recalculateFocusRating](self->_roster, "recalculateFocusRating"))
      -[VoiceChatSessionRoster updateBeacon](self->_roster, "updateBeacon");
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)voiceChatService:(id)a3 didNotStartWithParticipantID:(id)a4 error:(id)a5
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a5)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[GKVoiceChatSessionInternal(VoiceChatClient) voiceChatService:didNotStartWithParticipantID:error:]";
      v13 = 1024;
      v14 = 939;
      v15 = 2080;
      v16 = v8;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d voiceChatService:didNotStartWithParticipantID %s", (uint8_t *)&v9, 0x26u);
    }
  }
}

- (void)voiceChatService:(id)a3 didStopWithParticipantID:(id)a4 error:(id)a5
{
  id v6;

  v6 = -[GKVoiceChatSessionInternal decodePeerID:](self, "decodePeerID:", a4);
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  if (self->_sessionState == 1)
  {
    -[GKVoiceChatSessionInternal handlePeerDisconnected:](self, "handlePeerDisconnected:", v6);
    if (-[VoiceChatSessionRoster recalculateFocusRating](self->_roster, "recalculateFocusRating"))
      -[VoiceChatSessionRoster updateBeacon](self->_roster, "updateBeacon");
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)voiceChatService:(id)a3 didReceiveInvitationFromParticipantID:(id)a4 callID:(unsigned int)a5
{
  unsigned int sessionState;
  GKVoiceChatServiceFocus *vcService;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  sessionState = self->_sessionState;
  vcService = self->_vcService;
  if (sessionState == 1)
  {
    if (!-[GKVoiceChatServiceFocus acceptCallID:error:](vcService, "acceptCallID:error:", *(_QWORD *)&a5, &v10)
      && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v10)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        else
          v9 = "<nil>";
        *(_DWORD *)buf = 136315906;
        v12 = v7;
        v13 = 2080;
        v14 = "-[GKVoiceChatSessionInternal(VoiceChatClient) voiceChatService:didReceiveInvitationFromParticipantID:callID:]";
        v15 = 1024;
        v16 = 961;
        v17 = 2080;
        v18 = v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We have a problem when accepting the call %s", buf, 0x26u);
      }
    }
  }
  else
  {
    -[GKVoiceChatServiceFocus denyCallID:](vcService, "denyCallID:", *(_QWORD *)&a5, a4);
  }
}

- (GKVoiceChatSessionDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  -[GKRWLock wrlock](self->_rwLock, "wrlock");
  self->delegate = (GKVoiceChatSessionDelegate *)a3;
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

- (void)didStartSpeaking:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStartSpeaking___block_invoke;
  v3[3] = &unk_24D4661B8;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __80__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStartSpeaking___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "decodePeerID:");
  else
    v2 = (id)objc_msgSend(v1[5], "copy");
  return objc_msgSend(v1, "informClientVoiceChatSpeaking:", v2);
}

- (void)didStopSpeaking:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStopSpeaking___block_invoke;
  v3[3] = &unk_24D4661B8;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __79__GKVoiceChatSessionInternal_VideoConferenceSpeakingDelegate__didStopSpeaking___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "decodePeerID:");
  else
    v2 = (id)objc_msgSend(v1[5], "copy");
  return objc_msgSend(v1, "informClientVoiceChatSilent:", v2);
}

- (int)calculateChannelQualities
{
  int v3;
  NSMutableDictionary *peerChannelQuality;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  float v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->_connectedVoicePeers, "count");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  peerChannelQuality = self->_peerChannelQuality;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](peerChannelQuality, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(peerChannelQuality);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_myPausedList, "containsObject:", v9) & 1) == 0)
        {
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerChannelQuality, "objectForKeyedSubscript:", v9), "floatValue");
          if (v10 <= 0.25)
            continue;
        }
        --v3;
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](peerChannelQuality, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  self->needsRecalculateGoodChannels = 0;
  return v3;
}

- (int)goodChannels
{
  int result;

  if (!self->needsRecalculateGoodChannels)
    return self->goodChannels;
  result = -[GKVoiceChatSessionInternal calculateChannelQualities](self, "calculateChannelQualities");
  self->goodChannels = result;
  return result;
}

- (void)lossRate:(float)a3 forParticipantID:(id)a4
{
  id v6;
  int v7;
  double v8;
  dispatch_time_t v9;
  NSObject *global_queue;
  _QWORD block[5];

  v6 = -[GKVoiceChatSessionInternal decodePeerID:](self, "decodePeerID:", a4);
  -[GKRWLock rdlock](self->_rwLock, "rdlock");
  if (a3 > 0.25)
  {
    -[GKRWLock unlock](self->_rwLock, "unlock");
    -[GKRWLock wrlock](self->_rwLock, "wrlock");
    v7 = -[GKVoiceChatSessionInternal calculateChannelQualities](self, "calculateChannelQualities");
    if (-[GKVoiceChatServicePrivate isFocus](self->_vcService, "isFocus") && !self->congestionState)
    {
      self->congestionState = 1;
      *(float *)&v8 = a3;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerChannelQuality, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8), v6);
      -[GKVoiceChatSessionInternal pauseAll](self, "pauseAll");
      v9 = dispatch_time(0, 4000000000);
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke;
      block[3] = &unk_24D466170;
      block[4] = self;
      dispatch_after(v9, global_queue, block);
    }
    if (!self->congestionState && self->goodChannels != v7)
    {
      self->goodChannels = v7;
      if (-[VoiceChatSessionRoster recalculateFocusRating](self->_roster, "recalculateFocusRating"))
        -[VoiceChatSessionRoster updateBeacon](self->_roster, "updateBeacon");
    }
  }
  -[GKRWLock unlock](self->_rwLock, "unlock");
}

uint64_t __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "wrlock");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "isFocus"))
    objc_msgSend(*(id *)(a1 + 32), "pruneBadLinks");
  objc_msgSend(*(id *)(a1 + 32), "unPauseAll");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 160) = 2;
  v2 = dispatch_time(0, 2000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke_2;
  block[3] = &unk_24D466170;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, global_queue, block);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "unlock");
}

uint64_t __95__GKVoiceChatSessionInternal_VideoConferenceChannelQualityDelegate__lossRate_forParticipantID___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "wrlock");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "recalculateFocusRating"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "updateBeacon");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "unlock");
}

- (void)parseMutedPeers:forPeer:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v1, v2, " [%s] %s:%d parseMutedPeers failed to deserialize. %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)parseConnectedPeers:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_215C5C000, v1, v2, " [%s] %s:%d parseConnectedPeers failed to deserialize. %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
