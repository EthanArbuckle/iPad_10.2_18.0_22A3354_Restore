@implementation GKSessionInternal

- (BOOL)isShuttingDown
{
  return self->_shutdown;
}

- (id)newNSErrorFromHRESULT:(int)a3 description:(id)a4 reason:(id)a5
{
  void *v6;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v6 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a4 && a5)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a4, *MEMORY[0x24BDD0FC8], a5, *MEMORY[0x24BDD0FD8], 0);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.gamekit.GKSessionErrorDomain"), a3, v6);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v11;
      v16 = 2080;
      v17 = "-[GKSessionInternal(_private) newNSErrorFromHRESULT:description:reason:]";
      v18 = 1024;
      v19 = 733;
      v20 = 1024;
      v21 = a3;
      v22 = 2112;
      v23 = objc_msgSend(v10, "localizedDescription");
      _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error: %d -- %@.", buf, 0x2Cu);
    }
  }
  return v10;
}

- (id)newNSErrorFromGKSessionError:(int)a3 description:(id)a4 reason:(id)a5
{
  void *v6;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v6 = 0;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a4 && a5)
  {
    v9 = objc_alloc(MEMORY[0x24BDBCE70]);
    v6 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a4, *MEMORY[0x24BDD0FC8], a5, *MEMORY[0x24BDD0FD8], 0);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.gamekit.GKSessionErrorDomain"), a3, v6);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v15 = v11;
      v16 = 2080;
      v17 = "-[GKSessionInternal(_private) newNSErrorFromGKSessionError:description:reason:]";
      v18 = 1024;
      v19 = 747;
      v20 = 1024;
      v21 = a3;
      v22 = 2112;
      v23 = objc_msgSend(v10, "localizedDescription");
      _os_log_error_impl(&dword_215C5C000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Error: %d -- %@.", buf, 0x2Cu);
    }
  }
  return v10;
}

- (void)setDisplayName:(id)a3 forPeer:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSString *displayName;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", *(_QWORD *)&a4);
  if (v7)
  {
    v8 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v8, "displayName");
        displayName = self->_displayName;
        v16 = 136316674;
        v17 = v9;
        v18 = 2080;
        v19 = "-[GKSessionInternal(_private) setDisplayName:forPeer:]";
        v20 = 1024;
        v21 = 768;
        v22 = 1024;
        v23 = v4;
        v24 = 2112;
        v25 = v11;
        v26 = 2112;
        v27 = a3;
        v28 = 2112;
        v29 = displayName;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setDisplayNameForPeer: %d => %@ (try set to %@)  (this is %@)", (uint8_t *)&v16, 0x40u);
      }
    }
    objc_msgSend(v8, "tryDetruncateDisplayName:", a3);
    a3 = (id)objc_msgSend(v8, "displayName");
  }
  -[GKTable setObject:forKey:](self->_peerNameTable, "setObject:forKey:", a3, v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_displayName;
      v16 = 136316418;
      v17 = v13;
      v18 = 2080;
      v19 = "-[GKSessionInternal(_private) setDisplayName:forPeer:]";
      v20 = 1024;
      v21 = 775;
      v22 = 1024;
      v23 = v4;
      v24 = 2112;
      v25 = (uint64_t)a3;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setDisplayNameForPeer: %d => %@  (this is %@)", (uint8_t *)&v16, 0x36u);
    }
  }
}

- (void)tellDelegate_sessionDidFailWithError:(id)a3
{
  uint64_t v4;
  GKSessionInternal *v5;
  GKSessionDelegate *v6;

  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_sessionDidFailWithError:].cold.1();
    }

  }
  else
  {
    v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSError"));
    v5 = self;
    pthread_mutex_lock(&self->_delegateLock);
    v6 = -[GKSessionInternal delegate](self, "delegate");
    -[GKSessionDelegate session:didFailWithError:](v6, "session:didFailWithError:", self->_session, v4);

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (void)tellDelegate_didConnectPeer:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  GKSessionDelegate *v8;
  GKSessionPrivateDelegate *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  unint64_t maxPeers;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  unint64_t v25;
  const char *v26;
  const char *v27;
  int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  _BYTE v40[10];
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_didConnectPeer:].cold.1();
    }
    goto LABEL_37;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
  v28 = 0;
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
  v7 = 2;
  if (v6)
  {
    objc_msgSend(v6, "getBytes:length:", &v28, 4);
    if (v28)
      v7 = 5;
    else
      v7 = 2;
  }
  pthread_mutex_lock(&self->_delegateLock);
  v8 = -[GKSessionInternal delegate](self, "delegate");
  v9 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
      {
        v27 = (const char *)objc_msgSend((id)-[GKSessionPrivateDelegate description](v9, "description"), "UTF8String");
        if (v8)
          goto LABEL_13;
      }
      else
      {
        v27 = "<nil>";
        if (v8)
        {
LABEL_13:
          v26 = (const char *)objc_msgSend((id)-[GKSessionDelegate description](v8, "description"), "UTF8String");
          if (v5)
          {
LABEL_14:
            v12 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
LABEL_18:
            v13 = -[GKList count](self->_peersConnected, "count");
            maxPeers = self->maxPeers;
            *(_DWORD *)buf = 136316930;
            v30 = v10;
            v31 = 2080;
            v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
            v33 = 1024;
            v34 = 820;
            v35 = 2080;
            v36 = (void *)v27;
            v37 = 2080;
            v38 = v26;
            v39 = 2080;
            *(_QWORD *)v40 = v12;
            *(_WORD *)&v40[8] = 1024;
            v41 = v13 + 1;
            v42 = 1024;
            v43 = maxPeers;
            _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%s, %s]: didConnectToPeer: %s -- cur/max: %d/%d", buf, 0x46u);
            goto LABEL_19;
          }
LABEL_17:
          v12 = "<nil>";
          goto LABEL_18;
        }
      }
      v26 = "<nil>";
      if (v5)
        goto LABEL_14;
      goto LABEL_17;
    }
  }
LABEL_19:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v17 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v17 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v30 = v15;
      v31 = 2080;
      v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
      v33 = 1024;
      v34 = 822;
      v35 = 2080;
      v36 = (void *)v17;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-connect-to-peer.%s", buf, 0x26u);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[GKList count](self->_peersConnected, "count");
        v21 = self->maxPeers;
        *(_DWORD *)buf = 136316674;
        v30 = v18;
        v31 = 2080;
        v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
        v33 = 1024;
        v34 = 825;
        v35 = 2112;
        v36 = v9;
        v37 = 2112;
        v38 = (const char *)v5;
        v39 = 1024;
        *(_DWORD *)v40 = v20 + 1;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v21;
        _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: didConnectToPeer: %@ -- cur/max: %d/%d", buf, 0x3Cu);
      }
    }
    -[GKSessionPrivateDelegate session:peer:didChangeState:](v9, "session:peer:didChangeState:", self->_session, v5, v7);
  }
  if (v8 != v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v24 = -[GKList count](self->_peersConnected, "count");
        v25 = self->maxPeers;
        *(_DWORD *)buf = 136316674;
        v30 = v22;
        v31 = 2080;
        v32 = "-[GKSessionInternal(_private) tellDelegate_didConnectPeer:]";
        v33 = 1024;
        v34 = 830;
        v35 = 2112;
        v36 = v8;
        v37 = 2112;
        v38 = (const char *)v5;
        v39 = 1024;
        *(_DWORD *)v40 = v24 + 1;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)&v40[6] = v25;
        _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: didConnectToPeer: %@ -- cur/max: %d/%d", buf, 0x3Cu);
      }
    }
    -[GKSessionDelegate session:peer:didChangeState:](v8, "session:peer:didChangeState:", self->_session, v5, v7);
  }

  pthread_mutex_unlock(&self->_delegateLock);
  -[GKVoiceChatSessionListener session:peer:didChangeState:](self->_voiceChatListener, "session:peer:didChangeState:", self, v5, v7);
LABEL_37:

}

- (void)tellDelegate_didDisconnectPeer:(id)a3
{
  void *v5;
  GKSessionDelegate *v6;
  GKSessionPrivateDelegate *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  int v12;
  unint64_t maxPeers;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  GKSessionInternal *v17;
  const char *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:].cold.1();
    }
    goto LABEL_27;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
  pthread_mutex_lock(&self->_delegateLock);
  v6 = -[GKSessionInternal delegate](self, "delegate");
  v7 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        v18 = (const char *)objc_msgSend((id)-[GKSessionPrivateDelegate description](v7, "description"), "UTF8String");
        if (v6)
          goto LABEL_9;
      }
      else
      {
        v18 = "<nil>";
        if (v6)
        {
LABEL_9:
          v10 = (const char *)objc_msgSend((id)-[GKSessionDelegate description](v6, "description"), "UTF8String");
          if (v5)
          {
LABEL_10:
            v11 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
LABEL_14:
            v12 = -[GKList count](self->_peersConnected, "count");
            maxPeers = self->maxPeers;
            *(_DWORD *)buf = 136316930;
            v20 = v8;
            v21 = 2080;
            v22 = "-[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:]";
            v23 = 1024;
            v24 = 856;
            v25 = 2080;
            v26 = v18;
            v27 = 2080;
            v28 = v10;
            v29 = 2080;
            v30 = v11;
            v31 = 1024;
            v32 = v12 + 1;
            v33 = 1024;
            v34 = maxPeers;
            _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tell [%s, %s] didDisconnectFromPeer: %s -- cur/max: %d/%d", buf, 0x46u);
            goto LABEL_15;
          }
LABEL_13:
          v11 = "<nil>";
          goto LABEL_14;
        }
      }
      v10 = "<nil>";
      if (v5)
        goto LABEL_10;
      goto LABEL_13;
    }
  }
LABEL_15:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v16 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      else
        v16 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v20 = v14;
      v21 = 2080;
      v22 = "-[GKSessionInternal(_private) tellDelegate_didDisconnectPeer:]";
      v23 = 1024;
      v24 = 858;
      v25 = 2080;
      v26 = v16;
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-disconnect-from-peer.%s", buf, 0x26u);
    }
  }
  v17 = self;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[GKSessionPrivateDelegate session:peer:didChangeState:](v7, "session:peer:didChangeState:", self->_session, v5, 3);
  if (v6 != v7 && (objc_opt_respondsToSelector() & 1) != 0)
    -[GKSessionDelegate session:peer:didChangeState:](v6, "session:peer:didChangeState:", self->_session, v5, 3);

  pthread_mutex_unlock(&self->_delegateLock);
  -[GKVoiceChatSessionListener session:peer:didChangeState:](self->_voiceChatListener, "session:peer:didChangeState:", self, v5, 3);

LABEL_27:
}

- (void)tellDelegate_isConnectingPeer:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  GKSessionDelegate *v12;
  GKSessionPrivateDelegate *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_isConnectingPeer:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v8 = "<nil>";
        v14 = 136315906;
        v15 = v6;
        v16 = 2080;
        v17 = "-[GKSessionInternal(_private) tellDelegate_isConnectingPeer:]";
        v18 = 1024;
        v19 = 891;
        v20 = 2080;
        v21 = v8;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isConnectingPeer: %s", (uint8_t *)&v14, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v11 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v11 = "<nil>";
        v14 = 136315906;
        v15 = v9;
        v16 = 2080;
        v17 = "-[GKSessionInternal(_private) tellDelegate_isConnectingPeer:]";
        v18 = 1024;
        v19 = 892;
        v20 = 2080;
        v21 = v11;
        _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d is-connecting-to-peer.%s", (uint8_t *)&v14, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v12 = -[GKSessionInternal delegate](self, "delegate");
    v13 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionPrivateDelegate session:peer:didChangeState:](v13, "session:peer:didChangeState:", self->_session, v5, 4);
    if (v12 != v13 && (objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionDelegate session:peer:didChangeState:](v12, "session:peer:didChangeState:", self->_session, v5, 4);

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_peerDidBecomeAvailable:(id)a3
{
  char *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  GKSessionDelegate *v11;
  GKSessionPrivateDelegate *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:].cold.1();
    }
  }
  else
  {
    v5 = (char *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:]";
        v17 = 1024;
        v18 = 919;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerDidBecomeAvailable: %@", (uint8_t *)&v13, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v10 = "<nil>";
        v13 = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeAvailable:]";
        v17 = 1024;
        v18 = 921;
        v19 = 2080;
        v20 = v10;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-available.%s", (uint8_t *)&v13, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v11 = -[GKSessionInternal delegate](self, "delegate");
    v12 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionPrivateDelegate session:peer:didChangeState:](v12, "session:peer:didChangeState:", self->_session, v5, 0);
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionDelegate session:peer:didChangeState:](v11, "session:peer:didChangeState:", self->_session, v5, 0);

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_peerDidBecomeUnavailable:(id)a3
{
  char *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  GKSessionDelegate *v11;
  GKSessionPrivateDelegate *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:].cold.1();
    }
  }
  else
  {
    v5 = (char *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:]";
        v17 = 1024;
        v18 = 948;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peerDidBecomeUnavailable: %@", (uint8_t *)&v13, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v10 = "<nil>";
        v13 = 136315906;
        v14 = v8;
        v15 = 2080;
        v16 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeUnavailable:]";
        v17 = 1024;
        v18 = 950;
        v19 = 2080;
        v20 = v10;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-unavailable.%s", (uint8_t *)&v13, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v11 = -[GKSessionInternal delegate](self, "delegate");
    v12 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionPrivateDelegate session:peer:didChangeState:](v12, "session:peer:didChangeState:", self->_session, v5, 1);
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionDelegate session:peer:didChangeState:](v11, "session:peer:didChangeState:", self->_session, v5, 1);

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_didReceiveBand_RetryICE:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  GKSessionDOOBReceiveHandler *v6;

  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_didReceiveBand_RetryICE:].cold.1();
    }

  }
  else
  {
    v4 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
    pthread_mutex_lock(&self->_delegateLock);
    v6 = self->_doobReceiveHandler[1];
    if (v6)
      -[GKSessionDOOBReceiveHandler receiveDOOB:fromPeer:inSession:context:](v6, "receiveDOOB:fromPeer:inSession:context:", v5, v4, self->_session, self->_doobReceiveHandlerContext[1]);
    pthread_mutex_unlock(&self->_delegateLock);

  }
}

- (void)tellDelegate_didReceiveData:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  GKSessionDelegate *v18;
  __int16 v19;
  GKSessionPrivateDelegate *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!self->_shutdown)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
    pthread_mutex_lock(&self->_delegateLock);
    v7 = -[GKSessionInternal dataReceiveHandler](self, "dataReceiveHandler");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      v10 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316674;
          v12 = v8;
          v13 = 2080;
          v14 = "-[GKSessionInternal(_private) tellDelegate_didReceiveData:]";
          v15 = 1024;
          v16 = 1000;
          v17 = 2048;
          v18 = -[GKSessionInternal delegate](self, "delegate");
          v19 = 2048;
          v20 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
          v21 = 1024;
          v22 = objc_msgSend(v6, "length");
          v23 = 2080;
          v24 = objc_msgSend(v5, "UTF8String");
          _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", buf, 0x40u);
          if (!v7)
            goto LABEL_13;
          goto LABEL_12;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316674;
        v12 = v8;
        v13 = 2080;
        v14 = "-[GKSessionInternal(_private) tellDelegate_didReceiveData:]";
        v15 = 1024;
        v16 = 1000;
        v17 = 2048;
        v18 = -[GKSessionInternal delegate](self, "delegate");
        v19 = 2048;
        v20 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
        v21 = 1024;
        v22 = objc_msgSend(v6, "length");
        v23 = 2080;
        v24 = objc_msgSend(v5, "UTF8String");
        _os_log_debug_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", buf, 0x40u);
        if (!v7)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    if (!v7)
    {
LABEL_13:

      pthread_mutex_unlock(&self->_delegateLock);
      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(v7, "receiveData:fromPeer:inSession:context:", v6, v5, self->_session, self->_dataReceiveHandlerContext);
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKSessionInternal(_private) tellDelegate_didReceiveData:].cold.1();
  }
LABEL_14:

}

- (void)tellDelegate_didReceiveDataFromPeerWithContext:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE v22[18];
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:].cold.1();
    }
    goto LABEL_16;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("data"));
  v7 = -[GKSessionInternal dataReceiveHandler](self, "dataReceiveHandler");
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_11;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x24BDFDC28];
  v10 = *MEMORY[0x24BDFDC28];
  if (*MEMORY[0x24BDFDC18])
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316674;
      v16 = v8;
      v17 = 2080;
      v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
      v19 = 1024;
      v20 = 1024;
      v21 = 2048;
      *(_QWORD *)v22 = -[GKSessionInternal delegate](self, "delegate");
      *(_WORD *)&v22[8] = 2048;
      *(_QWORD *)&v22[10] = -[GKSessionInternal privateDelegate](self, "privateDelegate");
      v23 = 1024;
      v24 = objc_msgSend(v6, "length");
      v25 = 2080;
      v26 = objc_msgSend(v5, "UTF8String");
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", (uint8_t *)&v15, 0x40u);
      if (!v7)
        goto LABEL_16;
      goto LABEL_12;
    }
LABEL_11:
    if (!v7)
      goto LABEL_16;
    goto LABEL_12;
  }
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    goto LABEL_11;
  v15 = 136316674;
  v16 = v8;
  v17 = 2080;
  v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
  v19 = 1024;
  v20 = 1024;
  v21 = 2048;
  *(_QWORD *)v22 = -[GKSessionInternal delegate](self, "delegate");
  *(_WORD *)&v22[8] = 2048;
  *(_QWORD *)&v22[10] = -[GKSessionInternal privateDelegate](self, "privateDelegate");
  v23 = 1024;
  v24 = objc_msgSend(v6, "length");
  v25 = 2080;
  v26 = objc_msgSend(v5, "UTF8String");
  _os_log_debug_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d tellDelegate[%p, %p]_didReceiveData of length [%d] from [%s]", (uint8_t *)&v15, 0x40u);
  if (!v7)
    goto LABEL_16;
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v6, "length");
      v14 = objc_msgSend(v5, "UTF8String");
      v15 = 136316162;
      v16 = v11;
      v17 = 2080;
      v18 = "-[GKSessionInternal(_private) tellDelegate_didReceiveDataFromPeerWithContext:]";
      v19 = 1024;
      v20 = 1027;
      v21 = 1024;
      *(_DWORD *)v22 = v13;
      *(_WORD *)&v22[4] = 2080;
      *(_QWORD *)&v22[6] = v14;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Inform handler did receiveVoiceChatData of length=%d from peerID=%s", (uint8_t *)&v15, 0x2Cu);
    }
  }
  objc_msgSend(v7, "receiveVoiceChatData:fromPeer:", v6, v5);
LABEL_16:

}

- (void)tellDelegate_gotInvited:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  GKSessionDelegate *v9;
  GKSessionPrivateDelegate *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_gotInvited:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v8 = "<nil>";
        v15 = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
        v19 = 1024;
        v20 = 1043;
        v21 = 2080;
        v22 = (void *)v8;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d did-receive-connection-request-from-peer.%s", (uint8_t *)&v15, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v9 = -[GKSessionInternal delegate](self, "delegate");
    v10 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316162;
          v16 = v11;
          v17 = 2080;
          v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
          v19 = 1024;
          v20 = 1049;
          v21 = 2112;
          v22 = v10;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ didReceiveConnectionRequestFromPeer: %@", (uint8_t *)&v15, 0x30u);
        }
      }
      -[GKSessionPrivateDelegate session:didReceiveConnectionRequestFromPeer:](v10, "session:didReceiveConnectionRequestFromPeer:", self->_session, v5);
    }
    if (v9 != v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136316162;
          v16 = v13;
          v17 = 2080;
          v18 = "-[GKSessionInternal(_private) tellDelegate_gotInvited:]";
          v19 = 1024;
          v20 = 1053;
          v21 = 2112;
          v22 = v9;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ didReceiveConnectionRequestFromPeer: %@", (uint8_t *)&v15, 0x30u);
        }
      }
      -[GKSessionDelegate session:didReceiveConnectionRequestFromPeer:](v9, "session:didReceiveConnectionRequestFromPeer:", self->_session, v5);
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_connectionRequestToPeerFailed:(id)a3
{
  void *v5;
  uint64_t v6;
  GKSessionInternal *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  GKSessionDelegate *v11;
  GKSessionPrivateDelegate *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSError"));
    v7 = self;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v10 = "<nil>";
        v17 = 136315906;
        v18 = v8;
        v19 = 2080;
        v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
        v21 = 1024;
        v22 = 1076;
        v23 = 2080;
        v24 = (void *)v10;
        _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connection-request-to-peer-failed.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v11 = -[GKSessionInternal delegate](self, "delegate");
    v12 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136316162;
          v18 = v13;
          v19 = 2080;
          v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
          v21 = 1024;
          v22 = 1082;
          v23 = 2112;
          v24 = v12;
          v25 = 2112;
          v26 = v5;
          _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ connectionRequestToPeerFailed: %@", (uint8_t *)&v17, 0x30u);
        }
      }
      -[GKSessionPrivateDelegate session:connectionWithPeerFailed:withError:](v12, "session:connectionWithPeerFailed:withError:", self->_session, v5, v6);
    }
    if (v11 != v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136316162;
          v18 = v15;
          v19 = 2080;
          v20 = "-[GKSessionInternal(_private) tellDelegate_connectionRequestToPeerFailed:]";
          v21 = 1024;
          v22 = 1086;
          v23 = 2112;
          v24 = v11;
          v25 = 2112;
          v26 = v5;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ connectionRequestToPeerFailed: %@", (uint8_t *)&v17, 0x30u);
        }
      }
      -[GKSessionDelegate session:connectionWithPeerFailed:withError:](v11, "session:connectionWithPeerFailed:withError:", self->_session, v5, v6);
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_peerDidBecomeBusy:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  GKSessionPrivateDelegate *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v8 = "<nil>";
        v12 = 136315906;
        v13 = v6;
        v14 = 2080;
        v15 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:]";
        v16 = 1024;
        v17 = 1107;
        v18 = 2080;
        v19 = (void *)v8;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer-did-become-busy.%s", (uint8_t *)&v12, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v9 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136316162;
          v13 = v10;
          v14 = 2080;
          v15 = "-[GKSessionInternal(_private) tellDelegate_peerDidBecomeBusy:]";
          v16 = 1024;
          v17 = 1112;
          v18 = 2112;
          v19 = v9;
          v20 = 2112;
          v21 = v5;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: peerDidBecomeBusy: %@", (uint8_t *)&v12, 0x30u);
        }
      }
      -[GKSessionPrivateDelegate session:peerDidBecomeBusy:](v9, "session:peerDidBecomeBusy:", self->_session, v5);
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }

}

