@implementation GKDiscoveryPeer

- (BOOL)parseServiceNameForInit:(id)a3
{
  void *v4;
  int v5;
  id v7;
  id v8;

  if (a3)
  {
    -[GKDiscoveryPeer setServiceName:](self, "setServiceName:");
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", self->_serviceName);
    v8 = 0;
    v5 = objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("+"), &v8);
    if (v5)
    {
      objc_msgSend(v4, "scanString:intoString:", CFSTR("+"), 0);
      v7 = 0;
      objc_msgSend(v4, "scanUpToString:intoString:", CFSTR("+"), &v7);
      self->_deviceID = (NSString *)v8;
      self->_playerID = (NSString *)v7;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (GKDiscoveryPeer)initWithServiceName:(id)a3
{
  GKDiscoveryPeer *v4;
  GKDiscoveryPeer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKDiscoveryPeer;
  v4 = -[GKDiscoveryPeer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (-[GKDiscoveryPeer parseServiceNameForInit:](v4, "parseServiceNameForInit:", a3))
    {
      v5->_interfaces = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v5->_orderedInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v5->_attemptedInterfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v5->_shouldSignalDiscovery = 1;
      v5->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(a3, "UTF8String"), 0);
      v5->_sendDataBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v5->_state = 0;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4;
  NSObject *v5;
  const char *Name;
  NSString *serviceName;
  const char *v8;
  NSObject *syncQueue;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      Name = sel_getName(a2);
      serviceName = self->_serviceName;
      if (serviceName)
        v8 = -[NSString UTF8String](-[NSString description](serviceName, "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v12 = v4;
      v13 = 2080;
      v14 = "-[GKDiscoveryPeer dealloc]";
      v15 = 1024;
      v16 = 166;
      v17 = 2080;
      v18 = Name;
      v19 = 2080;
      v20 = v8;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: peer[%s] -dealloc", buf, 0x30u);
    }
  }

  syncQueue = self->_syncQueue;
  if (syncQueue)
    dispatch_release(syncQueue);

  self->_connection = 0;
  -[GKSimpleTimer invalidate](self->_resolveTimer, "invalidate");

  self->_resolveTimer = 0;
  v10.receiver = self;
  v10.super_class = (Class)GKDiscoveryPeer;
  -[GKDiscoveryPeer dealloc](&v10, sel_dealloc);
}

- (id)stringForState:(int)a3
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
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3 < 4)
    return off_24D4667A0[a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryPeer serviceName](self, "serviceName"))
        v8 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](self, "serviceName"), "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[GKDiscoveryPeer stringForState:]";
      v13 = 1024;
      v14 = 209;
      v15 = 2080;
      v16 = v8;
      v17 = 1024;
      v18 = a3;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] unrecognized state [%d]", (uint8_t *)&v9, 0x2Cu);
    }
  }
  return CFSTR("unknown");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GKDiscoveryPeer: [deviceID = %@] [playerID = %@] [state = %@] [signal discovery = %d] [interfaces = %@] [chosenInterface = %@]"), -[GKDiscoveryPeer deviceID](self, "deviceID"), -[GKDiscoveryPeer playerID](self, "playerID"), -[GKDiscoveryPeer stringForState:](self, "stringForState:", -[GKDiscoveryPeer state](self, "state")), -[GKDiscoveryPeer shouldSignalDiscovery](self, "shouldSignalDiscovery"), objc_msgSend((id)-[NSMutableSet allObjects](-[GKDiscoveryPeer interfaces](self, "interfaces"), "allObjects"), "componentsJoinedByString:", CFSTR(",")), -[GKDiscoveryPeer chosenInterface](self, "chosenInterface"));
}

- (void)setState:(int)a3
{
  uint64_t v3;
  uint64_t state;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v3 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryPeer serviceName](self, "serviceName"))
        v8 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](self, "serviceName"), "description"), "UTF8String");
      else
        v8 = "<nil>";
      if (-[GKDiscoveryPeer stringForState:](self, "stringForState:", state))
        v9 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryPeer stringForState:](self, "stringForState:", state), "description"), "UTF8String");
      else
        v9 = "<nil>";
      if (-[GKDiscoveryPeer stringForState:](self, "stringForState:", v3))
        v10 = (const char *)objc_msgSend((id)objc_msgSend(-[GKDiscoveryPeer stringForState:](self, "stringForState:", v3), "description"), "UTF8String");
      else
        v10 = "<nil>";
      v11 = 136316418;
      v12 = v6;
      v13 = 2080;
      v14 = "-[GKDiscoveryPeer setState:]";
      v15 = 1024;
      v16 = 230;
      v17 = 2080;
      v18 = v8;
      v19 = 2080;
      v20 = v9;
      v21 = 2080;
      v22 = v10;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] changing state from '%s' to '%s'", (uint8_t *)&v11, 0x3Au);
    }
  }
  self->_state = v3;
}

