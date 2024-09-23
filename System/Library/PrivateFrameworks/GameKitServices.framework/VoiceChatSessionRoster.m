@implementation VoiceChatSessionRoster

- (GKVoiceChatPeerInfoProvider)gameStateSession
{
  return (GKVoiceChatPeerInfoProvider *)objc_loadWeak((id *)&self->_gameStateSession);
}

- (VoiceChatSessionRoster)initWithGameStateSession:(id)a3 peerID:(id)a4 voiceChatSession:(id)a5 sendQueue:(id)a6
{
  VoiceChatSessionRoster *v10;
  VoiceChatSessionRoster *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VoiceChatSessionRoster;
  v10 = -[VoiceChatSessionRoster init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_gkvs = (GKVoiceChatSessionInternal *)a5;
    objc_storeWeak((id *)&v10->_gameStateSession, a3);
    v11->_peerID = (NSString *)objc_msgSend(a4, "copy");
    v11->_connectedPeers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "connectedPeerIDs"), "mutableCopy");
    dispatch_retain((dispatch_object_t)a6);
    v11->_sendQueue = (OS_dispatch_queue *)a6;
    pthread_mutex_init(&v11->resMutex, 0);
    *(_WORD *)&v11->_needsUpdateBeaconList = 1;
    *(_QWORD *)&v11->_chosenFocusRating = 0;
    *(_QWORD *)&v11->_deviceRating = 0;
    v11->_isBeaconUp = 0;
    -[VoiceChatSessionRoster configureDeviceRating](v11, "configureDeviceRating");
    v11->_peerStateTable = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
    v11->_hasFocus = 0;
  }
  return v11;
}

- (void)dealloc
{
  NSObject *sendQueue;
  objc_super v4;

  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }
  objc_storeWeak((id *)&self->_gameStateSession, 0);

  self->_peerID = 0;
  self->_connectedPeers = 0;

  self->_peerStateTable = 0;
  v4.receiver = self;
  v4.super_class = (Class)VoiceChatSessionRoster;
  -[VoiceChatSessionRoster dealloc](&v4, sel_dealloc);
}

- (void)cleanup
{
  _opaque_pthread_mutex_t *p_resMutex;

  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  self->_gkvs = 0;
  pthread_mutex_unlock(p_resMutex);
}

- (unsigned)focusID
{
  return self->_focusID;
}

- (void)configureDeviceRating
{
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int deviceRating;
  unsigned int v7;
  size_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  unsigned int v18;
  char v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  *(_OWORD *)v19 = 0u;
  v20 = 0u;
  v8 = 64;
  sysctlbyname("hw.model", v19, &v8, 0, 0);
  if (!strncasecmp("j1", v19, 2uLL)
    || !strncasecmp("j2", v19, 2uLL)
    || !strncasecmp("n94", v19, 3uLL)
    || !strncasecmp("k93", v19, 3uLL)
    || !strncasecmp("k94", v19, 3uLL)
    || !strncasecmp("k95", v19, 3uLL))
  {
    v3 = 40;
    goto LABEL_13;
  }
  if (!strncasecmp("n90", v19, 3uLL) || !strncasecmp("n92", v19, 3uLL) || !strncasecmp("n81", v19, 3uLL))
  {
    v7 = 30;
  }
  else
  {
    if (strncasecmp("n88", v19, 3uLL))
    {
      v3 = 45;
LABEL_13:
      self->_deviceRating = v3;
      -[GKVoiceChatSessionInternal setIsUsingSuppression:](self->_gkvs, "setIsUsingSuppression:", 0);
      goto LABEL_14;
    }
    v7 = 15;
  }
  self->_deviceRating = v7;
LABEL_14:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      deviceRating = self->_deviceRating;
      *(_DWORD *)buf = 136316162;
      v10 = v4;
      v11 = 2080;
      v12 = "-[VoiceChatSessionRoster configureDeviceRating]";
      v13 = 1024;
      v14 = 1256;
      v15 = 2080;
      v16 = v19;
      v17 = 1024;
      v18 = deviceRating;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hwModel %s device rating is %u", buf, 0x2Cu);
    }
  }
}