- (void)tellDelegate_initiateRelay:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  GKSessionPrivateDelegate *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_initiateRelay:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dict"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v9 = "<nil>";
        v17 = 136315906;
        v18 = v7;
        v19 = 2080;
        v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
        v21 = 1024;
        v22 = 1130;
        v23 = 2080;
        v24 = (void *)v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initiate-relay.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v10;
        v19 = 2080;
        v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
        v21 = 1024;
        v22 = 1132;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_initiateRelay", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled"))
    {
      pthread_mutex_lock(&self->_delegateLock);
      v12 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136316418;
            v18 = v13;
            v19 = 2080;
            v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
            v21 = 1024;
            v22 = 1141;
            v23 = 2112;
            v24 = v12;
            v25 = 2112;
            v26 = v6;
            v27 = 2112;
            v28 = v5;
            _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        -[GKSessionPrivateDelegate session:initiateRelay:forPeer:](v12, "session:initiateRelay:forPeer:", self->_session, v6, v5);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136316418;
            v18 = v15;
            v19 = 2080;
            v20 = "-[GKSessionInternal(_private) tellDelegate_initiateRelay:]";
            v21 = 1024;
            v22 = 1146;
            v23 = 2112;
            v24 = v12;
            v25 = 2112;
            v26 = v6;
            v27 = 2112;
            v28 = v5;
            _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        -[GKSessionPrivateDelegate session:initiateRelay:](v12, "session:initiateRelay:", self->_session, v6);
      }

      pthread_mutex_unlock(&self->_delegateLock);
    }
  }
}

- (void)tellDelegate_updateRelay:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  GKSessionPrivateDelegate *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_updateRelay:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dict"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v9 = "<nil>";
        v17 = 136315906;
        v18 = v7;
        v19 = 2080;
        v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
        v21 = 1024;
        v22 = 1162;
        v23 = 2080;
        v24 = (void *)v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d update-relay.%s", (uint8_t *)&v17, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315650;
        v18 = v10;
        v19 = 2080;
        v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
        v21 = 1024;
        v22 = 1164;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_updateRelay", (uint8_t *)&v17, 0x1Cu);
      }
    }
    if (+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled"))
    {
      pthread_mutex_lock(&self->_delegateLock);
      v12 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136316418;
            v18 = v13;
            v19 = 2080;
            v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
            v21 = 1024;
            v22 = 1173;
            v23 = 2112;
            v24 = v12;
            v25 = 2112;
            v26 = v6;
            v27 = 2112;
            v28 = v5;
            _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: initiateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        -[GKSessionPrivateDelegate session:initiateRelay:forPeer:](v12, "session:initiateRelay:forPeer:", self->_session, v6, v5);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v17 = 136316418;
            v18 = v15;
            v19 = 2080;
            v20 = "-[GKSessionInternal(_private) tellDelegate_updateRelay:]";
            v21 = 1024;
            v22 = 1178;
            v23 = 2112;
            v24 = v12;
            v25 = 2112;
            v26 = v6;
            v27 = 2112;
            v28 = v5;
            _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: updateRelay: %@ forPeer: %@", (uint8_t *)&v17, 0x3Au);
          }
        }
        -[GKSessionPrivateDelegate session:updateRelay:](v12, "session:updateRelay:", self->_session, v6);
      }

      pthread_mutex_unlock(&self->_delegateLock);
    }
  }
}

- (void)tellDelegate_networkStatisticsChanged:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  GKSessionPrivateDelegate *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:].cold.1();
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("peerID"));
    v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dict"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v9 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
        else
          v9 = "<nil>";
        v16 = 136315906;
        v17 = v7;
        v18 = 2080;
        v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
        v20 = 1024;
        v21 = 1194;
        v22 = 2080;
        v23 = (void *)v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d network-stats-changed.%s", (uint8_t *)&v16, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        if (v6)
          v12 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
        else
          v12 = "<nil>";
        v16 = 136315906;
        v17 = v10;
        v18 = 2080;
        v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
        v20 = 1024;
        v21 = 1196;
        v22 = 2080;
        v23 = (void *)v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d tellDelegate_networkStatisticsChanged: [%s]", (uint8_t *)&v16, 0x26u);
      }
    }
    pthread_mutex_lock(&self->_delegateLock);
    v13 = -[GKSessionInternal privateDelegate](self, "privateDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136316162;
          v17 = v14;
          v18 = 2080;
          v19 = "-[GKSessionInternal(_private) tellDelegate_networkStatisticsChanged:]";
          v20 = 1024;
          v21 = 1201;
          v22 = 2112;
          v23 = v13;
          v24 = 2112;
          v25 = v6;
          _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@: stats-changed: %@", (uint8_t *)&v16, 0x30u);
        }
      }
      -[GKSessionPrivateDelegate session:networkStatisticsChanged:](v13, "session:networkStatisticsChanged:", self->_session, v6);
    }

    pthread_mutex_unlock(&self->_delegateLock);
  }
}

- (BOOL)parseServiceName:(const char *)a3 intoDisplayName:(id *)a4 pid:(unsigned int *)a5 state:(id *)a6
{
  unsigned __int8 v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  BOOL result;
  const char *v15;
  char v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  _BOOL4 v31;
  unsigned __int8 v32;
  int v33;
  unsigned __int8 v34;
  int v35;
  unsigned __int8 v36;
  int v37;
  unsigned __int8 v38;
  int v39;
  unsigned int v40;
  int v41;
  char v42;
  BOOL v43;
  int v44;
  int v45;
  unsigned int v46;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  _BOOL4 v51;
  unsigned int v52;
  void *v53;
  id v54;
  uint64_t v55;
  _BOOL4 v56;
  int v57;
  int v58;
  __int16 v59;
  __int16 v60;
  char v61;
  __int16 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  _BYTE v70[10];
  int v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v62 = -21846;
  v60 = -21846;
  v61 = -86;
  v59 = -21846;
  v57 = -1431655766;
  v58 = -1431655766;
  if (sscanf(a3, "%2c", &v62) <= 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    v13 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v13)
      return result;
    *(_DWORD *)buf = 136315906;
    v64 = v11;
    v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    v67 = 1024;
    v68 = 1240;
    v69 = 2080;
    *(_QWORD *)v70 = a3;
    v15 = " [%s] %s:%d parseServiceName: invalid format: %s";
    goto LABEL_38;
  }
  if (v62 - 65 > 0x19)
  {
    if (v62 - 97 > 0x19)
    {
      if (v62 == 95)
        v16 = 63;
      else
        v16 = 64;
      if (v62 == 45)
        v10 = 62;
      else
        v10 = v16;
      if (v62 - 48 < 0xA)
        v10 = v62 - 48;
    }
    else
    {
      v10 = v62 - 61;
    }
  }
  else
  {
    v10 = v62 - 55;
  }
  v17 = v10;
  v18 = HIBYTE(v62) - 48;
  if (HIBYTE(v62) == 95)
    v19 = 63;
  else
    v19 = 64;
  if (HIBYTE(v62) == 45)
    v19 = 62;
  if (v18 >= 0xA)
    LOBYTE(v18) = v19;
  if (HIBYTE(v62) - 97 <= 0x19)
    v20 = HIBYTE(v62) - 61;
  else
    v20 = v18;
  v21 = HIBYTE(v62) - 55;
  if (HIBYTE(v62) - 65 > 0x19)
    v21 = v20;
  if (v17 > 0x3F || (v22 = v21, v21 >= 0x40u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v28 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    v29 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v29)
      return result;
    *(_DWORD *)buf = 136315906;
    v64 = v28;
    v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    v67 = 1024;
    v68 = 1246;
    v69 = 2080;
    *(_QWORD *)v70 = a3;
    v15 = " [%s] %s:%d parseServiceName: invalid version: %s";
    goto LABEL_38;
  }
  if (v17 | v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x24BDFDC28];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v25)
        return result;
      *(_DWORD *)buf = 136316162;
      v64 = v23;
      v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      v67 = 1024;
      v68 = 1251;
      v69 = 1024;
      *(_DWORD *)v70 = v17;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v22;
      v15 = " [%s] %s:%d parseServiceName: unsupported version: %d-%d";
      v26 = v24;
      v27 = 40;
      goto LABEL_39;
    }
    return 0;
  }
  if (sscanf(a3, "%*2c%6c%3c%n", &v58, &v60, &v57) <= 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v30 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    v31 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v31)
    {
      *(_DWORD *)buf = 136315906;
      v64 = v30;
      v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      v67 = 1024;
      v68 = 1258;
      v69 = 2080;
      *(_QWORD *)v70 = a3;
      v15 = " [%s] %s:%d parseServiceName: invalid format: %s";
LABEL_38:
      v26 = v12;
      v27 = 38;
LABEL_39:
      _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, v15, buf, v27);
      return 0;
    }
    return result;
  }
  if (v58 - 65 <= 0x19)
  {
    v32 = v58 - 55;
LABEL_54:
    v33 = v32;
    goto LABEL_55;
  }
  if (v58 - 97 <= 0x19)
  {
    v32 = v58 - 61;
    goto LABEL_54;
  }
  v32 = v58 - 48;
  if (v58 - 48 < 0xA)
    goto LABEL_54;
  if (v58 != 95)
  {
    if (v58 != 45)
      goto LABEL_110;
    v32 = 62;
    goto LABEL_54;
  }
  v33 = 63;
LABEL_55:
  if (BYTE1(v58) - 65 <= 0x19)
  {
    v34 = BYTE1(v58) - 55;
LABEL_63:
    v35 = v34;
    goto LABEL_64;
  }
  if (BYTE1(v58) - 97 <= 0x19)
  {
    v34 = BYTE1(v58) - 61;
    goto LABEL_63;
  }
  v34 = BYTE1(v58) - 48;
  if (BYTE1(v58) - 48 < 0xA)
    goto LABEL_63;
  if (BYTE1(v58) != 95)
  {
    if (BYTE1(v58) != 45)
      goto LABEL_110;
    v34 = 62;
    goto LABEL_63;
  }
  v35 = 63;
LABEL_64:
  if (BYTE2(v58) - 65 <= 0x19)
  {
    v36 = BYTE2(v58) - 55;
LABEL_72:
    v37 = v36 << 12;
    goto LABEL_73;
  }
  if (BYTE2(v58) - 97 <= 0x19)
  {
    v36 = BYTE2(v58) - 61;
    goto LABEL_72;
  }
  v36 = BYTE2(v58) - 48;
  if (BYTE2(v58) - 48 < 0xA)
    goto LABEL_72;
  if (BYTE2(v58) != 95)
  {
    if (BYTE2(v58) != 45)
      goto LABEL_110;
    v36 = 62;
    goto LABEL_72;
  }
  v37 = 258048;
LABEL_73:
  if (HIBYTE(v58) - 65 <= 0x19)
  {
    v38 = HIBYTE(v58) - 55;
LABEL_81:
    v39 = v38 << 18;
    goto LABEL_82;
  }
  if (HIBYTE(v58) - 97 <= 0x19)
  {
    v38 = HIBYTE(v58) - 61;
    goto LABEL_81;
  }
  v38 = HIBYTE(v58) - 48;
  if (HIBYTE(v58) - 48 < 0xA)
    goto LABEL_81;
  if (HIBYTE(v58) != 95)
  {
    if (HIBYTE(v58) != 45)
      goto LABEL_110;
    v38 = 62;
    goto LABEL_81;
  }
  v39 = 16515072;
LABEL_82:
  if (v59 - 65 <= 0x19)
  {
    v40 = v59 - 55;
LABEL_90:
    v41 = v40 << 24;
    goto LABEL_91;
  }
  if (v59 - 97 <= 0x19)
  {
    v40 = v59 - 61;
    goto LABEL_90;
  }
  v40 = v59 - 48;
  if (v40 < 0xA)
    goto LABEL_90;
  if (v59 != 95)
  {
    if (v59 == 45)
    {
      v40 = 62;
      goto LABEL_90;
    }
LABEL_110:
    v45 = -3;
    goto LABEL_111;
  }
  v41 = 1056964608;
LABEL_91:
  if (HIBYTE(v59) - 65 <= 0x19)
  {
    v42 = HIBYTE(v59) - 55;
    goto LABEL_95;
  }
  if (HIBYTE(v59) - 97 <= 0x19)
  {
    v42 = HIBYTE(v59) - 61;
    goto LABEL_95;
  }
  v46 = HIBYTE(v59) - 48;
  if (v46 >= 0xA)
  {
    if (HIBYTE(v59) != 45)
    {
      v43 = HIBYTE(v59) == 95;
      v44 = -4;
LABEL_96:
      if (v43)
        v45 = v44;
      else
        v45 = v44 + 1;
      goto LABEL_111;
    }
    v42 = 62;
LABEL_95:
    v43 = (v42 & 0x7C) == 4;
    v44 = -5;
    goto LABEL_96;
  }
  if ((v46 & 0x7C) != 4 && v46 > 3u)
    v45 = -4;
  else
    v45 = -5;
  if (v46 >= 4u)
  {
LABEL_111:
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v49 = VRTraceErrorLogLevelToCSTR();
    v50 = *MEMORY[0x24BDFDC28];
    v51 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v51)
    {
      *(_DWORD *)buf = 136316162;
      v64 = v49;
      v65 = 2080;
      v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
      v67 = 1024;
      v68 = 1265;
      v69 = 2080;
      *(_QWORD *)v70 = a3;
      *(_WORD *)&v70[8] = 1024;
      v71 = v45;
      v15 = " [%s] %s:%d parseServiceName: invalid peer ID: %s (%d)";
      v26 = v50;
      v27 = 44;
      goto LABEL_39;
    }
    return result;
  }
  if (v60 == 65)
  {
    v48 = MEMORY[0x24BDBD1C0];
    goto LABEL_123;
  }
  if (v60 == 66)
  {
    v48 = MEMORY[0x24BDBD1C8];
LABEL_123:
    v52 = v33 | (v35 << 6) | v37 | v39 | v41 | (v46 << 30);
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v48, CFSTR("busy"), 0);
    *a5 = v52;
    v54 = objc_alloc(MEMORY[0x24BDD17C8]);
    *a4 = (id)objc_msgSend(v54, "initWithUTF8String:", &a3[v57]);
    *a6 = v53;
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 0;
  v55 = VRTraceErrorLogLevelToCSTR();
  v12 = *MEMORY[0x24BDFDC28];
  v56 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v56)
  {
    *(_DWORD *)buf = 136315906;
    v64 = v55;
    v65 = 2080;
    v66 = "-[GKSessionInternal(_private) parseServiceName:intoDisplayName:pid:state:]";
    v67 = 1024;
    v68 = 1275;
    v69 = 2080;
    *(_QWORD *)v70 = a3;
    v15 = " [%s] %s:%d parseServiceName: busy state missing: %s";
    goto LABEL_38;
  }
  return result;
}

- (id)serviceName
{
  char v2;
  uint64_t v3;
  unsigned int pid;
  unsigned int v5;
  char v6;
  char v7;
  uint64_t v8;
  int v10;
  __int16 v11;
  char v12;

  v2 = 0;
  v3 = 0;
  v11 = -21846;
  v10 = -1431655766;
  pid = self->_pid;
  do
  {
    v5 = (pid >> v2) & 0x3F;
    v6 = v5 + 48;
    if (v5 >= 0xA)
      v6 = v5 + 55;
    if (v5 >= 0x24)
      v6 = v5 + 61;
    if (v5 == 63)
      v6 = 95;
    if (v5 == 62)
      v7 = 45;
    else
      v7 = v6;
    *((_BYTE *)&v10 + v3++) = v7;
    v2 += 6;
  }
  while (v3 != 6);
  v12 = 0;
  v8 = 65;
  if (self->_isBusy)
    v8 = 66;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("00%s%c..%@"), &v10, v8, self->_displayName);
}

- (void)stopResolvingAllPeers
{
  uint64_t v3;
  NSObject *v4;
  _DNSServiceRef_t *dnsServiceResolveConnection;
  _DNSServiceRef_t *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_connection)
  {
    -[GKTable makeObjectsPerformSelector:](self->_peerInfoTable, "makeObjectsPerformSelector:", sel_clearResolving);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
        v7 = 136315906;
        v8 = v3;
        v9 = 2080;
        v10 = "-[GKSessionInternal(_private) stopResolvingAllPeers]";
        v11 = 1024;
        v12 = 1305;
        v13 = 1024;
        v14 = (int)dnsServiceResolveConnection;
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceResolveConnection) (%08X)", (uint8_t *)&v7, 0x22u);
      }
    }
    v6 = self->_dnsServiceResolveConnection;
    if (v6)
      DNSServiceRefDeallocate(v6);
    self->_dnsServiceResolveConnection = 0;
  }
}

- (void)didPublishWithError:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _DNSServiceRef_t *service;
  uint64_t v10;
  NSObject *v11;
  _DNSServiceRef_t *serviceBrowser;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = v5;
      v19 = 2080;
      v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
      v21 = 1024;
      v22 = 1313;
      v23 = 1024;
      v24 = a3;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didPublish: %d", buf, 0x22u);
    }
  }
  if (a3)
  {
    if (self->_service)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          service = self->_service;
          *(_DWORD *)buf = 136315906;
          v18 = v7;
          v19 = 2080;
          v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
          v21 = 1024;
          v22 = 1317;
          v23 = 1024;
          v24 = (int)service;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_service);
      self->_service = 0;
    }
    if (self->_mode == 2 && self->_serviceBrowser)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          serviceBrowser = self->_serviceBrowser;
          *(_DWORD *)buf = 136315906;
          v18 = v10;
          v19 = 2080;
          v20 = "-[GKSessionInternal(_private) didPublishWithError:]";
          v21 = 1024;
          v22 = 1322;
          v23 = 1024;
          v24 = (int)serviceBrowser;
          _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_serviceBrowser);
      self->_serviceBrowser = 0;
    }
    if (self->_sessionStarted)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.gamekit.GKSessionErrorDomain"), a3, 0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v13, CFSTR("NSError"), 0);
      pthread_mutex_lock(&self->_delegateLock);
      -[GKSessionInternal delegate](self, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_sessionDidFailWithError_, v14, 0);
      pthread_mutex_unlock(&self->_delegateLock);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKSessionInternal(_private) didPublishWithError:].cold.2(v15, v13, v16);
      }

      self->_sessionStarted = 0;
      self->_stopHandlingEvents = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKSessionInternal(_private) didPublishWithError:].cold.1();
      }
      -[GKSessionInternal stopResolvingAllPeers](self, "stopResolvingAllPeers");
    }
  }
  else
  {
    self->_isPublishing = 1;
  }
}

- (void)lock
{
  if (pthread_mutex_lock(&self->_lock) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKSessionInternal(_private) lock].cold.1();
  }
}

- (void)unlock
{
  if (pthread_mutex_unlock(&self->_lock) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKSessionInternal(_private) unlock].cold.1();
  }
}

- (void)handleNewGKOOBAudioMessage:(id)a3 messageData:(id)a4 remotePID:(unsigned int)a5 callbackData:(id *)a6 maxCallbackCount:(int)a7 checkDelegateCallbackSelector:(BOOL *)a8 tellDelegateSelector:(SEL *)a9 callbackCount:(int *)a10
{
  uint64_t v13;
  uint64_t v17;
  uint64_t v18;
  GKVoiceChatSessionListener *voiceChatListener;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v13 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x24BDAC8D0];
  -[GKSessionInternal dataReceiveHandler](self, "dataReceiveHandler");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = *a10;
    if ((int)v17 >= a7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136315650;
          v23 = v20;
          v24 = 2080;
          v25 = "-[GKSessionInternal(callback) handleNewGKOOBAudioMessage:messageData:remotePID:callbackData:maxCallbackC"
                "ount:checkDelegateCallbackSelector:tellDelegateSelector:callbackCount:]";
          v26 = 1024;
          v27 = 1757;
          _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already reached the max allowed delegate callback count", (uint8_t *)&v22, 0x1Cu);
        }
      }
    }
    else
    {
      a6[v17] = a4;
      v18 = *a10;
      a8[v18] = 0;
      a9[v18] = sel_tellDelegate_didReceiveDataFromPeerWithContext_;
      *a10 = v18 + 1;
    }
  }
  else
  {
    voiceChatListener = self->_voiceChatListener;
    if (!voiceChatListener)
    {
      voiceChatListener = -[GKVoiceChatSessionListener initWithSession:]([GKVoiceChatSessionListener alloc], "initWithSession:", self);
      self->_voiceChatListener = voiceChatListener;
    }
    -[GKVoiceChatSessionListener receivedNewVoiceChatOOBMessage:fromPeerID:](voiceChatListener, "receivedNewVoiceChatOOBMessage:fromPeerID:", a3, -[GKSessionInternal stringForGCKID:](self, "stringForGCKID:", v13));
  }
}

