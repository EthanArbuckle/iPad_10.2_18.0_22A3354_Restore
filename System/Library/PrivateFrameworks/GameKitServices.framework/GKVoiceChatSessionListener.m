@implementation GKVoiceChatSessionListener

- (GKVoiceChatSessionListener)initWithSession:(id)a3
{
  GKVoiceChatSessionListener *v4;
  GKVoiceChatSessionListener *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKVoiceChatSessionListener;
  v4 = -[GKVoiceChatSessionListener init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_gkSession = (GKSessionInternal *)a3;
    v4->_conferenceList = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v5->_rwlock = objc_alloc_init(GKRWLock);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionListener;
  -[GKVoiceChatSessionListener dealloc](&v3, sel_dealloc);
}

- (void)registerNewGKVoiceChatSession:(id)a3
{
  -[GKRWLock wrlock](self->_rwlock, "wrlock");
  if ((-[NSMutableArray containsObject:](self->_conferenceList, "containsObject:", a3) & 1) == 0)
    -[NSMutableArray addObject:](self->_conferenceList, "addObject:", a3);
  -[GKRWLock unlock](self->_rwlock, "unlock");
}

- (void)removeSession:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[GKRWLock wrlock](self->_rwlock, "wrlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[GKVoiceChatSessionListener removeSession:]";
      v11 = 1024;
      v12 = 50;
      v13 = 2048;
      v14 = a3;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSessionListener removing listener %p", (uint8_t *)&v7, 0x26u);
    }
  }
  -[NSMutableArray removeObject:](self->_conferenceList, "removeObject:", a3);
  -[GKRWLock unlock](self->_rwlock, "unlock");
}

- (id)currentSessions
{
  void *v3;

  -[GKRWLock wrlock](self->_rwlock, "wrlock");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_conferenceList);
  -[GKRWLock unlock](self->_rwlock, "unlock");
  return v3;
}

- (void)receivedNewVoiceChatOOBMessage:(id)a3 fromPeerID:(id)a4
{
  NSMutableArray *conferenceList;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[GKRWLock rdlock](self->_rwlock, "rdlock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  conferenceList = self->_conferenceList;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](conferenceList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(conferenceList);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "conferenceID");
        if (v13 == objc_msgSend(a3, "conferenceID"))
          objc_msgSend(v12, "session:didReceiveOOBAudioPacket:fromPeerID:", self->_gkSession, a3, a4);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](conferenceList, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  -[GKRWLock unlock](self->_rwlock, "unlock");
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5
{
  uint64_t v5;
  NSMutableArray *conferenceList;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v5 = *(_QWORD *)&a5;
  v18 = *MEMORY[0x24BDAC8D0];
  -[GKRWLock rdlock](self->_rwlock, "rdlock", a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  conferenceList = self->_conferenceList;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](conferenceList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(conferenceList);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "session:peer:didChangeState:", self->_gkSession, a4, v5);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](conferenceList, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
  -[GKRWLock unlock](self->_rwlock, "unlock");
}

@end