- (BOOL)recalculateFocusRating
{
  _opaque_pthread_mutex_t *p_resMutex;
  GKVoiceChatSessionInternal *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int focusRating;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int deviceRating;
  unsigned int focusID;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v4 = self->_gkvs;
  pthread_mutex_unlock(p_resMutex);
  v5 = -[GKVoiceChatSessionInternal peerCount](v4, "peerCount");
  v6 = -[GKVoiceChatSessionInternal goodChannels](v4, "goodChannels");
  v7 = -[GKVoiceChatSessionInternal talkingPeersLimit](v4, "talkingPeersLimit");

  if (v5 - 4 >= 5)
    v8 = v5 >> 1;
  else
    v8 = dword_215CDDA3C[v5 - 4];
  if (v6 >= v8)
    v9 = v5;
  else
    v9 = v6;
  if (v9 >= v7)
    v10 = v7;
  else
    v10 = v9;
  focusRating = self->_focusRating;
  v12 = self->_deviceRating | (v10 << 8);
  if (v12 != focusRating)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        deviceRating = self->_deviceRating;
        v15 = self->_focusRating;
        v19 = 136316674;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VoiceChatSessionRoster recalculateFocusRating]";
        v23 = 1024;
        v24 = 1300;
        v25 = 1024;
        v26 = v15;
        v27 = 1024;
        v28 = v12;
        v29 = 1024;
        v30 = v10;
        v31 = 1024;
        v32 = deviceRating;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Focus rating updated from %d to %d (%d and %d)", (uint8_t *)&v19, 0x34u);
      }
    }
    pthread_mutex_lock(p_resMutex);
    self->_focusRating = v12;
    focusID = self->_focusID;
    if (focusID == -[NSString longLongValue](self->_peerID, "longLongValue"))
      self->_chosenFocusRating = self->_focusRating;
    pthread_mutex_unlock(p_resMutex);
  }
  return v12 != focusRating;
}

- (void)startBeacon
{
  NSMutableArray *connectedPeers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  VoiceChatSessionBeaconState *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[VoiceChatSessionRoster recalculateFocusRating](self, "recalculateFocusRating");
  pthread_mutex_lock(&self->resMutex);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  connectedPeers = self->_connectedPeers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(connectedPeers);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v9 = (VoiceChatSessionBeaconState *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", v8);
        if (!v9)
        {
          v9 = objc_alloc_init(VoiceChatSessionBeaconState);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerStateTable, "setObject:forKeyedSubscript:", v9, v8);

        }
        -[VoiceChatSessionBeaconState setNeedsSend:](v9, "setNeedsSend:", 1);
        -[VoiceChatSessionBeaconState setTypeToSend:](v9, "setTypeToSend:", 0);
        self->_needsUpdateBeaconList = 1;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  if (!self->_isBeaconUp)
    self->_isBeaconUp = 1;
  -[VoiceChatSessionRoster sendBeacons](self, "sendBeacons");
  self->_chosenFocusRating = 0;
  self->_focusID = 0;
  self->_hasFocus = 0;
  if (!self->_waitingToCalculateFocus)
  {
    self->_waitingToCalculateFocus = 1;
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5));
  }
  pthread_mutex_unlock(&self->resMutex);
}

- (void)updateBeacon
{
  _opaque_pthread_mutex_t *p_resMutex;
  NSMutableArray *connectedPeers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  connectedPeers = self->_connectedPeers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(connectedPeers);
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, "setNeedsSend:", 1);
          objc_msgSend(v10, "setTypeToSend:", 0);
          self->_needsUpdateBeaconList = 1;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  -[VoiceChatSessionRoster sendBeacons](self, "sendBeacons");
  if (!self->_waitingToCalculateFocus)
  {
    self->_waitingToCalculateFocus = 1;
    objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5));
  }
  pthread_mutex_unlock(p_resMutex);
}