- (id)nextInterfaceIndex
{
  NSMutableArray *orderedInterfaces;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSString *serviceName;
  const char *v12;
  const char *v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  orderedInterfaces = self->_orderedInterfaces;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](orderedInterfaces, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(orderedInterfaces);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_attemptedInterfaces, "containsObject:", v8) & 1) == 0)
        {
          -[NSMutableArray addObject:](self->_attemptedInterfaces, "addObject:", v8);
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](orderedInterfaces, "countByEnumeratingWithState:objects:count:", &v16, v32, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      if (serviceName)
        v12 = -[NSString UTF8String](-[NSString description](serviceName, "description"), "UTF8String");
      else
        v12 = "<nil>";
      if (-[NSMutableArray description](self->_orderedInterfaces, "description"))
        v13 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableArray description](self->_orderedInterfaces, "description"), "description"), "UTF8String");
      else
        v13 = "<nil>";
      if (objc_msgSend(v8, "description"))
        v14 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "description"), "description"), "UTF8String");
      else
        v14 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v21 = v9;
      v22 = 2080;
      v23 = "-[GKDiscoveryPeer nextInterfaceIndex]";
      v24 = 1024;
      v25 = 247;
      v26 = 2080;
      v27 = v12;
      v28 = 2080;
      v29 = v13;
      v30 = 2080;
      v31 = v14;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] _orderedInterfaces = %s next interface to resolve on = %s", buf, 0x3Au);
    }
  }
  if (v8)
    -[NSMutableArray removeObject:](self->_orderedInterfaces, "removeObject:", v8);
  return v8;
}

- (void)startResolveTimerWithHandler:(id)a3
{
  double v5;
  uint64_t v6;
  NSObject *v7;
  GKSimpleTimer *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = micro();
  if (!a3 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v6;
      v14 = 2080;
      v15 = "-[GKDiscoveryPeer startResolveTimerWithHandler:]";
      v16 = 1024;
      v17 = 260;
      _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timeoutHandler is nil", (uint8_t *)&v12, 0x1Cu);
    }
  }
  -[GKDiscoveryPeer setResolveTimeoutHandler:](self, "setResolveTimeoutHandler:", (id)objc_msgSend(a3, "copy"));
  v8 = objc_alloc_init(GKSimpleTimer);
  -[GKSimpleTimer setDelegate:](v8, "setDelegate:", self);
  -[GKDiscoveryPeer setResolveTimer:](self, "setResolveTimer:", v8);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryPeer serviceName](self, "serviceName"))
        v11 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](self, "serviceName"), "description"), "UTF8String");
      else
        v11 = "<nil>";
      v12 = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "-[GKDiscoveryPeer startResolveTimerWithHandler:]";
      v16 = 1024;
      v17 = 269;
      v18 = 2080;
      v19 = v11;
      v20 = 2048;
      v21 = 0x404E000000000000;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] starting resolve timer with timout [%f seconds]", (uint8_t *)&v12, 0x30u);
    }
  }
  -[GKSimpleTimer fireIn:fromNow:](v8, "fireIn:fromNow:", 60.0, v5);

}

- (void)stopResolveTimer
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_resolveTimer)
  {
    if (self->_resolveTimeoutHandler)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (-[GKDiscoveryPeer serviceName](self, "serviceName"))
            v5 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](self, "serviceName"), "description"), "UTF8String");
          else
            v5 = "<nil>";
          v6 = 136315906;
          v7 = v3;
          v8 = 2080;
          v9 = "-[GKDiscoveryPeer stopResolveTimer]";
          v10 = 1024;
          v11 = 278;
          v12 = 2080;
          v13 = v5;
          _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolve timer stopped", (uint8_t *)&v6, 0x26u);
        }
      }
    }
    -[GKDiscoveryPeer setResolveTimeoutHandler:](self, "setResolveTimeoutHandler:", 0);
    -[GKSimpleTimer invalidate](-[GKDiscoveryPeer resolveTimer](self, "resolveTimer"), "invalidate");
    -[GKDiscoveryPeer setResolveTimer:](self, "setResolveTimer:", 0);
  }
}

- (void)didLoseInterface:(id)a3
{
  -[NSMutableSet removeObject:](self->_interfaces, "removeObject:");
  -[NSMutableArray removeObject:](self->_orderedInterfaces, "removeObject:", a3);
  -[NSMutableArray removeObject:](self->_attemptedInterfaces, "removeObject:", a3);
}

- (void)cleanUpForBrowse
{
  -[NSMutableSet removeAllObjects](self->_interfaces, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_orderedInterfaces, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_attemptedInterfaces, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_sendDataBuffer, "removeAllObjects");
}