- (void)sendCallbacksToDelegate:(id *)a3 remotePeer:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int var0;
  id v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  _BOOL4 isSearching;
  _BOOL4 v16;
  int var2;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  GKSessionInternal *v34;
  GKList *peersPendingIncomingInvitation;
  uint64_t v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  char *var1;
  uint64_t v49;
  id v50;
  void *v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  uint64_t v61;
  NSObject *v62;
  int v63;
  uint64_t v64;
  NSObject *v65;
  _QWORD *v66;
  uint64_t v67;
  NSObject *v68;
  int v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  int v78;
  uint64_t v79;
  _OWORD *v80;
  _OWORD *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  GKConnection *connection;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  NSObject *v89;
  _DNSServiceRef_t *serviceBrowser;
  uint64_t v91;
  NSObject *v92;
  int v93;
  int v94;
  int var3_low;
  id v96;
  const __CFString *v97;
  uint64_t v98;
  NSObject *v99;
  int var3;
  _BOOL4 v101;
  id v102;
  const __CFString *v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
  const __CFString *v107;
  uint64_t v108;
  NSObject *v109;
  _BOOL4 v110;
  uint64_t v111;
  const __CFString *v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  _BOOL4 v116;
  id v117;
  const __CFString *v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  _BOOL4 v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  NSObject *v130;
  int v131;
  id v132;
  uint64_t v133;
  _BOOL4 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  NSObject *v140;
  int v141;
  const char *v142;
  NSObject *v143;
  uint32_t v144;
  uint64_t v145;
  NSObject *v146;
  unsigned int v147;
  uint64_t v148;
  NSObject *v149;
  uint64_t v150;
  _BOOL4 v151;
  GKSessionInternal *v152;
  uint64_t i;
  uint64_t v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  char v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  _opaque_pthread_mutex_t *p_delegateLock;
  char v165;
  id v167;
  _QWORD block[7];
  _QWORD v169[7];
  _QWORD v170[7];
  _QWORD v171[7];
  int v172;
  __int16 v173;
  char v174;
  _BYTE buf[12];
  __int16 v176;
  const char *v177;
  __int16 v178;
  int v179;
  __int16 v180;
  _BYTE v181[10];
  __int16 v182;
  unsigned int v183;
  __int16 v184;
  int v185;
  char *v186;
  char *v187;
  _QWORD v188[4];
  _QWORD v189[3];
  _QWORD v190[6];
  unint64_t v191;
  int v192;
  uint64_t v193;

  v4 = *(_QWORD *)&a4;
  v193 = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
  memset(v190, 170, sizeof(v190));
  LOBYTE(v173) = -86;
  memset(v188, 170, sizeof(v188));
  v186 = (char *)0xAAAAAAAAAAAAAAAALL;
  v187 = (char *)0xAAAAAAAAAAAAAAAALL;
  v172 = 0;
  if (a3->var0 != 4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v7;
      v176 = 2080;
      v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
      v178 = 1024;
      v179 = 1798;
      v180 = 1024;
      *(_DWORD *)v181 = var0;
      *(_WORD *)&v181[4] = 1024;
      *(_DWORD *)&v181[6] = v4;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendCallbacksToDelegate: %d for remotePID [%x]", buf, 0x28u);
    }
  }
  v191 = 0xAAAAAAAAAAAAAAAALL;
  -[GKSessionInternal lock](self, "lock");
  v192 = 0;
  v191 = 0;
  memset(v189, 0, sizeof(v189));
  v173 = 257;
  v174 = 1;
  v167 = -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", v4);
  v10 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v4);
  v11 = 0;
  switch(a3->var0)
  {
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v26 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v24;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 1866;
          v180 = 1024;
          *(_DWORD *)v181 = v26;
          _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Invited", buf, 0x22u);
        }
      }
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3->var1, a3->var2, 4);
      -[GKSessionInternal setDisplayName:forPeer:](self, "setDisplayName:forPeer:", v27, v4);
      if (self->_sessionStarted)
      {
        -[GKList addID:](self->_peersPendingIncomingInvitation, "addID:", v4);
        v188[1] = sel_session_peer_didChangeState_;
        v188[2] = sel_session_didReceiveConnectionRequestFromPeer_;
        v186 = sel_tellDelegate_isConnectingPeer_;
        v187 = sel_tellDelegate_gotInvited_;
        v172 = 2;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v98 = VRTraceErrorLogLevelToCSTR();
          v99 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v98;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 1872;
            _os_log_impl(&dword_215C5C000, v99, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not available - rejecting incoming", buf, 0x1Cu);
          }
        }
        GCKSessionRespondToInvitation((uint64_t)self->sessionRef, v4, 0);
      }

      goto LABEL_215;
    case 1:
    case 0xD:
      TimingLog(3, 0, (uint64_t)"Network connected...");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v14 = a3->var0;
          isSearching = self->_isSearching;
          v16 = self->_serviceBrowser != 0;
          var2 = a3->var2;
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = v12;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 1895;
          v180 = 1024;
          *(_DWORD *)v181 = v14;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = isSearching;
          v182 = 1024;
          v183 = v16;
          v184 = 1024;
          v185 = var2;
          _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Connected (%d, %d) (namelen:%d)", buf, 0x34u);
        }
      }
      if (!-[GKList hasID:](self->_peersConnected, "hasID:", v4))
      {
        v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3->var1, a3->var2, 4);
        -[GKSessionInternal setDisplayName:forPeer:](self, "setDisplayName:forPeer:", v84, v4);
        connection = self->_connection;
        if (connection)
          -[GKConnection setParticipantID:forPeerID:](connection, "setParticipantID:forPeerID:", v84, v167);
        if (v10)
        {
          objc_msgSend(v10, "setNeedsToTimeout:", 0);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v86 = VRTraceErrorLogLevelToCSTR();
            v87 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v86;
              v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              v178 = 1024;
              v179 = 1913;
              v180 = 2112;
              *(_QWORD *)v181 = v84;
              _os_log_impl(&dword_215C5C000, v87, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ connected", buf, 0x26u);
            }
          }
          objc_msgSend(v10, "stopResolving");
        }
        -[GKList addID:](self->_peersConnected, "addID:", v4);
        if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20])
        {
          *(_QWORD *)buf = -[GKList count](self->_peersConnected, "count");
          VRTraceVariable_();
        }
        -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
        -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", v4);
        if (self->_isSearching && self->_serviceBrowser)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v88 = VRTraceErrorLogLevelToCSTR();
            v89 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              serviceBrowser = self->_serviceBrowser;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v88;
              v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              v178 = 1024;
              v179 = 1926;
              v180 = 1024;
              *(_DWORD *)v181 = (_DWORD)serviceBrowser;
              _os_log_impl(&dword_215C5C000, v89, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
            }
          }
          DNSServiceRefDeallocate(self->_serviceBrowser);
          self->_serviceBrowser = 0;
          self->_isSearching = 0;
          -[GKList addIDsFromList:](self->_peersForCleanup, "addIDsFromList:", self->_peersAvailable);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v91 = VRTraceErrorLogLevelToCSTR();
            v92 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v93 = -[GKList count](self->_peersAvailable, "count");
              v94 = -[GKList count](self->_peersForCleanup, "count");
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v91;
              v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              v178 = 1024;
              v179 = 1934;
              v180 = 1024;
              *(_DWORD *)v181 = v93;
              *(_WORD *)&v181[4] = 1024;
              *(_DWORD *)&v181[6] = v94;
              _os_log_impl(&dword_215C5C000, v92, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d moving %d available peers to future removal (%d)", buf, 0x28u);
            }
          }
          -[GKList removeAllIDs](self->_peersAvailable, "removeAllIDs");
          -[GKTable makeObjectsPerformSelector:](self->_peerInfoTable, "makeObjectsPerformSelector:", sel_stopTXTRecordMonitoring);
        }
        v188[1] = sel_session_peer_didChangeState_;
        v186 = sel_tellDelegate_didConnectPeer_;
        *(_DWORD *)buf = a3->var0 == 13;
        v189[0] = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4);
        v172 = 1;

        goto LABEL_215;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_215;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x24BDFDC28];
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      v11 = 0;
      if (v20)
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v18;
        v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        v178 = 1024;
        v179 = 1899;
        v180 = 1024;
        *(_DWORD *)v181 = v4;
        v21 = " [%s] %s:%d New peer (%d) already connected";
        goto LABEL_13;
      }
      goto LABEL_216;
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v30 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v28;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 1954;
          v180 = 1024;
          *(_DWORD *)v181 = v30;
          _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Failed", buf, 0x22u);
        }
      }
      -[GKConnection reportingAgent](self->_connection, "reportingAgent");
      reportingGKLog();
      if (v10)
      {
        objc_msgSend(v10, "setNeedsToTimeout:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v33 = objc_msgSend(v10, "displayName");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v31;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 1959;
            v180 = 2112;
            *(_QWORD *)v181 = v33;
            _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ failed to connect", buf, 0x26u);
          }
        }
        objc_msgSend(v10, "stopResolving");
      }
      v34 = self;
      if (-[GKList hasID:](self->_peersPendingIncomingInvitation, "hasID:", v4))
      {
        LODWORD(v191) = 30506;
        v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Failed while pending incoming invitation."), &stru_24D466D90, CFSTR("GKSessionEvent"));
        v190[0] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Failed while pending incoming invitation."), &stru_24D466D90, CFSTR("GKSessionEvent"));
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        v172 = 1;
        peersPendingIncomingInvitation = self->_peersPendingIncomingInvitation;
      }
      else
      {
        if (!-[GKList hasID:](self->_peersPendingOutgoingInvitation, "hasID:", v4))
        {
          LODWORD(v191) = 30201;
          v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Failed while not pending."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v190[0] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Failed while not pending."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v188[1] = sel_session_connectionWithPeerFailed_withError_;
          v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
          v172 = 1;
          v34 = self;
          goto LABEL_154;
        }
        var3_low = LOWORD(a3->var3);
        if (var3_low == 41)
        {
          LODWORD(v191) = 30510;
          v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Connection to peer already in progress after initially succeeding."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v96 = GCKGameConnectivityKitBundle();
          v97 = CFSTR("Found in progress after success.");
        }
        else if (var3_low == 23)
        {
          LODWORD(v191) = 30503;
          v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Outgoing invitation timed out before TCP."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v96 = GCKGameConnectivityKitBundle();
          v97 = CFSTR("Invitation timed out.");
        }
        else
        {
          LODWORD(v191) = 30505;
          v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Failed while pending outgoing invitation."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v96 = GCKGameConnectivityKitBundle();
          v97 = CFSTR("Failed while pending outgoing invitation.");
        }
        v190[0] = objc_msgSend(v96, "localizedStringForKey:value:table:", v97, &stru_24D466D90, CFSTR("GKSessionEvent"));
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        v172 = 1;
        v34 = self;
        peersPendingIncomingInvitation = self->_peersPendingOutgoingInvitation;
      }
      -[GKList removeID:](peersPendingIncomingInvitation, "removeID:", v4);
LABEL_154:
      if (v34->_connection
        || -[GKList count](v34->_peersConnected, "count")
        || -[GKList count](v34->_peersPendingIncomingInvitation, "count")
        || -[GKList count](v34->_peersPendingOutgoingInvitation, "count"))
      {
        goto LABEL_245;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_244;
      v119 = VRTraceErrorLogLevelToCSTR();
      v120 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_244;
      if (v10)
        v121 = objc_msgSend(v10, "displayName");
      else
        v121 = 0;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v119;
      v176 = 2080;
      v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
      v178 = 1024;
      v179 = 2017;
      v180 = 2112;
      *(_QWORD *)v181 = v121;
      v161 = " [%s] %s:%d ** Stop resolving ALL: %@ connection failed and no more connected/incoming/outgoing";
      goto LABEL_243;
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v38 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v36;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2025;
          v180 = 1024;
          *(_DWORD *)v181 = v38;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_Disconnected for peer %08X.", buf, 0x28u);
        }
      }
      -[GKConnection reportingAgent](self->_connection, "reportingAgent");
      reportingGKLog();
      if (v10)
      {
        objc_msgSend(v10, "setNeedsToTimeout:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v39 = VRTraceErrorLogLevelToCSTR();
          v40 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v41 = objc_msgSend(v10, "displayName");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v39;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2032;
            v180 = 2112;
            *(_QWORD *)v181 = v41;
            _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ disconnected", buf, 0x26u);
          }
        }
        objc_msgSend(v10, "stopResolving");
      }
      if ((a3->var3 & 0x80000000) != 0)
      {
        var3 = (unsigned __int16)a3->var3;
        v101 = -[GKList hasID:](self->_peersConnected, "hasID:", v4);
        if (var3 == 23)
        {
          if (!v101)
          {
            if (-[GKList hasID:](self->_peersPendingOutgoingInvitation, "hasID:", v4))
            {
              -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", v4);
              LODWORD(v191) = 30503;
              v117 = GCKGameConnectivityKitBundle();
              v118 = CFSTR("Outgoing invitation timed out.");
            }
            else
            {
              if (!-[GKList hasID:](self->_peersPendingIncomingInvitation, "hasID:", v4))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 5)
                  goto LABEL_187;
                v148 = VRTraceErrorLogLevelToCSTR();
                v149 = *MEMORY[0x24BDFDC28];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                  goto LABEL_187;
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v148;
                v176 = 2080;
                v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
                v178 = 1024;
                v179 = 2066;
                v180 = 1024;
                *(_DWORD *)v181 = 2066;
                *(_WORD *)&v181[4] = 1024;
                *(_DWORD *)&v181[6] = v4;
                v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Ge"
                       "cko/GKSession_Internal.m:%d: PID 0x%08X timed out, but not known to us.";
                v143 = v149;
                v144 = 40;
                goto LABEL_209;
              }
              -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
              LODWORD(v191) = 30503;
              v117 = GCKGameConnectivityKitBundle();
              v118 = CFSTR("Incoming invitation timed out.");
            }
            v190[3] = objc_msgSend(v117, "localizedStringForKey:value:table:", v118, &stru_24D466D90, CFSTR("GKSessionEvent"));
            v106 = GCKGameConnectivityKitBundle();
            v107 = CFSTR("Invitation timed out.");
LABEL_185:
            v190[0] = objc_msgSend(v106, "localizedStringForKey:value:table:", v107, &stru_24D466D90, CFSTR("GKSessionEvent"));
            v188[1] = sel_session_connectionWithPeerFailed_withError_;
            v124 = sel_tellDelegate_connectionRequestToPeerFailed_;
            goto LABEL_186;
          }
          -[GKList removeID:](self->_peersConnected, "removeID:", v4);
          if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20])
          {
            *(_QWORD *)buf = -[GKList count](self->_peersConnected, "count");
            VRTraceVariable_();
          }
          LODWORD(v191) = 30503;
          v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Connection timed out."), &stru_24D466D90, CFSTR("GKSessionEvent"));
          v102 = GCKGameConnectivityKitBundle();
          v103 = CFSTR("Connection timed out.");
        }
        else
        {
          if (!v101
            && !-[GKList hasID:](self->_peersPendingOutgoingInvitation, "hasID:", v4)
            && !-[GKList hasID:](self->_peersPendingIncomingInvitation, "hasID:", v4))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 5)
              goto LABEL_187;
            v145 = VRTraceErrorLogLevelToCSTR();
            v146 = *MEMORY[0x24BDFDC28];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              goto LABEL_187;
            v147 = a3->var3;
            *(_DWORD *)buf = 136316674;
            *(_QWORD *)&buf[4] = v145;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2093;
            v180 = 1024;
            *(_DWORD *)v181 = 2093;
            *(_WORD *)&v181[4] = 1024;
            *(_DWORD *)&v181[6] = v147;
            v182 = 1024;
            v183 = v147;
            v184 = 1024;
            v185 = v4;
            v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/"
                   "GKSession_Internal.m:%d: Received unknown event->status %08x (%d) for an unknown PID (0x%08X)";
            v143 = v146;
            v144 = 52;
            goto LABEL_209;
          }
          -[GKList removeID:](self->_peersConnected, "removeID:", v4);
          -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", v4);
          -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
          if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20])
          {
            *(_QWORD *)buf = -[GKList count](self->_peersConnected, "count");
            VRTraceVariable_();
          }
          if ((a3->var3 & 0x40000000) != 0)
          {
            LODWORD(v191) = 30205;
            v122 = (void *)MEMORY[0x24BDD17C8];
            v123 = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Connection error: system (%d)."), &stru_24D466D90, CFSTR("GKSessionEvent"));
            v111 = objc_msgSend(v122, "stringWithFormat:", v123, *__error());
            v112 = CFSTR("Connection error: system error");
          }
          else
          {
            LODWORD(v191) = 30203;
            v111 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Connection error: internal (%08X)."), &stru_24D466D90, CFSTR("GKSessionEvent")), a3->var3);
            v112 = CFSTR("Connection error: internal");
          }
          v190[3] = v111;
          v102 = GCKGameConnectivityKitBundle();
          v103 = v112;
        }
        v190[0] = objc_msgSend(v102, "localizedStringForKey:value:table:", v103, &stru_24D466D90, CFSTR("GKSessionEvent"));
LABEL_165:
        v188[1] = sel_session_peer_didChangeState_;
        v124 = sel_tellDelegate_didDisconnectPeer_;
LABEL_186:
        v186 = v124;
        v172 = 1;
        goto LABEL_187;
      }
      if (-[GKList hasID:](self->_peersConnected, "hasID:", v4))
      {
        -[GKList removeID:](self->_peersConnected, "removeID:", v4);
        if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20])
        {
          *(_QWORD *)buf = -[GKList count](self->_peersConnected, "count");
          VRTraceVariable_();
        }
        v42 = -[GKList hasID:](self->_peersAvailable, "hasID:", v4);
        if (v10 && !v42)
          -[GKTable removeObjectForKey:](self->_peerInfoTable, "removeObjectForKey:", v4);
        goto LABEL_165;
      }
      if (-[GKList hasID:](self->_peersPendingOutgoingInvitation, "hasID:", v4))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v104 = VRTraceErrorLogLevelToCSTR();
          v105 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v104;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2113;
            _os_log_impl(&dword_215C5C000, v105, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote declined", buf, 0x1Cu);
          }
        }
        -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", v4);
        LODWORD(v191) = 30502;
        v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("The invited peer has declined the connection."), &stru_24D466D90, CFSTR("GKSessionEvent"));
        v106 = GCKGameConnectivityKitBundle();
        v107 = CFSTR("Remote declined.");
        goto LABEL_185;
      }
      if (-[GKList hasID:](self->_peersPendingIncomingInvitation, "hasID:", v4))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v113 = VRTraceErrorLogLevelToCSTR();
          v114 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v113;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2126;
            _os_log_impl(&dword_215C5C000, v114, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote cancelled", buf, 0x1Cu);
          }
        }
        -[GKConnection reportingAgent](self->_connection, "reportingAgent");
        reportingGKLog();
        -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
        LODWORD(v191) = 30504;
        v190[3] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("The invited peer has cancelled the connection."), &stru_24D466D90, CFSTR("GKSessionEvent"));
        v190[0] = objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", CFSTR("Remote cancelled."), &stru_24D466D90, CFSTR("GKSessionEvent"));
        v188[1] = sel_session_connectionWithPeerFailed_withError_;
        v186 = sel_tellDelegate_connectionRequestToPeerFailed_;
        v172 = 1;
        goto LABEL_187;
      }
      if (!self->_connection)
      {
        if (v10)
          objc_msgSend(v10, "setNeedsToTimeout:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v137 = VRTraceErrorLogLevelToCSTR();
          v138 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v137;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2146;
            _os_log_impl(&dword_215C5C000, v138, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local accepted but disconnected", buf, 0x1Cu);
          }
        }
        -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_187;
        v139 = VRTraceErrorLogLevelToCSTR();
        v140 = *MEMORY[0x24BDFDC28];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          goto LABEL_187;
        v141 = a3->var0;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v139;
        v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        v178 = 1024;
        v179 = 2148;
        v180 = 1024;
        *(_DWORD *)v181 = 2148;
        *(_WORD *)&v181[4] = 1024;
        *(_DWORD *)&v181[6] = v4;
        v182 = 1024;
        v183 = v141;
        v142 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKSe"
               "ssion_Internal.m:%d: Local side accepted but PID (0x%08X) disconnected. event->eventType = %d";
        v143 = v140;
        v144 = 46;
LABEL_209:
        _os_log_impl(&dword_215C5C000, v143, OS_LOG_TYPE_DEFAULT, v142, buf, v144);
LABEL_187:
        if (!self->_connection
          && !-[GKList count](self->_peersConnected, "count")
          && !-[GKList count](self->_peersPendingIncomingInvitation, "count")
          && !-[GKList count](self->_peersPendingOutgoingInvitation, "count"))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v135 = VRTraceErrorLogLevelToCSTR();
            v120 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (v10)
                v136 = objc_msgSend(v10, "displayName");
              else
                v136 = 0;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v135;
              v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              v178 = 1024;
              v179 = 2155;
              v180 = 2112;
              *(_QWORD *)v181 = v136;
              v161 = " [%s] %s:%d ** Stop resolving ALL: %@ disconnected and no more connected/incoming/outgoing";
LABEL_243:
              _os_log_impl(&dword_215C5C000, v120, OS_LOG_TYPE_DEFAULT, v161, buf, 0x26u);
            }
          }
LABEL_244:
          -[GKSessionInternal stopResolvingAllPeers](self, "stopResolvingAllPeers");
        }
LABEL_245:
        v11 = 1;
        goto LABEL_216;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_215;
      v125 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x24BDFDC28];
      v126 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      v11 = 0;
      if (v126)
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v125;
        v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        v178 = 1024;
        v179 = 2140;
        v180 = 1024;
        *(_DWORD *)v181 = v4;
        v21 = " [%s] %s:%d Cancelled peer (%d) already disconnected";
LABEL_13:
        v22 = v19;
        v23 = 34;
        goto LABEL_214;
      }