- (void)stopBeacon
{
  _opaque_pthread_mutex_t *p_resMutex;
  NSMutableArray *connectedPeers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  connectedPeers = self->_connectedPeers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(connectedPeers);
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        objc_msgSend(v9, "setNeedsSend:", 1);
        objc_msgSend(v9, "setTypeToSend:", 1);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  if (self->_isBeaconUp)
  {
    -[VoiceChatSessionRoster sendBeacons](self, "sendBeacons");
    self->_isBeaconUp = 0;
  }
  self->_chosenFocusRating = 0;
  self->_focusID = 0;
  self->_hasFocus = 0;
  pthread_mutex_unlock(p_resMutex);
}

- (void)sendBeacon:(tagVoiceChatBeacon *)a3 ToPeer:(id)a4
{
  GKVoiceChatSessionMessage *v6;
  void *v7;
  GKVoiceChatPeerInfoProvider *v8;
  NSObject *sendQueue;
  _QWORD block[7];

  v6 = -[GKVoiceChatSessionMessage initWithPayload:conferenceID:subtype:]([GKVoiceChatSessionMessage alloc], "initWithPayload:conferenceID:subtype:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a3, 20, 0), -[GKVoiceChatSessionInternal conferenceID](self->_gkvs, "conferenceID"), 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", a4);
  v8 = -[VoiceChatSessionRoster gameStateSession](self, "gameStateSession");
  sendQueue = self->_sendQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__VoiceChatSessionRoster_sendBeacon_ToPeer___block_invoke;
  block[3] = &unk_24D4661E0;
  block[4] = v8;
  block[5] = v6;
  block[6] = v7;
  dispatch_async(sendQueue, block);

}

uint64_t __44__VoiceChatSessionRoster_sendBeacon_ToPeer___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "sendVoiceChatData:toPeers:error:", objc_msgSend(*(id *)(a1 + 40), "data"), *(_QWORD *)(a1 + 48), &v2);
}

- (void)sendBeacons
{
  void *v3;
  void *v4;
  NSMutableArray *connectedPeers;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE buf[22];
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_isBeaconUp)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDD1460]);
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    connectedPeers = self->_connectedPeers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v22;
      for (i = *(_QWORD *)v22; ; i = *(_QWORD *)v22)
      {
        if (i != v9)
          objc_enumerationMutation(connectedPeers);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", v11);
        if (objc_msgSend(v12, "needsSend"))
        {
          objc_msgSend(v4, "addObject:", v11);
          memset(buf, 170, 20);
          *(_DWORD *)&buf[4] = bswap32(objc_msgSend(v12, "typeToSend"));
          v13 = objc_msgSend(v12, "receivedState");
          v14 = bswap32(self->_focusID);
          *(_DWORD *)&buf[12] = bswap32(self->_focusRating);
          *(_DWORD *)&buf[16] = v14;
          *(_DWORD *)buf = bswap32(v13);
          *(_DWORD *)&buf[8] = 0x1000000;
          if (objc_msgSend(v3, "count"))
            objc_msgSend(v3, "setObject:atIndexedSubscript:", v11, 0);
          else
            objc_msgSend(v3, "addObject:", v11);
          -[VoiceChatSessionRoster sendBeacon:ToPeer:](self, "sendBeacon:ToPeer:", buf, v3);
          objc_msgSend(v12, "setNeedsSend:", 0);
          if (objc_msgSend(v12, "typeToSend"))
            v15 = 2;
          else
            v15 = 1;
          objc_msgSend(v12, "setSentState:", v15);
        }
        if (++v8 >= v7)
        {
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
          if (!v16)
            break;
          v7 = v16;
          v8 = 0;
        }
      }
    }
    self->_needsUpdateBeaconList = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v4)
          v19 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        else
          v19 = "<nil>";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VoiceChatSessionRoster sendBeacons]";
        v26 = 1024;
        v27 = 1475;
        v28 = 2080;
        v29 = v19;
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendBeacons : sendPeerList %s ", buf, 0x26u);
      }
    }

  }
}