- (void)invalidate
{
  -[GKDiscoveryPeerConnection invalidate](self->_connection, "invalidate");
  -[GKDiscoveryPeerConnection invalidate](self->_trialConnection, "invalidate");
  -[GKDiscoveryPeer cleanUpForBrowse](self, "cleanUpForBrowse");
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  NSMutableArray *sendDataBuffer;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  if (self->_state == 3)
  {
    -[GKDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", a3, a4);
  }
  else
  {
    sendDataBuffer = self->_sendDataBuffer;
    v5[0] = CFSTR("GKDiscoveryPeerSendDataKey");
    v5[1] = CFSTR("GKDiscoveryPeerSendCompletionHandlerKey");
    v6[0] = a3;
    v6[1] = a4;
    -[NSMutableArray addObject:](sendDataBuffer, "addObject:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  }
}

- (void)flushDataBuffer
{
  int state;
  int ErrorLogLevelForModule;
  uint64_t v6;
  NSObject *v7;
  const char *Name;
  NSString *serviceName;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  const char *v14;
  int v15;
  NSMutableArray *sendDataBuffer;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (state == 3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        Name = sel_getName(a2);
        serviceName = self->_serviceName;
        if (serviceName)
          v10 = -[NSString UTF8String](-[NSString description](serviceName, "description"), "UTF8String");
        else
          v10 = "<nil>";
        v15 = -[NSMutableArray count](self->_sendDataBuffer, "count");
        *(_DWORD *)buf = 136316418;
        v42 = v6;
        v43 = 2080;
        v44 = "-[GKDiscoveryPeer flushDataBuffer]";
        v45 = 1024;
        v46 = 322;
        v47 = 2080;
        v48 = Name;
        v49 = 2080;
        v50 = v10;
        v51 = 1024;
        v52 = v15;
        _os_log_impl(&dword_215C5C000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s: peer [%s] relaying buffered data (%d sendData calls) to the peer connection object)", buf, 0x36u);
      }
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    sendDataBuffer = self->_sendDataBuffer;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sendDataBuffer, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(sendDataBuffer);
          -[GKDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("GKDiscoveryPeerSendDataKey")), objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("GKDiscoveryPeerSendCompletionHandlerKey")));
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sendDataBuffer, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v18);
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_serviceName;
        if (v13)
          v14 = -[NSString UTF8String](-[NSString description](v13, "description"), "UTF8String");
        else
          v14 = "<nil>";
        v21 = -[NSMutableArray count](self->_sendDataBuffer, "count");
        *(_DWORD *)buf = 136316162;
        v42 = v11;
        v43 = 2080;
        v44 = "-[GKDiscoveryPeer flushDataBuffer]";
        v45 = 1024;
        v46 = 331;
        v47 = 2080;
        v48 = v14;
        v49 = 1024;
        LODWORD(v50) = v21;
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] no connection; notify GK that data [%d] failed to send",
          buf,
          0x2Cu);
      }
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = self->_sendDataBuffer;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      v26 = *MEMORY[0x24BDD0FC8];
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v28 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("GKDiscoveryPeerSendCompletionHandlerKey"));
          if (v28)
          {
            v37 = v26;
            v38 = CFSTR("Unable to connect");
            (*(void (**)(uint64_t, uint64_t))(v28 + 16))(v28, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKDiscoveryPeer"), -1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1)));
          }
        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v24);
    }
  }
  -[NSMutableArray removeAllObjects](self->_sendDataBuffer, "removeAllObjects");
}

- (void)timeout:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void (**resolveTimeoutHandler)(void);
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (-[GKDiscoveryPeer serviceName](self, "serviceName"))
        v6 = -[NSString UTF8String](-[NSString description](-[GKDiscoveryPeer serviceName](self, "serviceName"), "description"), "UTF8String");
      else
        v6 = "<nil>";
      v8 = 136315906;
      v9 = v4;
      v10 = 2080;
      v11 = "-[GKDiscoveryPeer timeout:]";
      v12 = 1024;
      v13 = 349;
      v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d peer [%s] resolve timout fired", (uint8_t *)&v8, 0x26u);
    }
  }
  resolveTimeoutHandler = (void (**)(void))self->_resolveTimeoutHandler;
  if (resolveTimeoutHandler)
    resolveTimeoutHandler[2]();
  -[GKDiscoveryPeer setResolveTimeoutHandler:](self, "setResolveTimeoutHandler:", 0);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableSet)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)orderedInterfaces
{
  return self->_orderedInterfaces;
}

- (void)setOrderedInterfaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)attemptedInterfaces
{
  return self->_attemptedInterfaces;
}

- (void)setAttemptedInterfaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSNumber)chosenInterface
{
  return self->_chosenInterface;
}

- (void)setChosenInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (GKDiscoveryPeerConnection)trialConnection
{
  return self->_trialConnection;
}

- (void)setTrialConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)shouldSignalDiscovery
{
  return self->_shouldSignalDiscovery;
}

- (void)setShouldSignalDiscovery:(BOOL)a3
{
  self->_shouldSignalDiscovery = a3;
}

- (GKDiscoveryPeerConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)sendDataBuffer
{
  return self->_sendDataBuffer;
}

- (void)setSendDataBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int)state
{
  return self->_state;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (double)discoveryTimeStamp
{
  return self->_discoveryTimeStamp;
}

- (void)setDiscoveryTimeStamp:(double)a3
{
  self->_discoveryTimeStamp = a3;
}

- (GKSimpleTimer)resolveTimer
{
  return self->_resolveTimer;
}

- (void)setResolveTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (id)resolveTimeoutHandler
{
  return self->_resolveTimeoutHandler;
}

- (void)setResolveTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