LABEL_216:
      v165 = v11;

      v152 = self;
      -[GKSessionInternal unlock](self, "unlock");
      p_delegateLock = &self->_delegateLock;
      pthread_mutex_lock(&self->_delegateLock);
      if (v172 >= 1)
      {
        for (i = 0; i < v172; ++i)
        {
          if (*((_BYTE *)&v173 + i))
          {
            -[GKSessionInternal delegate](v152, "delegate");
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {
              -[GKSessionInternal privateDelegate](v152, "privateDelegate");
              if ((objc_opt_respondsToSelector() & 1) == 0)
                continue;
            }
          }
          v154 = *((unsigned int *)&v191 + i);
          if ((_DWORD)v154)
          {
            v155 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](v152, "newNSErrorFromGKSessionError:description:reason:", v154, v190[i + 3], v190[i]);
            v156 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v167, CFSTR("peerID"), v155, CFSTR("NSError"), 0, p_delegateLock);

            v152 = self;
          }
          else
          {
            v157 = v189[i];
            v158 = objc_alloc(MEMORY[0x24BDBCE70]);
            if (v157)
              v159 = objc_msgSend(v158, "initWithObjectsAndKeys:", v167, CFSTR("peerID"), v189[i], CFSTR("data"), 0);
            else
              v159 = objc_msgSend(v158, "initWithObjectsAndKeys:", v167, CFSTR("peerID"), 0, v162, v163);
            v156 = v159;
          }
          -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](v152, "performSelectorOnMainThread:withObject:waitUntilDone:", (&v186)[i], v156, 0);
        }
      }
      pthread_mutex_unlock(p_delegateLock);

      v160 = v165 ^ 1;
      if (v152->_connection)
        v160 = 1;
      if ((v160 & 1) == 0
        && !-[GKList count](v152->_peersConnected, "count")
        && v152->_mode - 1 <= 1
        && v152->_sessionStarted
        && !v152->_isSearching
        && !v152->_shutdown)
      {
        v152->_isSearching = 1;
        -[GKSessionInternal browse](v152, "browse");
      }
      objc_msgSend(v6, "drain");
      return;
    case 4:
      if (!-[GKList hasID:](self->_peersConnected, "hasID:", v4)
        || !a3->var1
        || !-[GKSessionInternal dataReceiveHandler](self, "dataReceiveHandler"))
      {
        goto LABEL_215;
      }
      v43 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3->var1, a3->var2);
      v11 = 0;
      v189[0] = v43;
      LOBYTE(v173) = 0;
      v44 = sel_tellDelegate_didReceiveData_;
      goto LABEL_76;
    case 6:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v45 = VRTraceErrorLogLevelToCSTR();
        v46 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v47 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v45;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2210;
          v180 = 1024;
          *(_DWORD *)v181 = v47;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_215C5C000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_IncomingOOBPacket from %X", buf, 0x28u);
        }
      }
      if (!-[GKList hasID:](self->_peersConnected, "hasID:", v4))
        goto LABEL_215;
      var1 = a3->var1;
      if (!var1)
        goto LABEL_215;
      v49 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", var1, a3->var2);
      v50 = +[GKOOBMessageFactory newMessageFromData:](GKOOBMessageFactory, "newMessageFromData:", v49);
      if (v50)
      {
        v51 = v50;
        v52 = objc_msgSend(v50, "type");
        if (v52 == 1500)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v127 = VRTraceErrorLogLevelToCSTR();
            v128 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = v127;
              v176 = 2080;
              v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
              v178 = 1024;
              v179 = 2222;
              _os_log_impl(&dword_215C5C000, v128, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: disconnect from all peers", buf, 0x1Cu);
            }
          }
          -[GKSessionInternal disconnectFromAllPeers](self, "disconnectFromAllPeers");
          goto LABEL_178;
        }
        if (v52 == 1600)
        {
          -[GKSessionInternal handleNewGKOOBAudioMessage:messageData:remotePID:callbackData:maxCallbackCount:checkDelegateCallbackSelector:tellDelegateSelector:callbackCount:](self, "handleNewGKOOBAudioMessage:messageData:remotePID:callbackData:maxCallbackCount:checkDelegateCallbackSelector:tellDelegateSelector:callbackCount:", v51, v49, v4, v189, 3, &v173, &v186, &v172);
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_178;
          v53 = VRTraceErrorLogLevelToCSTR();
          v54 = *MEMORY[0x24BDFDC28];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            goto LABEL_178;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v53;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2219;
          v55 = " [%s] %s:%d Incoming reliable audio packet";
          v56 = v54;
          v57 = 28;
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_178;
          v129 = VRTraceErrorLogLevelToCSTR();
          v130 = *MEMORY[0x24BDFDC28];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            goto LABEL_178;
          v131 = objc_msgSend(v51, "type");
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v129;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2226;
          v180 = 1024;
          *(_DWORD *)v181 = v131;
          v55 = " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: unknown OOB packet type %d";
          v56 = v130;
          v57 = 34;
        }
        _os_log_impl(&dword_215C5C000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
LABEL_178:
        v132 = v51;
        goto LABEL_215;
      }
      if (a3->var3 == 1)
      {
        if (self->_doobReceiveHandler[1])
        {
          v70 = (void *)MEMORY[0x24BDBCE50];
          goto LABEL_75;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_215;
        v150 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x24BDFDC28];
        v151 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
        v11 = 0;
        if (!v151)
          goto LABEL_216;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v150;
        v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        v178 = 1024;
        v179 = 2243;
        v21 = " [%s] %s:%d GCKOOBand_RetryICE: oob message no band handler registered ";
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        {
LABEL_215:
          v11 = 0;
          goto LABEL_216;
        }
        v133 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x24BDFDC28];
        v134 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
        v11 = 0;
        if (!v134)
          goto LABEL_216;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v133;
        v176 = 2080;
        v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
        v178 = 1024;
        v179 = 2252;
        v21 = " [%s] %s:%d GCKSessionEvent_IncomingOOBPacket: oob message band specifier out-of-range...";
      }
LABEL_213:
      v22 = v109;
      v23 = 28;
LABEL_214:
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_215;
    case 7:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v58 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v60 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v58;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2260;
          v180 = 1024;
          *(_DWORD *)v181 = v60;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_215C5C000, v59, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_OutgoingOOBPacket to %X", buf, 0x28u);
        }
      }
      if (!-[GKList hasID:](self->_peersConnected, "hasID:", v4) || !a3->var1)
        goto LABEL_215;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v61 = VRTraceErrorLogLevelToCSTR();
        v62 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v63 = a3->var2;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v61;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2262;
          v180 = 1024;
          *(_DWORD *)v181 = v63;
          _os_log_impl(&dword_215C5C000, v62, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_OutgoingOOBPacket: [buflen == %d]", buf, 0x22u);
        }
      }
      v64 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3->var1, a3->var2);
      v169[0] = MEMORY[0x24BDAC760];
      v169[1] = 3221225472;
      v169[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_260;
      v169[3] = &unk_24D4661E0;
      v169[4] = self;
      v169[5] = v64;
      v169[6] = v167;
      v65 = MEMORY[0x24BDAC9B8];
      v66 = v169;
      goto LABEL_87;
    case 8:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v67 = VRTraceErrorLogLevelToCSTR();
        v68 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v69 = a3->var0;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v67;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2183;
          v180 = 1024;
          *(_DWORD *)v181 = v69;
          *(_WORD *)&v181[4] = 1024;
          *(_DWORD *)&v181[6] = v4;
          _os_log_impl(&dword_215C5C000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_SendSelfOOBPacket from %X", buf, 0x28u);
        }
      }
      if (!a3->var1)
        goto LABEL_215;
      if (a3->var3 == 1)
      {
        if (self->_doobReceiveHandler[1])
        {
          v70 = (void *)MEMORY[0x24BDBCE50];
LABEL_75:
          v71 = objc_msgSend(v70, "dataWithBytes:length:");
          v11 = 0;
          v189[0] = v71;
          LOBYTE(v173) = 0;
          v44 = sel_tellDelegate_didReceiveBand_RetryICE_;
LABEL_76:
          v186 = v44;
          v172 = 1;
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_215;
          v115 = VRTraceErrorLogLevelToCSTR();
          v109 = *MEMORY[0x24BDFDC28];
          v116 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
          v11 = 0;
          if (v116)
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v115;
            v176 = 2080;
            v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
            v178 = 1024;
            v179 = 2196;
            v21 = " [%s] %s:%d GCKOOBand_RetryICE: oob message no band handler registered ";
            goto LABEL_213;
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_215;
        v108 = VRTraceErrorLogLevelToCSTR();
        v109 = *MEMORY[0x24BDFDC28];
        v110 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
        v11 = 0;
        if (v110)
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v108;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 2205;
          v21 = " [%s] %s:%d GCKSessionEvent_SendSelfOOBPacket: oob message band specifier out-of-range...";
          goto LABEL_213;
        }
      }
      goto LABEL_216;
    case 9:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v72 = VRTraceErrorLogLevelToCSTR();
        v73 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v74 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v72;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 1822;
          v180 = 1024;
          *(_DWORD *)v181 = v74;
          _os_log_impl(&dword_215C5C000, v73, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_RelayInitiate", buf, 0x22u);
        }
      }
      v75 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListFromData:mutabilityOption:format:errorDescription:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3->var1, a3->var2), 0, 0, 0);
      v171[0] = MEMORY[0x24BDAC760];
      v171[1] = 3221225472;
      v171[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke;
      v171[3] = &unk_24D4661E0;
      v171[4] = self;
      v171[5] = v167;
      v171[6] = v75;
      v65 = MEMORY[0x24BDAC9B8];
      v66 = v171;
      goto LABEL_87;
    case 0xA:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v76 = VRTraceErrorLogLevelToCSTR();
        v77 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v78 = a3->var0;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v76;
          v176 = 2080;
          v177 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]";
          v178 = 1024;
          v179 = 1844;
          v180 = 1024;
          *(_DWORD *)v181 = v78;
          _os_log_impl(&dword_215C5C000, v77, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got event: %d - GCKSessionEvent_RelayUpdate", buf, 0x22u);
        }
      }
      v79 = objc_msgSend(MEMORY[0x24BDD1770], "propertyListFromData:mutabilityOption:format:errorDescription:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3->var1, a3->var2), 0, 0, 0);
      v170[0] = MEMORY[0x24BDAC760];
      v170[1] = 3221225472;
      v170[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_203;
      v170[3] = &unk_24D4661E0;
      v170[4] = self;
      v170[5] = v167;
      v170[6] = v79;
      v65 = MEMORY[0x24BDAC9B8];
      v66 = v170;
      goto LABEL_87;
    case 0xC:
      v80 = malloc_type_malloc((a3->var2 + 24), 0x57C95598uLL);
      if (!v80)
        goto LABEL_215;
      v81 = v80;
      v82 = *(_QWORD *)&a3->var2;
      *v80 = *(_OWORD *)&a3->var0;
      v83 = (char *)v80 + 24;
      *((_QWORD *)v81 + 1) = v83;
      *((_QWORD *)v81 + 2) = v82;
      memcpy(v83, a3->var1, a3->var2);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_2;
      block[3] = &unk_24D466730;
      block[4] = self;
      block[5] = v167;
      block[6] = v81;
      v65 = MEMORY[0x24BDAC9B8];
      v66 = block;
LABEL_87:
      dispatch_async(v65, v66);
      goto LABEL_215;
    default:
      goto LABEL_216;
  }
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v7[0] = CFSTR("peerID");
  v7[1] = CFSTR("dict");
  v8[0] = v1;
  v3 = a1[6];
  v5 = CFSTR("GKSRelayInitiateInfo");
  v6 = v3;
  v8[1] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  return objc_msgSend(v2, "tellDelegate_initiateRelay:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_203(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v1 = a1[5];
  v7[0] = CFSTR("peerID");
  v7[1] = CFSTR("dict");
  v8[0] = v1;
  v3 = a1[6];
  v5 = CFSTR("GKSRelayUpdateInfo");
  v6 = v3;
  v8[1] = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  return objc_msgSend(v2, "tellDelegate_updateRelay:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

uint64_t __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_260(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  return objc_msgSend(v1, "sendData:toPeers:withDataMode:enableOOB:error:", v2, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1), 0, 1, 0);
}

void __66__GKSessionInternal_callback__sendCallbacksToDelegate_remotePeer___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int *v5;
  int *v6;
  id *v7;
  int *v8;
  uint64_t v9;
  _QWORD v10[2];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 16);
      *(_DWORD *)buf = 136315906;
      v12 = v2;
      v13 = 2080;
      v14 = "-[GKSessionInternal(callback) sendCallbacksToDelegate:remotePeer:]_block_invoke_2";
      v15 = 1024;
      v16 = 2282;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionEvent_ReportStatistics: [buflen == %d]", buf, 0x22u);
    }
  }
  v5 = GCKSessionDecodeChannelStatistics(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(char **)(*(_QWORD *)(a1 + 48) + 8), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 16));
  if (v5)
  {
    v6 = v5;
    v7 = *(id **)(a1 + 32);
    v10[1] = objc_msgSend(v7[10], "networkStatisticsDictionaryForGCKStats:", v5, CFSTR("peerID"), CFSTR("dict"), *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "tellDelegate_networkStatisticsChanged:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 2));
    do
    {
      v8 = (int *)*((_QWORD *)v6 + 18);
      free(v6);
      v6 = v8;
    }
    while (v8);
  }
  free(*(void **)(a1 + 48));
}

- (void)setDelegate:(id)a3
{
  _opaque_pthread_mutex_t *p_delegateLock;

  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak(&self->_delegate, a3);
  pthread_mutex_unlock(p_delegateLock);
}

- (GKSessionDelegate)delegate
{
  return (GKSessionDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setPrivateDelegate:(id)a3
{
  _opaque_pthread_mutex_t *p_delegateLock;

  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  objc_storeWeak(&self->_privateDelegate, a3);
  pthread_mutex_unlock(p_delegateLock);
}

- (GKSessionPrivateDelegate)privateDelegate
{
  return (GKSessionPrivateDelegate *)objc_loadWeak(&self->_privateDelegate);
}

- (NSString)description
{
  __CFString *v2;
  void *v3;

  v2 = copyAGPSessionStatistics();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), -[__CFString UTF8String](v2, "UTF8String"));

  return (NSString *)v3;
}

- (GKSessionInternal)initWithConnection:(id)a3 session:(id)a4 delegate:(id)a5
{
  char *v8;
  int v9;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  objc_super v22;
  _BYTE buf[22];
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[10];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)GKSessionInternal;
  v8 = -[GKSessionInternal init](&v22, sel_init);
  if (v8)
  {
    VRTraceReset();
    *((_QWORD *)v8 + 1) = a4;
    v8[426] = 1;
    *((_DWORD *)v8 + 98) = -1;
    *((_DWORD *)v8 + 12) = objc_msgSend(a3, "gckPID");
    *((_QWORD *)v8 + 8) = objc_msgSend(a3, "gckSession");
    objc_storeWeak((id *)v8 + 11, a5);
    objc_msgSend(a3, "setEventDelegate:", v8);
    *((_QWORD *)v8 + 10) = a3;
    if (GCKSessionSetEventCallback(*((_QWORD *)v8 + 8), (uint64_t)AGPNetworkEventListener, (uint64_t)v8))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKSessionInternal initWithConnection:session:delegate:].cold.3();
      }
LABEL_11:

      return 0;
    }
    v9 = AGPSessionCreate(*((_QWORD *)v8 + 8), *((_DWORD *)v8 + 12), (uint64_t)GKNetworkEventListener, (uint64_t)v8, (uint64_t *)v8 + 9);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKSessionInternal initWithConnection:session:delegate:].cold.2();
      }
      GCKSessionRelease();
      goto LABEL_11;
    }
    if (ErrorLogLevelForModule >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *((_DWORD *)v8 + 12);
        v15 = *((_QWORD *)v8 + 8);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithConnection:session:delegate:]";
        v24 = 1024;
        v25 = 2441;
        v26 = 1024;
        *(_DWORD *)v27 = v14;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = v15;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created ID:%u and GCKSession: %d *", buf, 0x28u);
      }
    }
    objc_msgSend(v8, "setDOOBReceiveHandler:withContext:inBand:", v8, 0, 1);
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    *((_QWORD *)v8 + 5) = NSStringCreateTruncatedStringWithMaxBytesInUTF8Encoding((void *)objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%f"), v17, v18));
    *((_QWORD *)v8 + 21) = objc_alloc_init(GKAutoPeerIDTable);
    *((_QWORD *)v8 + 20) = objc_alloc_init(GKTable);
    *((_QWORD *)v8 + 19) = objc_alloc_init(GKTable);
    *((_QWORD *)v8 + 22) = objc_alloc_init(GKList);
    *((_QWORD *)v8 + 23) = objc_alloc_init(GKList);
    *((_QWORD *)v8 + 24) = objc_alloc_init(GKList);
    *((_QWORD *)v8 + 25) = objc_alloc_init(GKList);
    *((_QWORD *)v8 + 26) = objc_alloc_init(GKList);
    *((_QWORD *)v8 + 54) = -[GKVoiceChatSessionListener initWithSession:]([GKVoiceChatSessionListener alloc], "initWithSession:", v8);
    memset(buf, 170, 16);
    pthread_mutexattr_init((pthread_mutexattr_t *)buf);
    pthread_mutexattr_settype((pthread_mutexattr_t *)buf, 2);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 216), (const pthread_mutexattr_t *)buf);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 280), (const pthread_mutexattr_t *)buf);
    pthread_mutexattr_destroy((pthread_mutexattr_t *)buf);
    if (GCKSessionStartEventCallbacks())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKSessionInternal initWithConnection:session:delegate:].cold.1();
      }
      goto LABEL_11;
    }
    if (!g_GKSessionGlobals)
      g_GKSessionGlobals = objc_alloc_init(GKSessionGlobals);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v21 = *((_QWORD *)v8 + 5);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithConnection:session:delegate:]";
        v24 = 1024;
        v25 = 2485;
        v26 = 2048;
        *(_QWORD *)v27 = v8;
        *(_WORD *)&v27[8] = 2112;
        v28 = v21;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] inited with GKConnection", buf, 0x30u);
      }
    }
  }
  return (GKSessionInternal *)v8;
}

- (GKSessionInternal)initWithSessionID:(id)a3 displayName:(id)a4 session:(id)a5 sessionMode:(unsigned int)a6
{
  unsigned __int8 *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int UniqueID;
  const char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  objc_super v45;
  _BYTE buf[22];
  __int16 v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  id v51;
  _BYTE v52[16];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)GKSessionInternal;
  v10 = -[GKSessionInternal init](&v45, sel_init);
  if (!v10)
    return (GKSessionInternal *)v10;
  VRTraceReset();
  *((_QWORD *)v10 + 1) = a5;
  *((_QWORD *)v10 + 10) = 0;
  *((_DWORD *)v10 + 87) = a6;
  v10[426] = 1;
  *((_DWORD *)v10 + 98) = -1;
  if (!objc_msgSend(a4, "length"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    a4 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@%f"), v12, v13);
  }
  if (!objc_msgSend(a3, "length"))
    a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  *((_QWORD *)v10 + 45) = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *((_QWORD *)v10 + 45);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]";
      v47 = 1024;
      v48 = 2514;
      v49 = 2112;
      *(_QWORD *)v50 = v16;
      *(_WORD *)&v50[8] = 2112;
      v51 = a4;
      _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initWithSessionID: %@ displayName: %@", buf, 0x30u);
    }
  }
  UniqueID = GCKSessionCreateUniqueID();
  if (GCKSessionCreate(1, UniqueID, (uint64_t)AGPNetworkEventListener, (uint64_t)v10, (_QWORD *)v10 + 8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal initWithSessionID:displayName:session:sessionMode:].cold.2();
    }
LABEL_18:

    return 0;
  }
  if (AGPSessionCreate(*((_QWORD *)v10 + 8), UniqueID, (uint64_t)GKNetworkEventListener, (uint64_t)v10, (uint64_t *)v10 + 9))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal initWithSessionID:displayName:session:sessionMode:].cold.1();
    }
    GCKSessionRelease();
    goto LABEL_18;
  }
  objc_msgSend(v10, "setDOOBReceiveHandler:withContext:inBand:", v10, 0, 1);
  GCKSessionSetWifiEnabled(*((_QWORD *)v10 + 8), v10[426]);
  GCKSessionSetDisconnectTimeout((float)(int)objc_msgSend((id)objc_msgSend(off_24D465868, "getClientOption:", *(_QWORD *)off_24D4656A8), "intValue"));
  v19 = (const char *)objc_msgSend(*((id *)v10 + 45), "UTF8String");
  memset(buf, 170, 20);
  memset(v52, 170, 14);
  v20 = strlen(v19);
  v21 = v20;
  if (v20 <= 14)
  {
    if (v20 < 1)
    {
      LODWORD(v22) = 0;
    }
    else
    {
      v22 = 0;
      v23 = v20;
      v24 = MEMORY[0x24BDAC740];
      while (1)
      {
        v25 = v19[v22];
        if (v25 - 48 >= 0xA)
        {
          v26 = (v25 & 0x80000000) != 0 ? __maskrune(v19[v22], 0x1000uLL) : *(_DWORD *)(v24 + 4 * v25 + 60) & 0x1000;
          if (v25 != 45 && v26 == 0)
            break;
        }
        if (v23 == ++v22)
          goto LABEL_35;
      }
    }
    if ((_DWORD)v22 == v21)
    {
LABEL_35:
      if (*v19 != 45 && v19[v21 - 1] != 45)
        goto LABEL_50;
    }
  }
  CCHmac(0, "", 0, v19, v21, buf);
  v28 = 0;
  LODWORD(v29) = 0;
  v30 = 0;
  do
  {
    v31 = buf[(int)v29] >> v30;
    v32 = v31 & 0x1F;
    if (v30 > 2)
    {
      v29 = (int)v29 + 1;
      if (v30 == 3)
      {
        v30 = 0;
      }
      else
      {
        v32 = ((buf[v29] << (8 - v30)) & 0x1F) + (v31 & 0x1F);
        v30 -= 3;
      }
    }
    else
    {
      v30 += 5;
    }
    if (v32 >= 0xA)
      v33 = 87;
    else
      v33 = 48;
    v52[v28++] = v33 + v32;
  }
  while (v28 != 14);
  v52[14] = 0;
  v34 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v52);
  if (v34)
  {
    v35 = (void *)v34;
    objc_msgSend(v10, "setServiceType:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%@._udp."), v34));

    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v10, "setServiceType:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_%@._udp."), *((_QWORD *)v10 + 45)));