- (void)calculateFocus:(id)a3
{
  unsigned int focusID;
  unsigned int chosenFocusRating;
  NSMutableArray *connectedPeers;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int focusRating;
  NSString **p_peerID;
  int v18;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  GKVoiceChatSessionInternal *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v24 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(MEMORY[0x24BDD17F0], "sleepUntilDate:", a3);
  pthread_mutex_lock(&self->resMutex);
  chosenFocusRating = self->_chosenFocusRating;
  focusID = self->_focusID;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  connectedPeers = self->_connectedPeers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(connectedPeers);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", v12);
        if (objc_msgSend(v13, "receivedState") == 1)
        {
          v14 = objc_msgSend(v13, "lastReceivedBeacon");
          v15 = *(_DWORD *)(v14 + 12);
          if (v15 > chosenFocusRating
            || v15 == chosenFocusRating && focusID > objc_msgSend(v12, "longLongValue"))
          {
            focusID = objc_msgSend(v12, "longLongValue");
            chosenFocusRating = *(_DWORD *)(v14 + 12);
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v9);
  }
  focusRating = self->_focusRating;
  if (focusRating <= chosenFocusRating)
  {
    if (chosenFocusRating != focusRating)
      goto LABEL_18;
    p_peerID = &self->_peerID;
    if (focusID <= -[NSString longLongValue](self->_peerID, "longLongValue"))
      goto LABEL_18;
  }
  else
  {
    p_peerID = &self->_peerID;
    chosenFocusRating = self->_focusRating;
  }
  focusID = -[NSString longLongValue](*p_peerID, "longLongValue");
LABEL_18:
  if (focusID == self->_focusID)
  {
    v18 = 0;
  }
  else
  {
    self->_focusID = focusID;
    v18 = 1;
  }
  self->_chosenFocusRating = chosenFocusRating;
  self->_waitingToCalculateFocus = 0;
  self->_hasFocus = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_chosenFocusRating;
      v21 = self->_focusID;
      *(_DWORD *)buf = 136316418;
      v30 = v19;
      v31 = 2080;
      v32 = "-[VoiceChatSessionRoster calculateFocus:]";
      v33 = 1024;
      v34 = 1545;
      v35 = 1024;
      v36 = v21;
      v37 = 1024;
      v38 = v22;
      v39 = 1024;
      v40 = v18;
      _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The focus that we calculated is %u with value %d.  did change? %d", buf, 0x2Eu);
    }
  }
  v23 = self->_gkvs;
  pthread_mutex_unlock(&self->resMutex);
  -[GKVoiceChatSessionInternal updatedFocusID:](v23, "updatedFocusID:", self->_focusID);

}

- (void)peer:(id)a3 didChangeState:(unsigned int)a4
{
  _opaque_pthread_mutex_t *p_resMutex;
  void *v8;
  VoiceChatSessionBeaconState *v9;
  int v10;
  _BOOL4 v11;
  unsigned int focusID;
  uint64_t v13;
  NSObject *v14;
  NSMutableArray *connectedPeers;
  const char *v16;
  GKVoiceChatSessionInternal *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  if (a4 == 5)
  {
LABEL_4:
    if ((-[NSMutableArray containsObject:](self->_connectedPeers, "containsObject:", a3) & 1) == 0)
    {
      self->_needsUpdateBeaconList = 1;
      v8 = (void *)objc_msgSend(a3, "copy");
      -[NSMutableArray addObject:](self->_connectedPeers, "addObject:", v8);
      v9 = objc_alloc_init(VoiceChatSessionBeaconState);
      -[VoiceChatSessionBeaconState setNeedsSend:](v9, "setNeedsSend:", 1);
      -[VoiceChatSessionBeaconState setTypeToSend:](v9, "setTypeToSend:", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_peerStateTable, "setObject:forKeyedSubscript:", v9, v8);

    }
    goto LABEL_12;
  }
  if (a4 != 3)
  {
    if (a4 == 2)
      goto LABEL_4;
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  if (!-[NSMutableArray containsObject:](self->_connectedPeers, "containsObject:", a3))
    goto LABEL_12;
  v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", a3), "receivedState");
  v11 = v10 == 1;
  if (v10 == 1)
  {
    focusID = self->_focusID;
    if (focusID == objc_msgSend(a3, "longLongValue"))
    {
      self->_chosenFocusRating = 0;
      self->_focusID = 0;
      self->_hasFocus = 0;
      if (!self->_waitingToCalculateFocus)
      {
        self->_waitingToCalculateFocus = 1;
        objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5));
      }
    }
  }
  -[NSMutableArray removeObject:](self->_connectedPeers, "removeObject:", a3);
  -[NSMutableDictionary removeObjectForKey:](self->_peerStateTable, "removeObjectForKey:", a3);
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      connectedPeers = self->_connectedPeers;
      if (connectedPeers)
        v16 = (const char *)objc_msgSend((id)-[NSMutableArray description](connectedPeers, "description"), "UTF8String");
      else
        v16 = "<nil>";
      v18 = 136315906;
      v19 = v13;
      v20 = 2080;
      v21 = "-[VoiceChatSessionRoster peer:didChangeState:]";
      v22 = 1024;
      v23 = 1606;
      v24 = 2080;
      v25 = v16;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VoiceChatSessionRoster: is connected %s", (uint8_t *)&v18, 0x26u);
    }
  }
  if (self->_needsUpdateBeaconList)
    -[VoiceChatSessionRoster sendBeacons](self, "sendBeacons");
  v17 = self->_gkvs;
  pthread_mutex_unlock(p_resMutex);
  if (v11)
    -[GKVoiceChatSessionInternal updatedSubscribedBeaconList:](v17, "updatedSubscribedBeaconList:", -[VoiceChatSessionRoster subscribedPeers](self, "subscribedPeers"));

}