LABEL_51:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_msgSend(v10, "serviceType");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]";
      v47 = 1024;
      v48 = 2551;
      v49 = 2112;
      *(_QWORD *)v50 = v38;
      _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set service type: %@", buf, 0x26u);
    }
  }
  objc_msgSend(v10, "setDomain:", CFSTR("local."));
  GCKSessionSetLocalName(*((_QWORD *)v10 + 8), (const void *)objc_msgSend(a4, "UTF8String"), objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4));
  *((_QWORD *)v10 + 4) = GCKSessionGetLocalServicePort();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v41 = *((_QWORD *)v10 + 8);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]";
      v47 = 1024;
      v48 = 2570;
      v49 = 1024;
      *(_DWORD *)v50 = UniqueID;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v41;
      _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created ID:%u and GCKSession: %d", buf, 0x28u);
    }
  }
  *((_DWORD *)v10 + 12) = UniqueID;
  *((_QWORD *)v10 + 5) = NSStringCreateTruncatedStringWithMaxBytesInUTF8Encoding(a4);
  *((_QWORD *)v10 + 21) = objc_alloc_init(GKAutoPeerIDTable);
  *((_QWORD *)v10 + 20) = objc_alloc_init(GKTable);
  *((_QWORD *)v10 + 19) = objc_alloc_init(GKTable);
  *((_QWORD *)v10 + 22) = objc_alloc_init(GKList);
  *((_QWORD *)v10 + 23) = objc_alloc_init(GKList);
  *((_QWORD *)v10 + 24) = objc_alloc_init(GKList);
  *((_QWORD *)v10 + 25) = objc_alloc_init(GKList);
  *((_QWORD *)v10 + 26) = objc_alloc_init(GKList);
  *((_QWORD *)v10 + 54) = -[GKVoiceChatSessionListener initWithSession:]([GKVoiceChatSessionListener alloc], "initWithSession:", v10);
  memset(buf, 170, 16);
  pthread_mutexattr_init((pthread_mutexattr_t *)buf);
  pthread_mutexattr_settype((pthread_mutexattr_t *)buf, 2);
  pthread_mutex_init((pthread_mutex_t *)(v10 + 216), (const pthread_mutexattr_t *)buf);
  pthread_mutex_init((pthread_mutex_t *)(v10 + 280), (const pthread_mutexattr_t *)buf);
  pthread_mutexattr_destroy((pthread_mutexattr_t *)buf);
  if (!g_GKSessionGlobals)
    g_GKSessionGlobals = objc_alloc_init(GKSessionGlobals);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v42 = VRTraceErrorLogLevelToCSTR();
    v43 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v44 = (void *)*((_QWORD *)v10 + 5);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKSessionInternal initWithSessionID:displayName:session:sessionMode:]";
      v47 = 1024;
      v48 = 2614;
      v49 = 2048;
      *(_QWORD *)v50 = v10;
      *(_WORD *)&v50[8] = 2112;
      v51 = v44;
      _os_log_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] inited", buf, 0x30u);
    }
  }
  return (GKSessionInternal *)v10;
}

- (void)reset
{
  uint64_t v3;
  NSObject *v4;
  NSString *displayName;
  id v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int sReset;
  uint64_t v19;
  NSObject *v20;
  _DNSServiceRef_t *dnsServiceConnection;
  uint64_t v22;
  NSObject *v23;
  _DNSServiceRef_t *dnsServiceResolveConnection;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      v25 = 136316162;
      v26 = v3;
      v27 = 2080;
      v28 = "-[GKSessionInternal reset]";
      v29 = 1024;
      v30 = 2620;
      v31 = 2048;
      *(_QWORD *)v32 = self;
      *(_WORD *)&v32[8] = 2112;
      v33 = displayName;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] reset", (uint8_t *)&v25, 0x30u);
    }
  }
  -[GKSessionInternal lock](self, "lock");
  pthread_mutex_lock(&self->_delegateLock);
  self->_shutdown = 1;
  self->_stopHandlingEvents = 1;
  objc_storeWeak(&self->_privateDelegate, 0);
  objc_storeWeak(&self->_delegate, 0);
  self->_session = 0;
  v6 = -[GKList allMatchingObjectsFromTable:](self->_peersPendingIncomingInvitation, "allMatchingObjectsFromTable:", self->_peerIDTable);
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
      GCKSessionRespondToInvitation((uint64_t)self->sessionRef, objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", v7++), "unsignedIntValue"), 0);
    while (v7 < objc_msgSend(v6, "count"));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[GKTable count](self->_peerIDTable, "count");
      v11 = -[GKTable count](self->_peerNameTable, "count");
      v12 = -[GKTable count](self->_peerInfoTable, "count");
      v25 = 136316418;
      v26 = v8;
      v27 = 2080;
      v28 = "-[GKSessionInternal reset]";
      v29 = 1024;
      v30 = 2641;
      v31 = 1024;
      *(_DWORD *)v32 = v10;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v11;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = v12;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peerIDTable:%d, _peerNameTable:%d, _peerInfoTable:%d", (uint8_t *)&v25, 0x2Eu);
    }
  }
  -[GKTable removeAllObjects](self->_peerIDTable, "removeAllObjects");
  -[GKTable removeAllObjects](self->_peerNameTable, "removeAllObjects");
  -[GKTable removeAllObjects](self->_peerInfoTable, "removeAllObjects");
  -[GKList removeAllIDs](self->_peersAvailable, "removeAllIDs");
  -[GKList removeAllIDs](self->_peersConnected, "removeAllIDs");
  -[GKList removeAllIDs](self->_peersForCleanup, "removeAllIDs");
  -[GKList removeAllIDs](self->_peersPendingIncomingInvitation, "removeAllIDs");
  -[GKList removeAllIDs](self->_peersPendingOutgoingInvitation, "removeAllIDs");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[GKTable count](self->_peerIDTable, "count");
      v16 = -[GKTable count](self->_peerNameTable, "count");
      v17 = -[GKTable count](self->_peerInfoTable, "count");
      v25 = 136316418;
      v26 = v13;
      v27 = 2080;
      v28 = "-[GKSessionInternal reset]";
      v29 = 1024;
      v30 = 2652;
      v31 = 1024;
      *(_DWORD *)v32 = v15;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v16;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = v17;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peerIDTable:%d, _peerNameTable:%d, _peerInfoTable:%d", (uint8_t *)&v25, 0x2Eu);
    }
  }
  sReset = self->_sReset;
  if (sReset != -1)
  {
    close(sReset);
    self->_sReset = -1;
  }
  if (self->_dnsServiceConnection)
  {
    *(_WORD *)&self->_isSearching = 0;
    self->_serviceBrowser = 0;
    self->_service = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceConnection = self->_dnsServiceConnection;
        v25 = 136315906;
        v26 = v19;
        v27 = 2080;
        v28 = "-[GKSessionInternal reset]";
        v29 = 1024;
        v30 = 2664;
        v31 = 1024;
        *(_DWORD *)v32 = (_DWORD)dnsServiceConnection;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceConnection) (%08X)", (uint8_t *)&v25, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_dnsServiceConnection);
    self->_dnsServiceConnection = 0;
  }
  if (self->_dnsServiceResolveConnection)
  {
    -[GKTable makeObjectsPerformSelector:](self->_peerInfoTable, "makeObjectsPerformSelector:", sel_clearResolving);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
        v25 = 136315906;
        v26 = v22;
        v27 = 2080;
        v28 = "-[GKSessionInternal reset]";
        v29 = 1024;
        v30 = 2670;
        v31 = 1024;
        *(_DWORD *)v32 = (_DWORD)dnsServiceResolveConnection;
        _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_dnsServiceResolveConnection) (%08X)", (uint8_t *)&v25, 0x22u);
      }
    }
    DNSServiceRefDeallocate(self->_dnsServiceResolveConnection);
    self->_dnsServiceResolveConnection = 0;
  }
  self->_isBusy = 0;
  self->_sessionStarted = 0;
  pthread_mutex_unlock(&self->_delegateLock);
  -[GKSessionInternal unlock](self, "unlock");
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSString *displayName;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  GKSessionInternal *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      *(_DWORD *)buf = 136316162;
      v8 = v3;
      v9 = 2080;
      v10 = "-[GKSessionInternal dealloc]";
      v11 = 1024;
      v12 = 2682;
      v13 = 2048;
      v14 = self;
      v15 = 2112;
      v16 = displayName;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d session[%p] [%@] dealloc", buf, 0x30u);
    }
  }
  -[GKSessionInternal reset](self, "reset");
  objc_storeWeak(&self->_dataReceiveHandler, 0);
  AGPSessionRelease();
  GCKSessionRelease();

  -[GKConnection setEventDelegate:](self->_connection, "setEventDelegate:", 0);
  -[GKConnection preRelease](self->_connection, "preRelease");

  -[GKSessionInternal setDomain:](self, "setDomain:", 0);
  -[GKSessionInternal setServiceType:](self, "setServiceType:", 0);
  pthread_mutex_destroy(&self->_lock);
  pthread_mutex_destroy(&self->_delegateLock);
  v6.receiver = self;
  v6.super_class = (Class)GKSessionInternal;
  -[GKSessionInternal dealloc](&v6, sel_dealloc);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (id)displayNameForPeer:(id)a3
{
  uint64_t v4;
  NSString *v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "intValue");
  if ((_DWORD)v4 != self->_pid)
  {
    v8 = -[GKTable objectForKey:](self->_peerNameTable, "objectForKey:", v4);
    if (v8)
    {
      v5 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return v5;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        return v5;
      v16 = 136316162;
      v17 = v9;
      v18 = 2080;
      v19 = "-[GKSessionInternal displayNameForPeer:]";
      v20 = 1024;
      v21 = 2728;
      v22 = 1024;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      v11 = " [%s] %s:%d displayNameForPeer: %d = %@ (table)";
    }
    else
    {
      v12 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v4);
      if (!v12 || (v13 = objc_msgSend(v12, "displayName")) == 0)
      {
LABEL_17:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[GKSessionInternal displayNameForPeer:].cold.1();
        }
        v5 = 0;
        return v5;
      }
      v5 = (NSString *)v13;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return v5;
      v14 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        return v5;
      v16 = 136316162;
      v17 = v14;
      v18 = 2080;
      v19 = "-[GKSessionInternal displayNameForPeer:]";
      v20 = 1024;
      v21 = 2732;
      v22 = 1024;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      v11 = " [%s] %s:%d displayNameForPeer: %d = %@ (peer)";
    }
    _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0x2Cu);
    return v5;
  }
  v5 = -[GKSessionInternal displayName](self, "displayName");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136316162;
      v17 = v6;
      v18 = 2080;
      v19 = "-[GKSessionInternal displayNameForPeer:]";
      v20 = 1024;
      v21 = 2726;
      v22 = 1024;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d displayNameForPeer: %d = %@ (self)", (uint8_t *)&v16, 0x2Cu);
    }
  }
  if (!v5)
    goto LABEL_17;
  return v5;
}

- (BOOL)sendAudioData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  return -[GKSessionInternal sendData:toPeers:withDataMode:enableOOB:error:](self, "sendData:toPeers:withDataMode:enableOOB:error:", a3, a4, *(_QWORD *)&a5, 1, a6);
}

- (BOOL)passesSendDataSanityCheck:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  BOOL v6;
  int v8;
  const __CFString *v9;
  const __CFString *v10;

  if (a4)
    v6 = a5 > 1;
  else
    v6 = 1;
  v8 = v6 || a3 == 0;
  if (a6 && v8)
  {
    v9 = CFSTR("Parameter mode is invalid.");
    if (!a4)
      v9 = CFSTR("Parameter peers is invalid.");
    if (a3)
      v10 = v9;
    else
      v10 = CFSTR("Parameter data is invalid.");
    *a6 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Invalid parameter for -sendData:toPeers:withDataMode:error:"), v10);
  }
  return v8 ^ 1;
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 error:(id *)a6
{
  return -[GKSessionInternal sendData:toPeers:withDataMode:enableOOB:error:](self, "sendData:toPeers:withDataMode:enableOOB:error:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(unsigned int)a5 enableOOB:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  unsigned int v9;
  _BOOL4 v13;
  id v14;
  id v15;
  UInt8 *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  UInt8 *v28;
  _BOOL8 v29;
  uint64_t v30;
  NSObject *v31;
  id *v33;
  unsigned int v34;
  int v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v8 = a6;
  v9 = a5;
  v49 = *MEMORY[0x24BDAC8D0];
  if (a7)
    *a7 = 0;
  v13 = -[GKSessionInternal passesSendDataSanityCheck:toPeers:withDataMode:error:](self, "passesSendDataSanityCheck:toPeers:withDataMode:error:", a3, a4, *(_QWORD *)&a5, a7);
  if (!v13)
    return v13;
  v14 = a3;
  v15 = a4;
  v16 = (UInt8 *)objc_msgSend(a3, "bytes");
  v35 = objc_msgSend(a3, "length");
  -[GKSessionInternal lock](self, "lock");
  if (!objc_msgSend(a4, "count"))
  {
    -[GKSessionInternal unlock](self, "unlock");
    v17 = 0;
    goto LABEL_27;
  }
  v33 = a7;
  v36 = 0;
  v17 = 0;
  v18 = 0;
  v34 = v9;
  do
  {
    v19 = objc_msgSend(a4, "objectAtIndexedSubscript:", v18);
    if (!v19)
      goto LABEL_22;
    v20 = (void *)v19;
    if (-[NSString isEqualToString:](-[GKSession peerID](self->_session, "peerID"), "isEqualToString:", v19))
    {
      -[GKSessionInternal performSelector:withObject:](self, "performSelector:withObject:", sel_tellDelegate_didReceiveData_, objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v20, CFSTR("peerID"), a3, CFSTR("data"), 0));
      goto LABEL_22;
    }
    v38 = -1431655766;
    v21 = objc_msgSend(v20, "intValue");
    v37 = -1431655766;
    v38 = v21;
    if (!v8)
    {
      v23 = v35;
      v24 = v9;
      v25 = 0;
LABEL_14:
      v22 = AGPSessionSendTo((uint64_t)self->agpSessionRef, &v38, 1, v16, v23, (uint64_t)&v37, v24, v25);
      goto LABEL_15;
    }
    if (v9 != 1)
    {
      v23 = v35;
      v24 = v9;
      v25 = 1;
      goto LABEL_14;
    }
    v22 = AGPSessionSendAudioTo();
LABEL_15:
    v26 = v22;
    if ((_DWORD)v22)
    {
      ++v17;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = v17;
        v28 = v16;
        v29 = v8;
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v40 = v30;
          v41 = 2080;
          v42 = "-[GKSessionInternal sendData:toPeers:withDataMode:enableOOB:error:]";
          v43 = 1024;
          v44 = 2821;
          v45 = 2048;
          v46 = v38;
          v47 = 2048;
          v48 = v26;
          _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AGPSessionSendTo failed for peer:(%lx) error:(%lX)\n", buf, 0x30u);
        }
        v8 = v29;
        v16 = v28;
        v17 = v27;
        v9 = v34;
      }
    }
    else
    {
      v26 = v36;
    }
    v36 = v26;
LABEL_22:
    ++v18;
  }
  while (v18 < objc_msgSend(a4, "count"));
  -[GKSessionInternal unlock](self, "unlock");
  if (v33 && v17)
    *v33 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30202, CFSTR("Send data error."), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AGPSessionSendTo failed (%08X)."), v36));
LABEL_27:

  LOBYTE(v13) = v17 != objc_msgSend(a4, "count");
  return v13;
}

- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(unsigned int)a4 error:(id *)a5
{
  id v9;
  UInt8 *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  BOOL result;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    if (a5)
      *a5 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Invalid parameter for -sendDataToAllPeers:withDataMode:error:"), CFSTR("Parameter data is invalid."));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      v19 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v19)
        return result;
      *(_DWORD *)buf = 136315650;
      v21 = v17;
      v22 = 2080;
      v23 = "-[GKSessionInternal sendDataToAllPeers:withDataMode:error:]";
      v24 = 1024;
      v25 = 2850;
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendDataToAllPeers - bad parameter", buf, 0x1Cu);
    }
    return 0;
  }
  v9 = a3;
  v10 = (UInt8 *)objc_msgSend(a3, "bytes");
  v11 = objc_msgSend(a3, "length");
  -[GKSessionInternal lock](self, "lock");
  v12 = AGPSessionBroadcast((uint64_t)self->agpSessionRef, v10, v11, a4);
  -[GKSessionInternal unlock](self, "unlock");

  if ((_DWORD)v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v21 = v13;
        v22 = 2080;
        v23 = "-[GKSessionInternal sendDataToAllPeers:withDataMode:error:]";
        v24 = 1024;
        v25 = 2871;
        v26 = 1024;
        v27 = v12;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AGPSessionBroadcast failed (%08x)", buf, 0x22u);
      }
    }
    if (a5)
    {
      v15 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30202, CFSTR("Send data error."), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AGPSessionBroadcast failed (%08X)."), v12));
      result = 0;
      *a5 = v15;
      return result;
    }
    return 0;
  }
  return 1;
}

- (void)receiveDOOB:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6
{
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316418;
      v13 = v10;
      v14 = 2080;
      v15 = "-[GKSessionInternal receiveDOOB:fromPeer:inSession:context:]";
      v16 = 1024;
      v17 = 2890;
      v18 = 1024;
      v19 = objc_msgSend(a3, "length");
      v20 = 2048;
      v21 = (int)objc_msgSend(a4, "intValue");
      v22 = 2112;
      v23 = objc_msgSend(a5, "displayNameForPeer:", a4);
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RetryICE:: gcksession:didReceiveDOOB: %d bytes fromPeer: %08lx %@", (uint8_t *)&v12, 0x36u);
    }
  }
  GCKSessionReceiveDOOB((uint64_t)self->sessionRef, objc_msgSend(a4, "intValue"), (char *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
}

- (void)setDOOBReceiveHandler:(id)a3 withContext:(void *)a4 inBand:(unsigned int)a5
{
  _opaque_pthread_mutex_t *p_delegateLock;
  const __CFString *v10;
  id v11;
  void *v12;

  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = CFSTR("The out-of-band data handler does not respond to the correct selector.");
  }
  else
  {
    if (a5 == 1)
    {
      self->_doobReceiveHandler[1] = (GKSessionDOOBReceiveHandler *)a3;
      self->_doobReceiveHandlerContext[1] = a4;
      goto LABEL_11;
    }
    v10 = CFSTR("The band specifier is out-of-range for this implementation or build version.");
  }
  v11 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Invalid parameter for -setOOBReceiveHandler:withContext:inBand"), v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v11, CFSTR("NSError"), 0);
  -[GKSessionInternal delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_sessionDidFailWithError_, v12, 0);
  }

LABEL_11:
  pthread_mutex_unlock(p_delegateLock);
}

- (id)dataReceiveHandler
{
  return objc_loadWeak(&self->_dataReceiveHandler);
}

- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4
{
  _opaque_pthread_mutex_t *p_delegateLock;
  id v8;
  void *v9;

  p_delegateLock = &self->_delegateLock;
  pthread_mutex_lock(&self->_delegateLock);
  if (a3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Invalid parameter for -setDataReceiveHandler:withContext:"), CFSTR("The handler does not respond to the correct selector."));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v8, CFSTR("NSError"), 0);
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0
      || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
    {
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_sessionDidFailWithError_, v9, 0);
    }

  }
  else
  {
    objc_storeWeak(&self->_dataReceiveHandler, a3);
    self->_dataReceiveHandlerContext = a4;
  }
  pthread_mutex_unlock(p_delegateLock);
}

- (void)timeoutConnectToPeer:(id)a3
{
  id v5;
  int ErrorLogLevelForModule;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *displayName;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  int v18;
  _BOOL4 v19;
  int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  timeval v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  _BYTE v35[10];
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v7 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      displayName = self->_displayName;
      objc_msgSend(a3, "connectTimeout");
      *(_DWORD *)buf = 136316162;
      v27 = v8;
      v28 = 2080;
      v29 = "-[GKSessionInternal timeoutConnectToPeer:]";
      v30 = 1024;
      v31 = 2952;
      v32 = 2112;
      v33 = displayName;
      v34 = 2048;
      *(_QWORD *)v35 = v11;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] timeoutConnectToPeer: scheduled for %.3lf seconds in the future", buf, 0x30u);
    }
  }
  *(&v25.tv_usec + 1) = -1431655766;
  objc_msgSend(a3, "connectTimeout");
  v13 = v12;
  v25.tv_sec = (uint64_t)v12;
  objc_msgSend(a3, "connectTimeout");
  v25.tv_usec = (int)((v14 - (double)(uint64_t)v13) * 1000000.0);
  select(0, 0, 0, 0, &v25);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_displayName;
      v18 = objc_msgSend(a3, "pid");
      v19 = -[GKList hasID:](self->_peersConnected, "hasID:", objc_msgSend(a3, "pid"));
      v20 = objc_msgSend(a3, "needsToTimeout");
      *(_DWORD *)buf = 136316674;
      v27 = v15;
      v28 = 2080;
      v29 = "-[GKSessionInternal timeoutConnectToPeer:]";
      v30 = 1024;
      v31 = 2959;
      v32 = 2112;
      v33 = v17;
      v34 = 1024;
      *(_DWORD *)v35 = v18;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = v19;
      v36 = 1024;
      v37 = v20;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] timeoutConnectToPeer: %d - connected?(%d) needs to?(%d)", buf, 0x38u);
    }
  }
  if (!-[GKList hasID:](self->_peersConnected, "hasID:", objc_msgSend(a3, "pid")))
  {
    if (objc_msgSend(a3, "needsToTimeout"))
    {
      GCKSessionCancelConnectToLocalService((uint64_t)self->sessionRef, objc_msgSend(a3, "pid"));
      v21 = -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(a3, "pid"));
      if (v21)
      {
        v22 = v21;
        -[GKSessionInternal delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0
          || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
        {
          v23 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30503, CFSTR("Connect attempt timed out."), CFSTR("Connect attempt timed out."));
          v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v22, CFSTR("peerID"), v23, CFSTR("NSError"), 0);
          pthread_mutex_lock(&self->_delegateLock);
          -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_connectionRequestToPeerFailed_, v24, 0);
          pthread_mutex_lock(&self->_delegateLock);

        }
      }
    }
  }

  objc_msgSend(v5, "drain");
}

- (void)connectToPeer:(id)a3 withTimeout:(double)a4
{
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  DNSServiceErrorType v20;
  DNSServiceErrorType v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  DNSServiceRef sdRef;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[14];
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "intValue");
  v8 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v7);
  if (v8)
  {
    v9 = v8;
    -[GKList addID:](self->_peersPendingOutgoingInvitation, "addID:", v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v32 = v10;
        v33 = 2080;
        v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
        v35 = 1024;
        v36 = 3009;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving? potentially previous resolves", buf, 0x1Cu);
      }
    }
    objc_msgSend(v9, "stopResolving");
    v12 = 30000000.0;
    if (a4 != 0.0)
      v12 = a4;
    objc_msgSend(v9, "setConnectTimeout:", v12);
    objc_msgSend(v9, "setNeedsToTimeout:", 1);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
    -[GKConnection reportingAgent](self->_connection, "reportingAgent");
    connectingGKLog();
    -[GKConnection reportingAgent](self->_connection, "reportingAgent");
    reportingGKAppInfo();
    if (-[GKSessionInternal checkDNSConnection](self, "checkDNSConnection"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v32 = v13;
          v33 = 2080;
          v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
          v35 = 1024;
          v36 = 3053;
          v15 = " [%s] %s:%d Connect: Unable to use DNS connection!";
          v16 = v14;
          v17 = 28;
LABEL_25:
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
      }
    }
    else
    {
      sdRef = self->_dnsServiceResolveConnection;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v32 = v18;
          v33 = 2080;
          v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
          v35 = 1024;
          v36 = 3029;
          v37 = 2112;
          *(_QWORD *)v38 = a3;
          _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ********** BEGIN RESOLVE: %@", buf, 0x26u);
        }
      }
      v20 = DNSServiceResolve(&sdRef, 0x24000u, 0, (const char *)objc_msgSend((id)objc_msgSend(v9, "serviceName"), "UTF8String"), -[NSString UTF8String](self->serviceType, "UTF8String"), "local.", (DNSServiceResolveReply)gkResolveCallback, v9);
      if (v20)
      {
        v21 = v20;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend((id)objc_msgSend(v9, "serviceName"), "UTF8String");
            v25 = -[NSString UTF8String](self->serviceType, "UTF8String");
            *(_DWORD *)buf = 136316418;
            v32 = v22;
            v33 = 2080;
            v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
            v35 = 1024;
            v36 = 3041;
            v37 = 1024;
            *(_DWORD *)v38 = v21;
            *(_WORD *)&v38[4] = 2080;
            *(_QWORD *)&v38[6] = v24;
            v39 = 2080;
            v40 = v25;
            v15 = " [%s] %s:%d resolve failed right away: %d [%s][%s]";
            v16 = v23;
            v17 = 54;
            goto LABEL_25;
          }
        }
      }
      else
      {
        objc_msgSend(v9, "setResolveService:", sdRef);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v9, "serviceName");
            *(_DWORD *)buf = 136316418;
            v32 = v26;
            v33 = 2080;
            v34 = "-[GKSessionInternal connectToPeer:withTimeout:]";
            v35 = 1024;
            v36 = 3047;
            v37 = 2112;
            *(_QWORD *)v38 = v28;
            *(_WORD *)&v38[8] = 1024;
            *(_DWORD *)&v38[10] = (_DWORD)sdRef;
            v39 = 1024;
            LODWORD(v40) = 0;
            v15 = " [%s] %s:%d peer [%@]: pending resolve: %08X (shares from %08X)";
            v16 = v27;
            v17 = 50;
            goto LABEL_25;
          }
        }
      }
    }
  }
  else if (a3)
  {
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0
      || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
    {
      v29 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30501, CFSTR("The peerID was not found."), CFSTR("Invalid peerID."));
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_connectionRequestToPeerFailed_, objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", a3, CFSTR("peerID"), v29, CFSTR("NSError"), 0), 0);

    }
  }
}

- (void)cancelConnectToPeer:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal cancelConnectToPeer:].cold.1();
    }
  }
  else if (a3)
  {
    v4 = objc_msgSend(a3, "intValue");
    v5 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v4);
    if (v5)
    {
      v6 = v5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315906;
          v10 = v7;
          v11 = 2080;
          v12 = "-[GKSessionInternal cancelConnectToPeer:]";
          v13 = 1024;
          v14 = 3070;
          v15 = 2112;
          v16 = objc_msgSend(v6, "displayName");
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ local cancelled", (uint8_t *)&v9, 0x26u);
        }
      }
      objc_msgSend(v6, "stopResolving");
    }
    -[GKConnection reportingAgent](self->_connection, "reportingAgent");
    reportingGKLog();
    GCKSessionCancelConnectToLocalService((uint64_t)self->sessionRef, v4);
    -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", v4);
  }
}

- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4
{
  BOOL v5;
  unsigned int v6;
  OpaqueGCKSession *sessionRef;

  if (self->_shutdown)
  {
    if (a4)
      *a4 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Session already released - invalid operation."), CFSTR("Session shutting down."));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal acceptConnectionFromPeer:error:].cold.1();
    }
  }
  else
  {
    if (a3)
    {
      v6 = objc_msgSend(a3, "intValue");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
      -[GKConnection reportingAgent](self->_connection, "reportingAgent");
      connectingGKLog();
      -[GKConnection reportingAgent](self->_connection, "reportingAgent");
      reportingGKAppInfo();
      sessionRef = self->sessionRef;
      v5 = 1;
      GCKSessionRespondToInvitation((uint64_t)sessionRef, v6, 1);
      return v5;
    }
    if (a4)
    {
      v5 = 0;
      *a4 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30500, CFSTR("Invalid parameter for -acceptConnectionFromPeer:error:"), CFSTR("Parameter peerID is invalid."));
      return v5;
    }
  }
  return 0;
}

- (void)denyConnectionFromPeer:(id)a3
{
  uint64_t v4;
  unsigned int v5;

  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKSessionInternal denyConnectionFromPeer:].cold.1();
    }
  }
  else if (a3)
  {
    v4 = objc_msgSend(a3, "intValue");
    v5 = v4;
    -[GKList removeID:](self->_peersPendingIncomingInvitation, "removeID:", v4);
    -[GKConnection reportingAgent](self->_connection, "reportingAgent");
    reportingGKLog();
    GCKSessionRespondToInvitation((uint64_t)self->sessionRef, v5, 0);
  }
}

- (void)disconnectPeerFromAllPeers:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  GKOOBMessage *v7;
  GKOOBMessage *v8;
  id v9;
  void *v10;
  id v11;
  UInt8 *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  unsigned int v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = v3;
        v25 = 2080;
        v26 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
        v27 = 1024;
        v28 = 3129;
        v5 = " [%s] %s:%d cannot disconnect peer after reset";
LABEL_5:
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if (a3)
  {
    v22 = objc_msgSend(a3, "intValue");
    -[GKConnection reportingAgent](self->_connection, "reportingAgent");
    reportingGKLog();
    v7 = -[GKOOBMessage initWithMessageType:]([GKOOBMessage alloc], "initWithMessageType:", 1500);
    if (v7)
    {
      v8 = v7;
      v9 = -[GKOOBMessage data](v7, "data");
      if (v9)
      {
        v10 = v9;
        v11 = v9;
        v12 = (UInt8 *)objc_msgSend(v10, "bytes");
        v13 = objc_msgSend(v10, "length");
        -[GKSessionInternal lock](self, "lock");
        v21 = -1431655766;
        v14 = AGPSessionSendTo((uint64_t)self->agpSessionRef, &v22, 1, v12, v13, (uint64_t)&v21, 0, 1);
        if (v14)
        {
          v15 = v14;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v24 = v16;
              v25 = 2080;
              v26 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
              v27 = 1024;
              v28 = 3165;
              v29 = 2048;
              v30 = v22;
              v31 = 2048;
              v32 = v15;
              _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnectPeerFromAllPeers: AGPSessionSendTo failed for peer:(%lx) error:(%lX)\n", buf, 0x30u);
            }
          }
        }
        -[GKSessionInternal unlock](self, "unlock");

      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v24 = v19;
          v25 = 2080;
          v26 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
          v27 = 1024;
          v28 = 3150;
          _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d disconnectPeerFromAllPeers: can't get message data", buf, 0x1Cu);
        }
      }

    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = v18;
        v25 = 2080;
        v26 = "-[GKSessionInternal disconnectPeerFromAllPeers:]";
        v27 = 1024;
        v28 = 3145;
        v5 = " [%s] %s:%d disconnectPeerFromAllPeers: can't create message";
        goto LABEL_5;
      }
    }
  }
}

- (void)disconnectFromAllPeers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d cannot disconnect self after reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)setAvailable:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  _BOOL4 isSearching;
  _BOOL4 isPublishing;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  _DNSServiceRef_t *v23;
  uint64_t v24;
  NSObject *v25;
  _DNSServiceRef_t *v26;
  int LocalInterfaceListWithOptions;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 sessionStarted;
  unsigned int mode;
  uint64_t v35;
  NSObject *v36;
  _DNSServiceRef_t *serviceBrowser;
  uint64_t v38;
  NSObject *v39;
  _DNSServiceRef_t *service;
  _BYTE buf[12];
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v5;
      v42 = 2080;
      v43 = "-[GKSessionInternal setAvailable:]";
      v44 = 1024;
      v45 = 3189;
      v46 = 1024;
      v47 = v3;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setAvailable: %d", buf, 0x22u);
    }
  }
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v7;
        v42 = 2080;
        v43 = "-[GKSessionInternal setAvailable:]";
        v44 = 1024;
        v45 = 3192;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cannot setavailable after reset", buf, 0x1Cu);
      }
    }
    return;
  }
  if (v3)
  {
    v9 = +[GKBluetoothSupport bluetoothStatus](GKBluetoothSupport, "bluetoothStatus");
    v10 = v9;
    if (self->_wifiEnabled || v9 == 5)
    {
      if (!self->_wifiEnabled)
        goto LABEL_45;
      *(_QWORD *)buf = 0;
      LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
      v28 = *(_QWORD *)buf;
      if (LocalInterfaceListWithOptions >= 1)
      {
        v29 = 0;
        v30 = 40 * LocalInterfaceListWithOptions;
        while ((*(_BYTE *)(v28 + v29) & 1) != 0 || strcmp((const char *)(v28 + v29 + 4), "en0"))
        {
          v29 += 40;
          if (v30 == v29)
            goto LABEL_42;
        }
        FreeLocalInterfaceList();
        goto LABEL_45;
      }
LABEL_42:
      FreeLocalInterfaceList();
      if (v10 != 4)
      {
LABEL_45:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            sessionStarted = self->_sessionStarted;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v31;
            v42 = 2080;
            v43 = "-[GKSessionInternal setAvailable:]";
            v44 = 1024;
            v45 = 3271;
            v46 = 1024;
            v47 = sessionStarted;
            _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionStarted: %d", buf, 0x22u);
          }
        }
        if (!self->_sessionStarted)
        {
          self->_sessionStarted = 1;
          self->_isBusy = 0;
          mode = self->_mode;
          if (mode - 1 <= 1)
          {
            if (self->_serviceBrowser)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v35 = VRTraceErrorLogLevelToCSTR();
                v36 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  serviceBrowser = self->_serviceBrowser;
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v35;
                  v42 = 2080;
                  v43 = "-[GKSessionInternal setAvailable:]";
                  v44 = 1024;
                  v45 = 3286;
                  v46 = 1024;
                  v47 = (int)serviceBrowser;
                  _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
                }
              }
              DNSServiceRefDeallocate(self->_serviceBrowser);
              self->_serviceBrowser = 0;
            }
            self->_isSearching = 1;
            -[GKSessionInternal browse](self, "browse");
            mode = self->_mode;
          }
          if ((mode | 2) == 2)
          {
            objc_msgSend((id)g_GKSessionGlobals, "registerPID:", self->_pid);
            if (self->_service)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v38 = VRTraceErrorLogLevelToCSTR();
                v39 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  service = self->_service;
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v38;
                  v42 = 2080;
                  v43 = "-[GKSessionInternal setAvailable:]";
                  v44 = 1024;
                  v45 = 3298;
                  v46 = 1024;
                  v47 = (int)service;
                  _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
                }
              }
              DNSServiceRefDeallocate(self->_service);
              self->_service = 0;
            }
            self->_isPublishing = 0;
            -[GKSessionInternal publish](self, "publish");
          }
        }
        return;
      }
      v11 = CFSTR("Network not available.");
      v12 = CFSTR("WiFi and/or Bluetooth is required.");
    }
    else
    {
      v11 = CFSTR("Bluetooth not available.");
      v12 = CFSTR("Bluetooth is required.");
    }
    v13 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](self, "newNSErrorFromGKSessionError:description:reason:", 30509, v11, v12);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v13, CFSTR("NSError"), 0);
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_sessionDidFailWithError_, v14, 0);

    goto LABEL_45;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_sessionStarted;
      isSearching = self->_isSearching;
      isPublishing = self->_isPublishing;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v15;
      v42 = 2080;
      v43 = "-[GKSessionInternal setAvailable:]";
      v44 = 1024;
      v45 = 3197;
      v46 = 1024;
      v47 = v17;
      v48 = 1024;
      v49 = isSearching;
      v50 = 1024;
      v51 = isPublishing;
      _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sessionStarted: %d  (%d, %d)", buf, 0x2Eu);
    }
  }
  if (self->_sessionStarted)
  {
    v20 = self->_mode;
    if (v20 - 1 <= 1 && self->_isSearching)
    {
      if (self->_serviceBrowser)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v23 = self->_serviceBrowser;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v21;
            v42 = 2080;
            v43 = "-[GKSessionInternal setAvailable:]";
            v44 = 1024;
            v45 = 3207;
            v46 = 1024;
            v47 = (int)v23;
            _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X)", buf, 0x22u);
          }
        }
        DNSServiceRefDeallocate(self->_serviceBrowser);
      }
      self->_isSearching = 0;
      -[GKList removeAllIDs](self->_peersAvailable, "removeAllIDs");
      v20 = self->_mode;
    }
    if ((v20 | 2) == 2)
    {
      objc_msgSend((id)g_GKSessionGlobals, "unregisterPID:", self->_pid);
      if (self->_isPublishing)
      {
        if (self->_service)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v24 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v26 = self->_service;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = v24;
              v42 = 2080;
              v43 = "-[GKSessionInternal setAvailable:]";
              v44 = 1024;
              v45 = 3219;
              v46 = 1024;
              v47 = (int)v26;
              _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
            }
          }
          DNSServiceRefDeallocate(self->_service);
        }
        self->_isPublishing = 0;
      }
    }
    self->_sessionStarted = 0;
  }
}

- (BOOL)isAvailable
{
  return self->_sessionStarted;
}

- (id)peersWithConnectionState:(unsigned int)a3
{
  id v3;
  GKList *peersAvailable;

  v3 = 0;
  switch(a3)
  {
    case 0u:
      peersAvailable = self->_peersAvailable;
      return -[GKList allMatchingObjectsFromTable:](peersAvailable, "allMatchingObjectsFromTable:", self->_peerIDTable);
    case 2u:
    case 5u:
      peersAvailable = self->_peersConnected;
      return -[GKList allMatchingObjectsFromTable:](peersAvailable, "allMatchingObjectsFromTable:", self->_peerIDTable);
    case 4u:
      v3 = -[GKList allMatchingObjectsFromTable:](self->_peersPendingIncomingInvitation, "allMatchingObjectsFromTable:", self->_peerIDTable);
      objc_msgSend(v3, "addObjectsFromArray:", -[GKList allMatchingObjectsFromTable:](self->_peersPendingOutgoingInvitation, "allMatchingObjectsFromTable:", self->_peerIDTable));
      return v3;
    default:
      return v3;
  }
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)stopOldService
{
  _DNSServiceRef_t *oldService;
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = xmmword_215CDD9F0;
  DWORD2(v6) = 0;
  select(0, 0, 0, 0, (timeval *)&v6);
  oldService = self->_oldService;
  if (oldService)
  {
    self->_oldService = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[GKSessionInternal stopOldService]";
        v11 = 1024;
        v12 = 3361;
        v13 = 1024;
        v14 = (int)oldService;
        _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceToStop) (%08X)", buf, 0x22u);
      }
    }
    DNSServiceRefDeallocate(oldService);
  }
}

- (void)setBusy:(BOOL)a3
{
  DNSServiceErrorType v4;
  const char *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  int Length;
  _DNSServiceRef_t *service;
  uint16_t v11;
  const void *BytesPtr;
  DNSServiceErrorType updated;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BYTE v23[10];
  TXTRecordRef txtRecord;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (self->_isBusy != a3)
  {
    self->_isBusy = a3;
    -[GKSessionInternal lock](self, "lock");
    if (self->_isPublishing)
    {
      txtRecord.ForceNaturalAlignment = (char *)0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&txtRecord.ForceNaturalAlignment + 1) = 0xAAAAAAAAAAAAAAAALL;
      TXTRecordCreate(&txtRecord, 0, 0);
      v4 = TXTRecordSetValue(&txtRecord, "txtvers", 1u, "1");
      if (self->_isBusy)
        v5 = "B";
      else
        v5 = "A";
      v6 = (TXTRecordSetValue(&txtRecord, "state", 1u, v5) | v4) == 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (v6)
            Length = TXTRecordGetLength(&txtRecord);
          else
            Length = 0;
          v16 = 136316162;
          v17 = v7;
          v18 = 2080;
          v19 = "-[GKSessionInternal setBusy:]";
          v20 = 1024;
          v21 = 3401;
          v22 = 1024;
          *(_DWORD *)v23 = v6;
          *(_WORD *)&v23[4] = 1024;
          *(_DWORD *)&v23[6] = Length;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceUpdateRecord() (use?=%d len=%d)", (uint8_t *)&v16, 0x28u);
        }
      }
      service = self->_service;
      if (v6)
      {
        v11 = TXTRecordGetLength(&txtRecord);
        BytesPtr = TXTRecordGetBytesPtr(&txtRecord);
      }
      else
      {
        v11 = 0;
        BytesPtr = 0;
      }
      updated = DNSServiceUpdateRecord(service, 0, 0x20000u, v11, BytesPtr, 0);
      TXTRecordDeallocate(&txtRecord);
      if (updated && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315906;
          v17 = v14;
          v18 = 2080;
          v19 = "-[GKSessionInternal setBusy:]";
          v20 = 1024;
          v21 = 3410;
          v22 = 2048;
          *(_QWORD *)v23 = self;
          _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d failed to set busy state for session[%p]", (uint8_t *)&v16, 0x26u);
        }
      }
    }
    -[GKSessionInternal unlock](self, "unlock");
  }
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
  GCKSessionSetWifiEnabled((uint64_t)self->sessionRef, a3);
}

- (BOOL)isPeerBusy:(id)a3
{
  id v3;

  v3 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", objc_msgSend(a3, "intValue"));
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "isBusy");
  return (char)v3;
}

- (void)setDisconnectTimeout:(double)a3
{
  GCKSessionSetDisconnectTimeout(a3);
  self->disconnectTimeout = a3;
}

- (double)disconnectTimeout
{
  return self->disconnectTimeout;
}