- (void)receivedBeacon:(id)a3 fromPeer:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  GKVoiceChatSessionInternal *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  pthread_mutex_lock(&self->resMutex);
  v8 = objc_msgSend(a3, "bytes");
  *(int8x8_t *)v8 = vrev32_s8(*(int8x8_t *)v8);
  *(int8x8_t *)(v8 + 12) = vrev32_s8(*(int8x8_t *)(v8 + 12));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_DWORD *)(v8 + 4);
      if (a4)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v12 = "<nil>";
      v18 = 136316162;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VoiceChatSessionRoster receivedBeacon:fromPeer:]";
      v22 = 1024;
      v23 = 1635;
      v24 = 1024;
      v25 = v11;
      v26 = 2080;
      v27 = v12;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Session sent stream %u from %s", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if (a4 && -[NSMutableArray containsObject:](self->_connectedPeers, "containsObject:", a4))
  {
    v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", a4);
    objc_msgSend(v13, "setLastReceivedBeacon:", v8);
    v14 = *(_DWORD *)(v8 + 4);
    if (v14 == 1)
    {
      -[VoiceChatSessionRoster processUnsubscribeBeacon:beaconState:fromPeer:](self, "processUnsubscribeBeacon:beaconState:fromPeer:", v8, v13, a4);
    }
    else if (v14)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v18 = 136315650;
          v19 = v15;
          v20 = 2080;
          v21 = "-[VoiceChatSessionRoster receivedBeacon:fromPeer:]";
          v22 = 1024;
          v23 = 1655;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Don't understand beacon type", (uint8_t *)&v18, 0x1Cu);
        }
      }
    }
    else
    {
      -[VoiceChatSessionRoster processSubscribeBeacon:beaconState:fromPeer:](self, "processSubscribeBeacon:beaconState:fromPeer:", v8, v13, a4);
    }
  }
  if (self->_needsUpdateBeaconList)
    -[VoiceChatSessionRoster sendBeacons](self, "sendBeacons");
  v17 = self->_gkvs;
  pthread_mutex_unlock(&self->resMutex);
  -[GKVoiceChatSessionInternal updatedSubscribedBeaconList:](v17, "updatedSubscribedBeaconList:", -[VoiceChatSessionRoster subscribedPeers](self, "subscribedPeers"));

}