- (void)handleEvents
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int sReset;
  int v14;
  int v15;
  int v16;
  _DNSServiceRef_t *dnsServiceConnection;
  dnssd_sock_t v18;
  int v19;
  _DNSServiceRef_t *dnsServiceResolveConnection;
  dnssd_sock_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  DNSServiceErrorType v26;
  DNSServiceErrorType v27;
  uint64_t v28;
  NSObject *v29;
  DNSServiceErrorType v30;
  DNSServiceErrorType v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  int v37;
  int ErrorLogLevelForModule;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  int *v48;
  char *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  uint64_t v53;
  NSObject *v54;
  __int128 v55;
  int v56;
  timeval v57;
  uint8_t v58[4];
  uint64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  char *v69;
  fd_set buf;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v57.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v57.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  v3 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      buf.fds_bits[0] = 136315906;
      *(_QWORD *)&buf.fds_bits[1] = v4;
      LOWORD(buf.fds_bits[3]) = 2080;
      *(_QWORD *)((char *)&buf.fds_bits[3] + 2) = "-[GKSessionInternal handleEvents]";
      HIWORD(buf.fds_bits[5]) = 1024;
      buf.fds_bits[6] = 3465;
      LOWORD(buf.fds_bits[7]) = 1024;
      *(__int32_t *)((char *)&buf.fds_bits[7] + 2) = -[GKSessionInternal retainCount](self, "retainCount");
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents started (%d)", (uint8_t *)&buf, 0x22u);
    }
  }
  memset(&buf, 0, sizeof(buf));
  -[GKSessionInternal lock](self, "lock");
  if (!self->_stopHandlingEvents)
  {
    v56 = 0;
    *(_QWORD *)&v6 = 136315906;
    v55 = v6;
    do
    {
      if (self->_shutdown)
        break;
      sReset = self->_sReset;
      if (sReset != -1)
        close(sReset);
      v14 = socket(2, 1, 6);
      self->_sReset = v14;
      if (v14 == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v44 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v58 = 136315650;
            v59 = v44;
            v60 = 2080;
            v61 = "-[GKSessionInternal handleEvents]";
            v62 = 1024;
            v63 = 3487;
            v9 = " [%s] %s:%d handleEvents stop... (cannot create reset socket)";
            goto LABEL_8;
          }
        }
        goto LABEL_9;
      }
      v15 = v14;
      if (__darwin_check_fd_set_overflow(v14, &buf, 0))
        *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v15;
      v16 = self->_sReset;
      -[GKSessionInternal unlock](self, "unlock", v55);
      dnsServiceConnection = self->_dnsServiceConnection;
      if (!dnsServiceConnection || (v18 = DNSServiceRefSockFD(dnsServiceConnection), v18 == -1))
      {
        v19 = -1;
      }
      else
      {
        v19 = v18;
        if (__darwin_check_fd_set_overflow(v18, &buf, 0))
          *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v19 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v19;
        if (v16 <= v19)
          v16 = v19;
      }
      dnsServiceResolveConnection = self->_dnsServiceResolveConnection;
      if (!dnsServiceResolveConnection || (v21 = DNSServiceRefSockFD(dnsServiceResolveConnection), v21 == -1))
      {
        v22 = -1;
      }
      else
      {
        v22 = v21;
        if (__darwin_check_fd_set_overflow(v21, &buf, 0))
          *(__int32_t *)((char *)buf.fds_bits + (((unint64_t)v22 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v22;
        v23 = v22;
        if (v16 < v22)
        {
LABEL_36:
          v57.tv_sec = 30;
          v57.tv_usec = 0;
          v24 = select(v22 + 1, &buf, 0, 0, &v57);
          v25 = v24;
          if (v24 < 0)
          {
            v37 = *__error();
            ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
            if (v37 != 9)
            {
              if (ErrorLogLevelForModule >= 7)
              {
                v45 = VRTraceErrorLogLevelToCSTR();
                v46 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v47 = *__error();
                  v48 = __error();
                  v49 = strerror(*v48);
                  *(_DWORD *)v58 = 136316418;
                  v59 = v45;
                  v60 = 2080;
                  v61 = "-[GKSessionInternal handleEvents]";
                  v62 = 1024;
                  v63 = 3585;
                  v64 = 1024;
                  v65 = v25;
                  v66 = 1024;
                  v67 = v47;
                  v68 = 2080;
                  v69 = v49;
                  v50 = " [%s] %s:%d select failed (%d): %d: %s";
                  v51 = v46;
                  v52 = 50;
LABEL_71:
                  _os_log_impl(&dword_215C5C000, v51, OS_LOG_TYPE_DEFAULT, v50, v58, v52);
                  goto LABEL_10;
                }
              }
              goto LABEL_10;
            }
            if (ErrorLogLevelForModule >= 7)
            {
              v39 = VRTraceErrorLogLevelToCSTR();
              v40 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v58 = 136315650;
                v59 = v39;
                v60 = 2080;
                v61 = "-[GKSessionInternal handleEvents]";
                v62 = 1024;
                v63 = 3580;
                v34 = v40;
                v35 = " [%s] %s:%d handleEvents: EBADF - retrying...";
                v36 = 28;
LABEL_56:
                _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, v35, v58, v36);
              }
            }
          }
          else if (v24)
          {
            if (v19 != -1)
            {
              if (__darwin_check_fd_set_overflow(v19, &buf, 0))
              {
                if (((*(unsigned int *)((char *)buf.fds_bits + (((unint64_t)v19 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v19) & 1) != 0)
                {
                  v26 = DNSServiceProcessResult(self->_dnsServiceConnection);
                  if (v26)
                  {
                    v27 = v26;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v28 = VRTraceErrorLogLevelToCSTR();
                      v29 = *MEMORY[0x24BDFDC28];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v58 = v55;
                        v59 = v28;
                        v60 = 2080;
                        v61 = "-[GKSessionInternal handleEvents]";
                        v62 = 1024;
                        v63 = 3594;
                        v64 = 1024;
                        v65 = v27;
                        _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d process dnsservice conn failed: %d", v58, 0x22u);
                      }
                    }
                  }
                }
              }
            }
            if (v23 != -1)
            {
              if (__darwin_check_fd_set_overflow(v23, &buf, 0))
              {
                if (((*(unsigned int *)((char *)buf.fds_bits + (((unint64_t)v23 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v23) & 1) != 0)
                {
                  v30 = DNSServiceProcessResult(self->_dnsServiceResolveConnection);
                  if (v30)
                  {
                    v31 = v30;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v32 = VRTraceErrorLogLevelToCSTR();
                      v33 = *MEMORY[0x24BDFDC28];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v58 = v55;
                        v59 = v32;
                        v60 = 2080;
                        v61 = "-[GKSessionInternal handleEvents]";
                        v62 = 1024;
                        v63 = 3600;
                        v64 = 1024;
                        v65 = v31;
                        v34 = v33;
                        v35 = " [%s] %s:%d process dnsservice resolve conn failed: %d";
                        v36 = 34;
                        goto LABEL_56;
                      }
                    }
                  }
                }
              }
            }
          }
          memset(&buf, 0, sizeof(buf));
          goto LABEL_58;
        }
      }
      v23 = v22;
      v22 = v16;
      if (v16 != -1)
        goto LABEL_36;
      v41 = VRTraceGetErrorLogLevelForModule();
      if (v56 == 3)
      {
        if (v41 >= 7)
        {
          v53 = VRTraceErrorLogLevelToCSTR();
          v54 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v58 = 136315650;
            v59 = v53;
            v60 = 2080;
            v61 = "-[GKSessionInternal handleEvents]";
            v62 = 1024;
            v63 = 3562;
            v50 = " [%s] %s:%d handleEvents: nothing to do - quitting";
            v51 = v54;
            v52 = 28;
            goto LABEL_71;
          }
        }
        goto LABEL_10;
      }
      if (v41 >= 7)
      {
        v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 136315650;
          v59 = v42;
          v60 = 2080;
          v61 = "-[GKSessionInternal handleEvents]";
          v62 = 1024;
          v63 = 3567;
          _os_log_impl(&dword_215C5C000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents: nothing to do - retry after 1 second", v58, 0x1Cu);
        }
      }
      ++v56;
      v57.tv_sec = 1;
      v57.tv_usec = 0;
      select(0, 0, 0, 0, &v57);
      memset(&buf, 0, sizeof(buf));
LABEL_58:
      -[GKSessionInternal lock](self, "lock");
    }
    while (!self->_stopHandlingEvents);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v58 = 136315650;
      v59 = v7;
      v60 = 2080;
      v61 = "-[GKSessionInternal handleEvents]";
      v62 = 1024;
      v63 = 3477;
      v9 = " [%s] %s:%d handleEvents stop...";
LABEL_8:
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, v9, v58, 0x1Cu);
    }
  }
LABEL_9:
  -[GKSessionInternal unlock](self, "unlock", v55);
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[GKSessionInternal retainCount](self, "retainCount");
      *(_DWORD *)v58 = 136315906;
      v59 = v10;
      v60 = 2080;
      v61 = "-[GKSessionInternal handleEvents]";
      v62 = 1024;
      v63 = 3658;
      v64 = 1024;
      v65 = v12;
      _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d handleEvents ended (%d)", v58, 0x22u);
    }
  }
  *(_WORD *)&self->_handleEventsRunning = 0;
  objc_msgSend(v3, "drain");
}

- (BOOL)checkDNSConnection
{
  _DNSServiceRef_t **p_dnsServiceConnection;
  DNSServiceErrorType Connection;
  DNSServiceErrorType v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  DNSServiceErrorType v10;
  DNSServiceErrorType v11;
  uint64_t v12;
  int sReset;
  int v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[GKSessionInternal lock](self, "lock");
  if (self->_shutdown)
    goto LABEL_2;
  p_dnsServiceConnection = &self->_dnsServiceConnection;
  if (!self->_dnsServiceConnection)
  {
    Connection = DNSServiceCreateConnection(&self->_dnsServiceConnection);
    if (Connection)
    {
      v6 = Connection;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_2;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_2;
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v7;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[GKSessionInternal checkDNSConnection]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 3678;
      WORD2(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 6) = v6;
      v9 = " [%s] %s:%d DNSServiceCreateConnection failed: %d";
      goto LABEL_15;
    }
    sReset = self->_sReset;
    if (sReset != -1)
    {
      close(sReset);
      self->_sReset = -1;
    }
  }
  if (!self->_dnsServiceResolveConnection)
  {
    v10 = DNSServiceCreateConnection(&self->_dnsServiceResolveConnection);
    if (!v10)
    {
      v14 = self->_sReset;
      if (v14 != -1)
      {
        close(v14);
        self->_sReset = -1;
      }
      goto LABEL_5;
    }
    v11 = v10;
    DNSServiceRefDeallocate(*p_dnsServiceConnection);
    *p_dnsServiceConnection = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7
      || (v12 = VRTraceErrorLogLevelToCSTR(),
          v8 = *MEMORY[0x24BDFDC28],
          !os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT)))
    {
LABEL_2:
      -[GKSessionInternal unlock](self, "unlock", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
      return 1;
    }
    *(_DWORD *)v15 = 136315906;
    *(_QWORD *)&v15[4] = v12;
    *(_WORD *)&v15[12] = 2080;
    *(_QWORD *)&v15[14] = "-[GKSessionInternal checkDNSConnection]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 3692;
    WORD2(v16) = 1024;
    *(_DWORD *)((char *)&v16 + 6) = v11;
    v9 = " [%s] %s:%d DNSServiceCreateConnection failed2: %d";
LABEL_15:
    _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, v9, v15, 0x22u);
    goto LABEL_2;
  }
LABEL_5:
  -[GKSessionInternal unlock](self, "unlock");
  return 0;
}

- (void)publish
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v4 = 3780;
  v5 = v0;
  v6 = v1;
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v2, (uint64_t)v2, " [%s] %s:%d publish failed: %d", v3);
  OUTLINED_FUNCTION_12();
}

- (BOOL)filterService:(const char *)a3 withPID:(unsigned int)a4
{
  return !self->_wifiEnabled
      && (objc_msgSend((id)g_GKSessionGlobals, "hasActivePID:", *(_QWORD *)&a4) & 1) == 0
      && !strcmp(a3, "en0");
}

- (void)cleanupExAvailablePeers
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[GKList count](self->_peersForCleanup, "count");
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v11 = v4;
        v12 = 2080;
        v13 = "-[GKSessionInternal cleanupExAvailablePeers]";
        v14 = 1024;
        v15 = 3817;
        v16 = 1024;
        v17 = v3;
        _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cleanup previous available peers: (%d)", buf, 0x22u);
      }
    }
    v6 = -[GKList allMatchingObjectsFromTable:](self->_peersForCleanup, "allMatchingObjectsFromTable:", self->_peerInfoTable);
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
      do
      {
        v8 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
        if (v8)
        {
          v9 = v8;
          if (!-[GKList hasID:](self->_peersConnected, "hasID:", objc_msgSend(v8, "pid"))
            && !-[GKList hasID:](self->_peersAvailable, "hasID:", objc_msgSend(v9, "pid")))
          {
            -[GKTable removeObjectForKey:](self->_peerInfoTable, "removeObjectForKey:", objc_msgSend(v9, "pid"));
            -[GKSessionInternal delegate](self, "delegate");
            if ((objc_opt_respondsToSelector() & 1) != 0
              || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
            {
              -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeUnavailable_, objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(v9, "pid")), CFSTR("peerID"), 0), 0);
            }
          }
        }
        ++v7;
      }
      while (v7 < objc_msgSend(v6, "count"));
    }
    -[GKList removeAllIDs](self->_peersForCleanup, "removeAllIDs");
  }
}

- (void)processTXTRecordForPeer:(id)a3 txtLen:(unsigned __int16)a4 txtRecord:(const void *)a5
{
  int v6;
  unsigned __int8 *ValuePtr;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t valueLen[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  if (a4 && a5)
  {
    if (TXTRecordContainsKey(a4, a5, "state"))
    {
      valueLen[0] = -86;
      ValuePtr = (unsigned __int8 *)TXTRecordGetValuePtr(v6, a5, "state", valueLen);
      v10 = 0;
      if (ValuePtr && valueLen[0] == 1)
        v10 = *ValuePtr == 66;
    }
    else
    {
      v10 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(a3, "pid");
        v16 = objc_msgSend(a3, "isBusy");
        *(_DWORD *)valueLen = 136316418;
        v20 = v13;
        v21 = 2080;
        v22 = "-[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:]";
        v23 = 1024;
        v24 = 3860;
        v25 = 1024;
        v26 = v15;
        v27 = 1024;
        v28 = v16;
        v29 = 1024;
        v30 = v10;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** peer %d: oldbusy=%d, newbusy=%d", valueLen, 0x2Eu);
      }
    }
    if (v10 != objc_msgSend(a3, "isBusy"))
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(a3, "pid")), CFSTR("peerID"), 0);
      objc_msgSend(a3, "setBusy:", v10);
      if (v10)
        v18 = sel_tellDelegate_peerDidBecomeBusy_;
      else
        v18 = sel_tellDelegate_peerDidBecomeAvailable_;
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", v18, v17, 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)valueLen = 136316162;
      v20 = v11;
      v21 = 2080;
      v22 = "-[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:]";
      v23 = 1024;
      v24 = 3846;
      v25 = 1024;
      v26 = (int)a5;
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** no TXT record to process: txtRecord=%08X, txtLen=%u", valueLen, 0x28u);
    }
  }
}

- (void)didUpdateTXTRecordForPeer:(id)a3 fromIF:(const char *)a4 txtLen:(unsigned __int16)a5 txtRecord:(const void *)a6 withError:(int)a7 moreComing:(BOOL)a8
{
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v16;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315906;
        v23 = v9;
        v24 = 2080;
        v25 = "-[GKSessionInternal didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:]";
        v26 = 1024;
        v27 = 3874;
        v28 = 1024;
        LODWORD(v29) = a7;
        v11 = " [%s] %s:%d Bonjour query error: %d";
        v12 = v10;
        v13 = 34;
LABEL_9:
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, v13);
      }
    }
  }
  else
  {
    v16 = a5;
    if (-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", a4, objc_msgSend(a3, "pid")))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136315906;
          v23 = v20;
          v24 = 2080;
          v25 = "-[GKSessionInternal didUpdateTXTRecordForPeer:fromIF:txtLen:txtRecord:withError:moreComing:]";
          v26 = 1024;
          v27 = 3877;
          v28 = 2080;
          v29 = a4;
          v11 = " [%s] %s:%d resolved to [%s] - skipping";
          v12 = v21;
          v13 = 38;
          goto LABEL_9;
        }
      }
    }
    else
    {
      -[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:](self, "processTXTRecordForPeer:txtLen:txtRecord:", a3, v16, a6);
      if (!a8)
        -[GKSessionInternal cleanupExAvailablePeers](self, "cleanupExAvailablePeers");
    }
  }
}

- (void)didFindService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6
{
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  GKPeerInternal *v24;
  GKPeerInternal *v25;
  GKPeerInternal *v26;
  DNSServiceErrorType v27;
  DNSServiceErrorType v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  DNSServiceErrorType v34;
  DNSServiceErrorType v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  id v40;
  DNSServiceRef sdRef;
  id v42;
  unsigned int v43;
  id v44;
  uint8_t v45[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[10];
  unsigned int v53;
  __int16 v54;
  DNSServiceErrorType v55;
  _QWORD buf[128];

  buf[127] = *MEMORY[0x24BDAC8D0];
  v44 = (id)0xAAAAAAAAAAAAAAAALL;
  v43 = -1431655766;
  v42 = (id)0xAAAAAAAAAAAAAAAALL;
  if (-[GKSessionInternal parseServiceName:intoDisplayName:pid:state:](self, "parseServiceName:intoDisplayName:pid:state:", a3, &v44, &v43, &v42))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v43;
        v14 = -[GKList hasID:](self->_peersForCleanup, "hasID:", v43);
        LODWORD(buf[0]) = 136316162;
        *(_QWORD *)((char *)buf + 4) = v11;
        WORD2(buf[1]) = 2080;
        *(_QWORD *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
        HIWORD(buf[2]) = 1024;
        LODWORD(buf[3]) = 3918;
        WORD2(buf[3]) = 1024;
        *(_DWORD *)((char *)&buf[3] + 6) = v13;
        WORD1(buf[4]) = 1024;
        HIDWORD(buf[4]) = v14;
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peersForCleanup: contains %d ?= %d", (uint8_t *)buf, 0x28u);
      }
    }
    -[GKList removeID:](self->_peersForCleanup, "removeID:", v43);
    if (-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", a4, v43))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      LODWORD(buf[0]) = 136316418;
      *(_QWORD *)((char *)buf + 4) = v15;
      WORD2(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      HIWORD(buf[2]) = 1024;
      LODWORD(buf[3]) = 3922;
      WORD2(buf[3]) = 2080;
      *(_QWORD *)((char *)&buf[3] + 6) = a3;
      HIWORD(buf[4]) = 2080;
      buf[5] = a4;
      LOWORD(buf[6]) = 1024;
      *(_DWORD *)((char *)&buf[6] + 2) = a5;
      v17 = " [%s] %s:%d browse rejected: [%s] from [%s] (%d)";
      v18 = v16;
      v19 = 54;
LABEL_14:
      _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)buf, v19);
LABEL_15:

      return;
    }
    if (self->_mode == 2 && v43 == self->_pid)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      LODWORD(buf[0]) = 136315650;
      *(_QWORD *)((char *)buf + 4) = v20;
      WORD2(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 6) = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      HIWORD(buf[2]) = 1024;
      LODWORD(buf[3]) = 3928;
      v17 = " [%s] %s:%d didFind: skipping self";
      v18 = v21;
      v19 = 28;
      goto LABEL_14;
    }
    v22 = (void *)objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("busy"));
    if (v22)
      v23 = objc_msgSend(v22, "BOOLValue");
    else
      v23 = 0;

    v24 = (GKPeerInternal *)-[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v43);
    if (v24)
    {
      v25 = v24;
      -[GKPeerInternal setServiceCount:](v24, "setServiceCount:", -[GKPeerInternal serviceCount](v24, "serviceCount") + 1);
LABEL_37:

      goto LABEL_38;
    }
    v26 = [GKPeerInternal alloc];
    v25 = -[GKPeerInternal initWithPID:displayName:serviceName:](v26, "initWithPID:displayName:serviceName:", v43, v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3));
    -[GKPeerInternal setSession:](v25, "setSession:", self);
    -[GKPeerInternal setBusy:](v25, "setBusy:", v23);
    sdRef = self->_dnsServiceConnection;
    memset((char *)buf + 1, 170, 0x3F0uLL);
    LOBYTE(buf[0]) = 0;
    v27 = DNSServiceConstructFullName((char *const)buf, a3, -[NSString UTF8String](self->serviceType, "UTF8String"), "local.");
    if (v27)
    {
      v28 = v27;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_30;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_DWORD *)v45 = 136316162;
      v46 = v29;
      v47 = 2080;
      v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      v49 = 1024;
      v50 = 3984;
      v51 = 1024;
      *(_DWORD *)v52 = v43;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v28;
      v31 = " [%s] %s:%d ** cannot construct fullname! no busy state updates for peer %u (error=%d)";
      v32 = v30;
      v33 = 40;
    }
    else
    {
      v34 = DNSServiceQueryRecord(&sdRef, 0x24000u, 0, (const char *)buf, 0x10u, 1u, (DNSServiceQueryRecordReply)gkQueryRecordCallback, v25);
      if (!v34)
        goto LABEL_31;
      v35 = v34;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v36 = VRTraceErrorLogLevelToCSTR(),
            v37 = *MEMORY[0x24BDFDC28],
            !os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_30:
        sdRef = 0;
LABEL_31:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v45 = 136315906;
            v46 = v38;
            v47 = 2080;
            v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
            v49 = 1024;
            v50 = 3997;
            v51 = 2080;
            *(_QWORD *)v52 = buf;
            _os_log_impl(&dword_215C5C000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => called DNSServiceQueryRecord() (fullname=[%s])", v45, 0x26u);
          }
        }
        -[GKPeerInternal setTxtRecordService:](v25, "setTxtRecordService:", sdRef);
        -[GKSessionInternal lock](self, "lock");
        -[GKTable setObject:forKey:](self->_peerInfoTable, "setObject:forKey:", v25, v43);
        -[GKList addID:](self->_peersAvailable, "addID:", v43);
        -[GKSessionInternal unlock](self, "unlock");
        -[GKSessionInternal delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0
          || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
        {
          v40 = objc_alloc(MEMORY[0x24BDBCE70]);
          -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeAvailable_, objc_msgSend(v40, "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", v43), CFSTR("peerID"), 0), 0);
        }
        goto LABEL_37;
      }
      *(_DWORD *)v45 = 136316418;
      v46 = v36;
      v47 = 2080;
      v48 = "-[GKSessionInternal didFindService:fromIF:withError:moreComing:]";
      v49 = 1024;
      v50 = 3994;
      v51 = 2080;
      *(_QWORD *)v52 = buf;
      *(_WORD *)&v52[8] = 1024;
      v53 = v43;
      v54 = 1024;
      v55 = v35;
      v31 = " [%s] %s:%d ** cannot query TXT record [%s]! no busy state updates for peer %u (error=%d)";
      v32 = v37;
      v33 = 50;
    }
    _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, v31, v45, v33);
    goto LABEL_30;
  }
LABEL_38:
  if (!a6)
    -[GKSessionInternal cleanupExAvailablePeers](self, "cleanupExAvailablePeers");
}

- (void)didRemoveService:(const char *)a3 fromIF:(const char *)a4 withError:(int)a5 moreComing:(BOOL)a6
{
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  _BOOL4 v25;
  id v26;
  id v27;
  id v28;
  unsigned int v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v30 = (id)0xAAAAAAAAAAAAAAAALL;
  v29 = -1431655766;
  v28 = (id)0xAAAAAAAAAAAAAAAALL;
  if (!-[GKSessionInternal parseServiceName:intoDisplayName:pid:state:](self, "parseServiceName:intoDisplayName:pid:state:", a3, &v30, &v29, &v28))
  {
LABEL_27:
    if (!a6)
      -[GKSessionInternal cleanupExAvailablePeers](self, "cleanupExAvailablePeers");
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v29;
      v14 = -[GKList hasID:](self->_peersForCleanup, "hasID:", v29);
      *(_DWORD *)buf = 136316162;
      v32 = v11;
      v33 = 2080;
      v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
      v35 = 1024;
      v36 = 4025;
      v37 = 1024;
      *(_DWORD *)v38 = v13;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v14;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _peersForCleanup: contains %d ?= %d", buf, 0x28u);
    }
  }
  -[GKList removeID:](self->_peersForCleanup, "removeID:", v29);
  if (-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", a4, v29))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136316418;
    v32 = v15;
    v33 = 2080;
    v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
    v35 = 1024;
    v36 = 4029;
    v37 = 2080;
    *(_QWORD *)v38 = a3;
    *(_WORD *)&v38[8] = 2080;
    v39 = a4;
    v40 = 1024;
    v41 = a5;
    v17 = " [%s] %s:%d browse rejected: [%s] from [%s] (%d)";
    v18 = v16;
    v19 = 54;
LABEL_14:
    _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_15:

    return;
  }
  if (self->_mode == 2 && v29 == self->_pid)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315650;
    v32 = v20;
    v33 = 2080;
    v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
    v35 = 1024;
    v36 = 4035;
    v17 = " [%s] %s:%d didRemove: skipping self";
    v18 = v21;
    v19 = 28;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v24 = v29;
      v25 = -[GKList hasID:](self->_peersConnected, "hasID:", v29);
      *(_DWORD *)buf = 136316162;
      v32 = v22;
      v33 = 2080;
      v34 = "-[GKSessionInternal didRemoveService:fromIF:withError:moreComing:]";
      v35 = 1024;
      v36 = 4041;
      v37 = 1024;
      *(_DWORD *)v38 = v24;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v25;
      _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Peer [%d] removed? (%d).\n", buf, 0x28u);
    }
  }

  v26 = -[GKTable objectForKey:](self->_peerInfoTable, "objectForKey:", v29);
  objc_msgSend(v26, "setServiceCount:", objc_msgSend(v26, "serviceCount") - 1);
  if ((int)objc_msgSend(v26, "serviceCount") <= 0)
  {
    -[GKList removeID:](self->_peersAvailable, "removeID:", v29);
    if (v26
      && !-[GKList hasID:](self->_peersConnected, "hasID:", v29)
      && !-[GKList hasID:](self->_peersPendingOutgoingInvitation, "hasID:", v29))
    {
      -[GKTable removeObjectForKey:](self->_peerInfoTable, "removeObjectForKey:", v29);
    }
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0
      || (-[GKSessionInternal privateDelegate](self, "privateDelegate"), (objc_opt_respondsToSelector() & 1) != 0))
    {
      v27 = objc_alloc(MEMORY[0x24BDBCE70]);
      -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_peerDidBecomeUnavailable_, objc_msgSend(v27, "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", v29), CFSTR("peerID"), 0), 0);
    }
    goto LABEL_27;
  }
}