- (void)processUnsubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5
{
  GKVoiceChatPeerInfoProvider *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  unsigned int focusID;
  unsigned int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = -[VoiceChatSessionRoster gameStateSession](self, "gameStateSession");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKVoiceChatPeerInfoProvider displayNameForPeer:](v9, "displayNameForPeer:", -[GKVoiceChatSessionInternal encodePeerID:](self->_gkvs, "encodePeerID:", a5)))
      {
        v12 = (const char *)objc_msgSend((id)objc_msgSend((id)-[GKVoiceChatPeerInfoProvider displayNameForPeer:](v9, "displayNameForPeer:", -[GKVoiceChatSessionInternal encodePeerID:](self->_gkvs, "encodePeerID:", a5)), "description"), "UTF8String");
        if (a5)
        {
LABEL_5:
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
LABEL_8:
          focusID = self->_focusID;
          v16 = 136316418;
          v17 = v10;
          v18 = 2080;
          v19 = "-[VoiceChatSessionRoster processUnsubscribeBeacon:beaconState:fromPeer:]";
          v20 = 1024;
          v21 = 1681;
          v22 = 2080;
          v23 = v12;
          v24 = 2080;
          v25 = v13;
          v26 = 1024;
          v27 = focusID;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processUnsubscribeBeacon from %s (%s), _focusID = %u", (uint8_t *)&v16, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        v12 = "<nil>";
        if (a5)
          goto LABEL_5;
      }
      v13 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  if (a3->var1 == 1)
  {
    v15 = self->_focusID;
    if (v15 == objc_msgSend(a5, "longLongValue"))
    {
      self->_chosenFocusRating = 0;
      self->_focusID = 0;
      self->_hasFocus = 0;
      if (!self->_waitingToCalculateFocus)
      {
        self->_waitingToCalculateFocus = 1;
        objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5));
      }
    }
    objc_msgSend(a4, "setReceivedState:", 2);
  }
}

- (void)processSubscribeBeacon:(tagVoiceChatBeacon *)a3 beaconState:(id)a4 fromPeer:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  unsigned int focusID;
  unsigned int chosenFocusRating;
  unsigned int var3;
  unsigned int v13;
  unsigned int var0;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a3->var1)
  {
    if (self->_focusID == objc_msgSend(a5, "longLongValue"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          chosenFocusRating = self->_chosenFocusRating;
          focusID = self->_focusID;
          var3 = a3->var3;
          v19 = 136316418;
          v20 = v8;
          v21 = 2080;
          v22 = "-[VoiceChatSessionRoster processSubscribeBeacon:beaconState:fromPeer:]";
          v23 = 1024;
          v24 = 1709;
          v25 = 1024;
          v26 = focusID;
          v27 = 1024;
          v28 = chosenFocusRating;
          v29 = 1024;
          v30 = var3;
          _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processSubscribeBeacon: Our focus %d changed rating from %d to %d", (uint8_t *)&v19, 0x2Eu);
        }
      }
      v13 = a3->var3;
      self->_chosenFocusRating = v13;
    }
    else
    {
      v13 = self->_chosenFocusRating;
    }
    if (a3->var3 >= v13 && !self->_waitingToCalculateFocus)
    {
      self->_waitingToCalculateFocus = 1;
      objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_calculateFocus_, self, objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.5));
    }
    var0 = a3->var0;
    if (var0 != objc_msgSend(a4, "sentState"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v17 = a3->var0;
          v18 = objc_msgSend(a4, "sentState");
          v19 = 136316162;
          v20 = v15;
          v21 = 2080;
          v22 = "-[VoiceChatSessionRoster processSubscribeBeacon:beaconState:fromPeer:]";
          v23 = 1024;
          v24 = 1725;
          v25 = 1024;
          v26 = v17;
          v27 = 1024;
          v28 = v18;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d beaconHeader->receivedState = %d, beaconState.sentState = %d", (uint8_t *)&v19, 0x28u);
        }
      }
      objc_msgSend(a4, "setNeedsSend:", 1);
      self->_needsUpdateBeaconList = 1;
    }
    objc_msgSend(a4, "setReceivedState:", 1);
  }
}

- (id)subscribedPeers
{
  _opaque_pthread_mutex_t *p_resMutex;
  void *v4;
  NSMutableArray *connectedPeers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  p_resMutex = &self->resMutex;
  pthread_mutex_lock(&self->resMutex);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_connectedPeers);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  connectedPeers = self->_connectedPeers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(connectedPeers);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_peerStateTable, "objectForKeyedSubscript:", v10), "receivedState") != 1)objc_msgSend(v4, "removeObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectedPeers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  pthread_mutex_unlock(p_resMutex);
  return v4;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

@end