- (void)browse
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _DNSServiceRef_t *serviceBrowser;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  DNSServiceErrorType v13;
  DNSServiceErrorType v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _DNSServiceRef_t *service;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[GKSessionInternal lock](self, "lock");
  if (self->_shutdown)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v31 = v3;
        v32 = 2080;
        v33 = "-[GKSessionInternal browse]";
        v34 = 1024;
        v35 = 4124;
        v5 = " [%s] %s:%d cannot browse after reset";
LABEL_9:
        _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if (-[GKSessionInternal checkDNSConnection](self, "checkDNSConnection"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v31 = v6;
        v32 = 2080;
        v33 = "-[GKSessionInternal browse]";
        v34 = 1024;
        v35 = 4131;
        v5 = " [%s] %s:%d dns connection not initialized";
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (self->_serviceBrowser)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          serviceBrowser = self->_serviceBrowser;
          *(_DWORD *)buf = 136315906;
          v31 = v7;
          v32 = 2080;
          v33 = "-[GKSessionInternal browse]";
          v34 = 1024;
          v35 = 4137;
          v36 = 1024;
          LODWORD(v37) = (_DWORD)serviceBrowser;
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_serviceBrowser) (%08X) -- was already browsing?  closing old service...", buf, 0x22u);
        }
      }
      DNSServiceRefDeallocate(self->_serviceBrowser);
      -[GKList addIDsFromList:](self->_peersForCleanup, "addIDsFromList:", self->_peersAvailable);
      -[GKList removeAllIDs](self->_peersAvailable, "removeAllIDs");
    }
    self->_serviceBrowser = self->_dnsServiceConnection;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[NSString UTF8String](self->serviceType, "UTF8String");
        *(_DWORD *)buf = 136315906;
        v31 = v10;
        v32 = 2080;
        v33 = "-[GKSessionInternal browse]";
        v34 = 1024;
        v35 = 4146;
        v36 = 2080;
        v37 = (uint64_t)v12;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceBrowse() (servicetype=%s)", buf, 0x26u);
      }
    }
    v13 = DNSServiceBrowse(&self->_serviceBrowser, 0x24800u, 0, -[NSString UTF8String](self->serviceType, "UTF8String"), "local.", (DNSServiceBrowseReply)gkBrowseCallback, self);
    if (v13)
    {
      v14 = v13;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v31 = v15;
          v32 = 2080;
          v33 = "-[GKSessionInternal browse]";
          v34 = 1024;
          v35 = 4153;
          v36 = 1024;
          LODWORD(v37) = v14;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d browse failed: %d", buf, 0x22u);
        }
      }
      self->_serviceBrowser = 0;
      if (self->_mode == 2 && self->_service)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            service = self->_service;
            *(_DWORD *)buf = 136315906;
            v31 = v17;
            v32 = 2080;
            v33 = "-[GKSessionInternal browse]";
            v34 = 1024;
            v35 = 4157;
            v36 = 1024;
            LODWORD(v37) = (_DWORD)service;
            _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d => calling DNSServiceRefDeallocate(_service) (%08X)", buf, 0x22u);
          }
        }
        DNSServiceRefDeallocate(self->_service);
        self->_service = 0;
      }
      if (self->_sessionStarted)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.gamekit.GKSessionErrorDomain"), v14, 0);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v20, CFSTR("NSError"), 0);
        -[GKSessionInternal delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_sessionDidFailWithError_, v21, 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v20, "localizedDescription");
            *(_DWORD *)buf = 136315906;
            v31 = v22;
            v32 = 2080;
            v33 = "-[GKSessionInternal browse]";
            v34 = 1024;
            v35 = 4167;
            v36 = 2112;
            v37 = v24;
            _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error: %@.", buf, 0x26u);
          }
        }

        self->_sessionStarted = 0;
        self->_stopHandlingEvents = 1;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v31 = v25;
            v32 = 2080;
            v33 = "-[GKSessionInternal browse]";
            v34 = 1024;
            v35 = 4175;
            _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving ALL: browse error", buf, 0x1Cu);
          }
        }
        -[GKSessionInternal stopResolvingAllPeers](self, "stopResolvingAllPeers");
      }
    }
    else if (!self->_handleEventsRunning)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v29 = -[GKSessionInternal retainCount](self, "retainCount");
          *(_DWORD *)buf = 136315906;
          v31 = v27;
          v32 = 2080;
          v33 = "-[GKSessionInternal browse]";
          v34 = 1024;
          v35 = 4183;
          v36 = 1024;
          LODWORD(v37) = v29;
          _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start handleEvents (%d)", buf, 0x22u);
        }
      }
      objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_handleEvents, self, 0);
      *(_WORD *)&self->_handleEventsRunning = 1;
    }
  }
  -[GKSessionInternal unlock](self, "unlock");
}

- (BOOL)tryConnectToPeer:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  BOOL result;
  uint64_t v13;
  NSObject *v14;
  OpaqueGCKSession *sessionRef;
  int v16;
  void *v17;
  double v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  OpaqueGCKSession *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  GKSessionInternal *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[3];
  int v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _WORD v46[9];

  *(_QWORD *)&v46[5] = *MEMORY[0x24BDAC8D0];
  v38 = -1431655766;
  memset(v37, 170, sizeof(v37));
  if (!objc_msgSend(a3, "usableAddrs"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x24BDFDC28];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v11)
        return result;
      *(_DWORD *)buf = 136315650;
      v40 = v9;
      v41 = 2080;
      v42 = "-[GKSessionInternal tryConnectToPeer:]";
      v43 = 1024;
      v44 = 4201;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no usable addresses - wait for more", buf, 0x1Cu);
    }
    return 0;
  }
  objc_msgSend(a3, "removeAndReturnLookupList:andAddrList:andInterfaceList:count:", &v37[2], &v37[1], v37, &v38);
  if (!v38)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = v13;
        v41 = 2080;
        v42 = "-[GKSessionInternal tryConnectToPeer:]";
        v43 = 1024;
        v44 = 4209;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d no usable addresses - wait for more", buf, 0x1Cu);
      }
    }
    +[GKPeerInternal freeLookupList:andAddrList:andInterfaceList:count:](GKPeerInternal, "freeLookupList:andAddrList:andInterfaceList:count:", v37[2], v37[1], v37[0], v38);
    return 0;
  }
  v5 = malloc_type_malloc(8 * v38, 0x2004093837F09uLL);
  if (v38 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      DNSServiceRefDeallocate(*(DNSServiceRef *)(v37[2] + 8 * v6));
      v8 = v37[1];
      if (*(_QWORD *)(v37[1] + 8 * v6))
      {
        *(_DWORD *)(v37[0] + 4 * v7) = *(_DWORD *)(v37[0] + 4 * v6);
        v5[v7++] = objc_msgSend(*(id *)(v8 + 8 * v6), "bytes");
      }
      ++v6;
    }
    while (v6 < v38);
  }
  sessionRef = self->sessionRef;
  v16 = objc_msgSend(a3, "pid");
  v17 = (void *)v37[0];
  objc_msgSend(a3, "connectTimeout");
  v19 = GCKSessionConnectToLocalService((uint64_t)sessionRef, v16, (uint64_t)v5, v7, v17, v18);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->sessionRef;
      *(_DWORD *)buf = 136316162;
      v40 = v20;
      v41 = 2080;
      v42 = "-[GKSessionInternal tryConnectToPeer:]";
      v43 = 1024;
      v44 = 4226;
      v45 = 1024;
      *(_DWORD *)v46 = (_DWORD)v22;
      v46[2] = 1024;
      *(_DWORD *)&v46[3] = v19;
      _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GCKSessionConnectToLocalService(%d) returned %X", buf, 0x28u);
    }
  }
  free(v5);
  if ((unsigned __int16)v19 == 41)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v25 = objc_msgSend(a3, "displayName");
        *(_DWORD *)buf = 136315906;
        v40 = v23;
        v41 = 2080;
        v42 = "-[GKSessionInternal tryConnectToPeer:]";
        v43 = 1024;
        v44 = 4230;
        v45 = 2112;
        *(_QWORD *)v46 = v25;
        _os_log_impl(&dword_215C5C000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ connection is in progress", buf, 0x26u);
      }
    }
    -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", objc_msgSend(a3, "pid"));
    objc_msgSend(a3, "stopResolving");
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[GKSessionInternal privateDelegate](self, "privateDelegate");
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_43;
    }
    v26 = CFSTR("Connection to peer already in progress.");
    v27 = CFSTR("Already in progress.");
    v28 = self;
    v29 = 30510;
  }
  else if ((v19 & 0x40000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_msgSend(a3, "displayName");
        *(_DWORD *)buf = 136315906;
        v40 = v33;
        v41 = 2080;
        v42 = "-[GKSessionInternal tryConnectToPeer:]";
        v43 = 1024;
        v44 = 4242;
        v45 = 2112;
        *(_QWORD *)v46 = v35;
        _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ system error", buf, 0x26u);
      }
    }
    -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", objc_msgSend(a3, "pid"));
    objc_msgSend(a3, "stopResolving");
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[GKSessionInternal privateDelegate](self, "privateDelegate");
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_43;
    }
    v26 = CFSTR("ConnectToLocalService failed due to system error!");
    v27 = CFSTR("System error.");
    v28 = self;
    v29 = 30205;
  }
  else
  {
    if ((v19 & 0x80000000) == 0)
      goto LABEL_43;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend(a3, "displayName");
        *(_DWORD *)buf = 136315906;
        v40 = v30;
        v41 = 2080;
        v42 = "-[GKSessionInternal tryConnectToPeer:]";
        v43 = 1024;
        v44 = 4254;
        v45 = 2112;
        *(_QWORD *)v46 = v32;
        _os_log_impl(&dword_215C5C000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** Stop resolving: %@ connect error", buf, 0x26u);
      }
    }
    -[GKList removeID:](self->_peersPendingOutgoingInvitation, "removeID:", objc_msgSend(a3, "pid"));
    objc_msgSend(a3, "stopResolving");
    -[GKSessionInternal delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      -[GKSessionInternal privateDelegate](self, "privateDelegate");
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_43;
    }
    v26 = CFSTR("ConnectToLocalService failed.");
    v27 = CFSTR("Connect failed.");
    v28 = self;
    v29 = 30505;
  }
  v36 = -[GKSessionInternal newNSErrorFromGKSessionError:description:reason:](v28, "newNSErrorFromGKSessionError:description:reason:", v29, v26, v27);
  -[GKSessionInternal performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_tellDelegate_connectionRequestToPeerFailed_, objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", objc_msgSend(a3, "pid")), CFSTR("peerID"), v36, CFSTR("NSError"), 0), 0);

LABEL_43:
  +[GKPeerInternal freeLookupList:andAddrList:andInterfaceList:count:](GKPeerInternal, "freeLookupList:andAddrList:andInterfaceList:count:", v37[2], v37[1], v37[0], v38);
  return v19 == 0;
}

- (void)didLookupHostname:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 address:(const sockaddr_in *)a6 interface:(unsigned int)a7 withError:(int)a8 moreComing:(BOOL)a9
{
  uint64_t v10;
  in_addr_t s_addr;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v10 = *(_QWORD *)&a7;
  v44 = *MEMORY[0x24BDAC8D0];
  s_addr = a6->sin_addr.s_addr;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v18 = bswap32(s_addr);
      *(_DWORD *)buf = 136317698;
      v25 = v16;
      v26 = 2080;
      v27 = "-[GKSessionInternal didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:]";
      v28 = 1024;
      v29 = 4275;
      v30 = 1024;
      *(_DWORD *)v31 = (_DWORD)a3;
      *(_WORD *)&v31[4] = 2080;
      *(_QWORD *)&v31[6] = a5;
      v32 = 1024;
      v33 = HIBYTE(v18);
      v34 = 1024;
      v35 = BYTE2(v18);
      v36 = 1024;
      v37 = BYTE1(v18);
      v38 = 1024;
      v39 = v18;
      v40 = 1024;
      v41 = a8;
      v42 = 1024;
      v43 = a9;
      _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ** %08x ** host[%s] lookup: %u.%u.%u.%u (%d) (more? %d)", buf, 0x50u);
    }
  }
  if (!a8)
  {
    v19 = a4;
    if (objc_msgSend(a4, "containsLookupService:", a3))
    {
      objc_msgSend(a4, "setAddr:interface:forLookupService:", a6, v10, a3);
      if (!a9)
      {
        if (-[GKSessionInternal tryConnectToPeer:](self, "tryConnectToPeer:", a4))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v20 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (v19)
                v22 = objc_msgSend(v19, "displayName");
              else
                v22 = 0;
              *(_DWORD *)buf = 136315906;
              v25 = v20;
              v26 = 2080;
              v27 = "-[GKSessionInternal didLookupHostname:forPeer:hostName:address:interface:withError:moreComing:]";
              v28 = 1024;
              v29 = 4300;
              v30 = 2112;
              *(_QWORD *)v31 = v22;
              _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop resolving: %@ invitation started from getaddrinfo callback", buf, 0x26u);
            }
          }
          objc_msgSend(v19, "stopResolving");
        }
      }
    }
  }
}

- (void)didResolveService:(_DNSServiceRef_t *)a3 forPeer:(id)a4 hostName:(const char *)a5 port:(unsigned __int16)a6 interface:(unsigned int)a7 txtLen:(unsigned __int16)a8 txtRecord:(const void *)a9 withError:(int)a10 moreComing:(BOOL)a11
{
  uint64_t v11;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  DNSServiceErrorType AddrInfo;
  DNSServiceErrorType v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  int v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  unsigned int v47;
  DNSServiceRef sdRef;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[10];
  __int16 v57;
  char *v58;
  __int16 v59;
  _BOOL4 v60;
  char v61[16];
  uint64_t v62;

  v11 = a8;
  v47 = a6;
  v62 = *MEMORY[0x24BDAC8D0];
  memset(v61, 170, sizeof(v61));
  if (!if_indextoname(a7, v61))
    v61[0] = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v50 = v16;
      v51 = 2080;
      v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      v53 = 1024;
      v54 = 4340;
      v55 = 1024;
      *(_DWORD *)v56 = (_DWORD)a3;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = a7;
      v57 = 2080;
      v58 = v61;
      v59 = 1024;
      v60 = a11;
      _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didResolveService: %x from %d [%s] (more? %d)", buf, 0x38u);
    }
  }
  if (a10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    {
LABEL_15:
      v20 = 0;
      goto LABEL_17;
    }
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x24BDFDC28];
    v20 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v50 = v18;
      v51 = 2080;
      v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      v53 = 1024;
      v54 = 4344;
      v55 = 1024;
      *(_DWORD *)v56 = a10;
      v21 = " [%s] %s:%d Bonjour resolve error: %d";
      v22 = v19;
      v23 = 34;
LABEL_14:
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      goto LABEL_15;
    }
  }
  else
  {
    if (!-[GKSessionInternal filterService:withPID:](self, "filterService:withPID:", v61, objc_msgSend(a4, "pid")))
    {
      v20 = 1;
      goto LABEL_17;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x24BDFDC28];
    v20 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v50 = v24;
      v51 = 2080;
      v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      v53 = 1024;
      v54 = 4347;
      v55 = 2080;
      *(_QWORD *)v56 = v61;
      v21 = " [%s] %s:%d resolved to [%s] - skipping";
      v22 = v25;
      v23 = 38;
      goto LABEL_14;
    }
  }
LABEL_17:
  -[GKSessionInternal processTXTRecordForPeer:txtLen:txtRecord:](self, "processTXTRecordForPeer:txtLen:txtRecord:", a4, v11, a9);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(a4, "pid");
      v29 = objc_msgSend(a4, "resolveService");
      *(_DWORD *)buf = 136316418;
      v50 = v26;
      v51 = 2080;
      v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
      v53 = 1024;
      v54 = 4355;
      v55 = 1024;
      *(_DWORD *)v56 = v28;
      *(_WORD *)&v56[4] = 1024;
      *(_DWORD *)&v56[6] = v29;
      v57 = 1024;
      LODWORD(v58) = (_DWORD)a3;
      _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d resolve check peer %d service %08x == %08x?", buf, 0x2Eu);
    }
  }
  if ((_DNSServiceRef_t *)objc_msgSend(a4, "resolveService") == a3)
  {
    objc_msgSend(a4, "setServicePort:", v47);
    if (v20)
    {
      if (-[GKSessionInternal checkDNSConnection](self, "checkDNSConnection"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v50 = v30;
            v51 = 2080;
            v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
            v53 = 1024;
            v54 = 4380;
            v32 = " [%s] %s:%d Lookup: Unable to use DNS connection!";
            v33 = v31;
            v34 = 28;
LABEL_33:
            _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          }
        }
      }
      else
      {
        sdRef = self->_dnsServiceResolveConnection;
        AddrInfo = DNSServiceGetAddrInfo(&sdRef, 0x24000u, a7, 1u, a5, (DNSServiceGetAddrInfoReply)hostnameLookupCallback, a4);
        if (AddrInfo)
        {
          v36 = AddrInfo;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v37 = VRTraceErrorLogLevelToCSTR();
            v38 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v50 = v37;
              v51 = 2080;
              v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
              v53 = 1024;
              v54 = 4377;
              v55 = 1024;
              *(_DWORD *)v56 = v36;
              v32 = " [%s] %s:%d hostname lookup failed (%d)";
              v33 = v38;
              v34 = 34;
              goto LABEL_33;
            }
          }
        }
        else
        {
          objc_msgSend(a4, "addLookup:", sdRef);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v41 = (int)sdRef;
              v42 = objc_msgSend(a4, "resolveService");
              *(_DWORD *)buf = 136316162;
              v50 = v39;
              v51 = 2080;
              v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
              v53 = 1024;
              v54 = 4375;
              v55 = 1024;
              *(_DWORD *)v56 = v41;
              *(_WORD *)&v56[4] = 1024;
              *(_DWORD *)&v56[6] = v42;
              v32 = " [%s] %s:%d hostname lookup service %08X shares from %08X";
              v33 = v40;
              v34 = 40;
              goto LABEL_33;
            }
          }
        }
      }
    }
    if (!a11 && -[GKSessionInternal tryConnectToPeer:](self, "tryConnectToPeer:", a4))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v43 = VRTraceErrorLogLevelToCSTR();
        v44 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (a4)
            v45 = objc_msgSend(a4, "displayName");
          else
            v45 = 0;
          *(_DWORD *)buf = 136315906;
          v50 = v43;
          v51 = 2080;
          v52 = "-[GKSessionInternal didResolveService:forPeer:hostName:port:interface:txtLen:txtRecord:withError:moreComing:]";
          v53 = 1024;
          v54 = 4386;
          v55 = 2112;
          *(_QWORD *)v56 = v45;
          _os_log_impl(&dword_215C5C000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop resolving: %@ invitation started from resolve callback", buf, 0x26u);
        }
      }
      objc_msgSend(a4, "stopResolving");
    }
  }
}

- (id)stringForGCKID:(unsigned int)a3
{
  return -[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", *(_QWORD *)&a3);
}

- (id)voiceChatSessionListener
{
  return self->_voiceChatListener;
}

- (NSString)peerID
{
  return (NSString *)-[GKAutoPeerIDTable objectForKey:](self->_peerIDTable, "objectForKey:", self->_pid);
}

- (NSArray)connectedPeerIDs
{
  return (NSArray *)-[GKSessionInternal peersWithConnectionState:](self, "peersWithConnectionState:", 2);
}

- (BOOL)sendVoiceChatData:(id)a3 toPeers:(id)a4 error:(id *)a5
{
  return -[GKSessionInternal sendData:toPeers:withDataMode:enableOOB:error:](self, "sendData:toPeers:withDataMode:enableOOB:error:", a3, a4, 0, 1, a5);
}

- (NSString)domain
{
  return self->domain;
}

- (void)setDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serviceType
{
  return self->serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)maxPeers
{
  return self->maxPeers;
}

- (void)setMaxPeers:(unint64_t)a3
{
  self->maxPeers = a3;
}

- (OpaqueGCKSession)sessionRef
{
  return self->sessionRef;
}

- (void)setSessionRef:(OpaqueGCKSession *)a3
{
  self->sessionRef = a3;
}

- (OpaqueAGPSession)agpSessionRef
{
  return self->agpSessionRef;
}

- (void)setAgpSessionRef:(OpaqueAGPSession *)a3
{
  self->agpSessionRef = a3;
}

- (unint64_t)port
{
  return self->_port;
}

- (void)setPort:(unint64_t)a3
{
  self->_port = a3;
}

- (NSString)sessionID
{
  return self->sessionID;
}

- (unsigned)sessionMode
{
  return self->_mode;
}

- (GKConnection)connection
{
  return (GKConnection *)objc_getProperty(self, a2, 80, 1);
}

- (void)initWithConnection:session:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Error in GCKSessionSetEventCallback. *", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithConnection:session:delegate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Error in AGPSessionCreate. *", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithConnection:session:delegate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Error in GCKSessionCreate. *", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithSessionID:displayName:session:sessionMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Error in AGPSessionCreate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)initWithSessionID:displayName:session:sessionMode:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Error in GCKSessionCreate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)displayNameForPeer:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  v3 = 2737;
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_14_0(&dword_215C5C000, v1, (uint64_t)v1, " [%s] %s:%d displayNameForPeer: %@ not found", v2);
  OUTLINED_FUNCTION_12();
}

- (void)cancelConnectToPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d cannot cancel after reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)acceptConnectionFromPeer:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d cannot accept after reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)denyConnectionFromPeer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d cannot deny after reset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
