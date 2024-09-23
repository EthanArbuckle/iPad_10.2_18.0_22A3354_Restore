@implementation GKConnectionInternal

- (GKConnectionInternal)initWithParticipantID:(id)a3
{
  int AppBooleanValue;
  BOOL v6;
  GKConnectionInternal *v7;
  uint64_t v8;
  int UniqueID;
  const __CFAllocator *v10;
  objc_super v12;
  Boolean keyExistsAndHasValidFormat;

  VRTraceReset();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("GKVerboseLogging"), CFSTR("com.apple.gamekit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  if (!v6)
    VRTraceSetErrorLogLevel();
  v12.receiver = self;
  v12.super_class = (Class)GKConnectionInternal;
  v7 = -[GKConnectionInternal init](&v12, sel_init);
  v8 = (uint64_t)v7;
  if (v7)
  {
    v7->_cdxSessions = 0;
    *(_QWORD *)&v7->_gckPID = a3;
    UniqueID = GCKSessionCreateUniqueID();
    *(_DWORD *)(v8 + 20) = UniqueID;
    if (GCKSessionCreate(0, UniqueID, (uint64_t)GCKEventListenerForGKConnection, v8, (_QWORD *)(v8 + 32)))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          -[GKConnectionInternal initWithParticipantID:].cold.1();
      }
      return 0;
    }
    else
    {
      *(_DWORD *)(v8 + 504) = 0;
      *(_QWORD *)(v8 + 40) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      GCKSessionSetLocalName(*(_QWORD *)(v8 + 32), (const void *)objc_msgSend(a3, "UTF8String"), objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4));
      pthread_mutex_init((pthread_mutex_t *)(v8 + 96), 0);
      pthread_cond_init((pthread_cond_t *)(v8 + 160), 0);
      pthread_mutex_init((pthread_mutex_t *)(v8 + 208), 0);
      pthread_cond_init((pthread_cond_t *)(v8 + 272), 0);
      pthread_mutex_init((pthread_mutex_t *)(v8 + 400), 0);
      *(_QWORD *)(v8 + 336) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 352) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 344) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 360) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      *(_QWORD *)(v8 + 384) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 464) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 480) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 472) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 488) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 496) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 376) = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled"))
        *(_BYTE *)(v8 + 368) = 1;
      *(_QWORD *)(v8 + 528) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 536) = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)(v8 + 544) = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(*(id *)(v8 + 384), "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), *(unsigned int *)(v8 + 20)));
      objc_msgSend((id)v8, "setCdxSessions:", objc_msgSend(MEMORY[0x24BDBCED8], "dictionary"));
      v10 = CFGetAllocator((CFTypeRef)v8);
      *(_QWORD *)(v8 + 392) = CFDictionaryCreateMutable(v10, 0, MEMORY[0x24BDBD6A0], &dispatch_value_callbacks);
      if (objc_msgSend(off_24D465868, "getAddressForService:", *(_QWORD *)off_24D465698))
        objc_msgSend((id)v8, "setCdxClient:", -[CDXClient initWithOptions:delegate:]([CDXClient alloc], "initWithOptions:delegate:", 0, v8));
      *(_DWORD *)(v8 + 508) = -1;
      *(_QWORD *)(v8 + 560) = objc_alloc_init(MEMORY[0x24BDFDBC0]);
    }
  }
  return (GKConnectionInternal *)v8;
}

- (void)preRelease
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
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
  const char *Name;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    v6 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (objc_opt_class())
          v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
        else
          v7 = "<nil>";
        v9 = 136316162;
        v10 = v4;
        v11 = 2080;
        v12 = "-[GKConnectionInternal preRelease]";
        v13 = 1024;
        v14 = 512;
        v15 = 2080;
        v16 = v7;
        v17 = 2080;
        Name = sel_getName(a2);
        _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d -[%s %s]", (uint8_t *)&v9, 0x30u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      if (objc_opt_class())
        v8 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = 136316162;
      v10 = v4;
      v11 = 2080;
      v12 = "-[GKConnectionInternal preRelease]";
      v13 = 1024;
      v14 = 512;
      v15 = 2080;
      v16 = v8;
      v17 = 2080;
      Name = sel_getName(a2);
      _os_log_debug_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEBUG, " [%s] %s:%d -[%s %s]", (uint8_t *)&v9, 0x30u);
    }
  }
  LODWORD(self->_updateRelayQueue) = 1;
}

- (void)dealloc
{
  __int16 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a2 + 24), "UTF8String");
  v8 = 136316162;
  v9 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4();
  v10 = 517;
  v11 = 2048;
  v12 = a2;
  v13 = v6;
  v14 = v7;
  _os_log_debug_impl(&dword_215C5C000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKConnectionInternal(%p) -dealloc (localParticipant: %s)", (uint8_t *)&v8, 0x30u);
}

- (id)timerQueue
{
  return (id)MEMORY[0x24BDAC9B8];
}

- (id)asyncWorkQueue
{
  return dispatch_get_global_queue(0, 0);
}

- (void)getLocalConnectionDataWithCompletionHandler:(id)a3
{
  double *p_preblobCallbackCancelTime;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  unsigned int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  TimingLog(3, 1, (uint64_t)"Getting local connection data");
  perfTimerStart();
  p_preblobCallbackCancelTime = &self->_preblobCallbackCancelTime;
  pthread_mutex_lock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
  if (self->_preblob)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FD8];
    v31[0] = CFSTR("Previous getLocalConnectionData not completed yet");
    v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v8 = v6;
    v9 = 510;
LABEL_3:
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("GKConnection"), v9, v7));
    goto LABEL_17;
  }
  if (!-[GKConnectionInternal cdxClient](self, "cdxClient"))
  {
    if (!objc_msgSend(off_24D465868, "getAddressForService:", *(_QWORD *)off_24D465698))
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FD8];
      v29 = CFSTR("CDX settings are not set");
      v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v8 = v17;
      v9 = 509;
      goto LABEL_3;
    }
    -[GKConnectionInternal setCdxClient:](self, "setCdxClient:", -[CDXClient initWithOptions:delegate:]([CDXClient alloc], "initWithOptions:delegate:", 0, self));
  }
  if (self->_cdxSessions)
  {
    v19 = bswap32(*(&self->super._pid + 1));
    v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v19, 4);
    objc_msgSend(v10, "appendData:", self->_cdxSessions);
    TimingLog(3, 0, (uint64_t)"Got local connection data - passing data to app");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      v13 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(v10, "length");
          *(_DWORD *)buf = 136315906;
          v21 = v11;
          v22 = 2080;
          v23 = "-[GKConnectionInternal getLocalConnectionDataWithCompletionHandler:]";
          v24 = 1024;
          v25 = 609;
          v26 = 2048;
          v27 = v14;
          _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got local connection data size=%lu", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal getLocalConnectionDataWithCompletionHandler:].cold.1(v11, v10);
      }
    }
    (*((void (**)(id, void *, _QWORD))a3 + 2))(a3, v10, 0);
    TimingLog(3, 0, (uint64_t)"Got local connection data - done");
    perfTimerStop();
  }
  else
  {
    self->_preblob = (NSData *)objc_msgSend(a3, "copy");
    *(double *)&self->_preblobCallback = micro() + 60.0;
    v15 = dispatch_time(0, 60000000000);
    v16 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__GKConnectionInternal_getLocalConnectionDataWithCompletionHandler___block_invoke;
    v18[3] = &unk_24D466170;
    v18[4] = self;
    dispatch_after(v15, v16, v18);
  }
LABEL_17:
  pthread_mutex_unlock((pthread_mutex_t *)p_preblobCallbackCancelTime);
}

uint64_t __68__GKConnectionInternal_getLocalConnectionDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = micro();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 80) && v2 > *(double *)(v3 + 88))
  {
    TimingLog(3, 0, (uint64_t)"Got local connection data - timeout");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v6 = *MEMORY[0x24BDD0FD8];
    v7[0] = CFSTR("getLocalConnectionData timed out");
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("GKConnection"), 503, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
    v3 = *(_QWORD *)(a1 + 32);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v3 + 96));
}

- (void)connectPendingConnectionsFromList:(id)a3 sessionInfo:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  int v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE buf[12];
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  _BYTE v62[10];
  __int16 v63;
  _QWORD v64[2];
  _BYTE v65[128];
  _QWORD v66[2];
  _QWORD v67[4];

  v67[2] = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(a3, "count");
      v10 = *(&self->super._pid + 1);
      v11 = -[NSMutableDictionary count](self->_preblobToPIDMap, "count");
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v7;
      v57 = 2080;
      v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
      v59 = 1024;
      v60 = 646;
      v61 = 1024;
      *(_DWORD *)v62 = v9;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v10;
      v63 = 1024;
      LODWORD(v64[0]) = v11;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectPendingConnections: connecting %d (from %u) (_pidToPreblobMap: %d)", buf, 0x2Eu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    v14 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v12;
        v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        v59 = 1024;
        v60 = 648;
        v61 = 2080;
        *(_QWORD *)v62 = v15;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectPendingConnections: sessionInfo: %s", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:].cold.1(v12, a4);
    }
  }
  if (!objc_msgSend(a3, "count"))
    goto LABEL_52;
  v16 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a3);
  objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(&self->super._pid + 1)));
  obj = v16;
  objc_msgSend(v16, "sortUsingSelector:", sel_compare_);
  v17 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GKSSessionTicket"));
  v18 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("GKSSessionToken"));
  if ((int)*MEMORY[0x24BDFDC10] > 6 || *MEMORY[0x24BDFDC20] != 0)
  {
    *(_QWORD *)buf = objc_msgSend(a3, "count");
    VRTraceVariable_();
  }
  if (!v17)
    goto LABEL_27;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v17, "CDXTicketWellFormed") & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v25;
        v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        v59 = 1024;
        v60 = 667;
        v61 = 2080;
        *(_QWORD *)v62 = v27;
        _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Malformed GKSSessionTicketData in sessionInfo! %s", buf, 0x26u);
      }
    }
    goto LABEL_26;
  }
  v20 = objc_msgSend(v17, "CDXTicketPCNT");
  if (v20 != objc_msgSend(v16, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v17, "CDXTicketPCNT");
        v24 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v21;
        v57 = 2080;
        v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
        v59 = 1024;
        v60 = 670;
        v61 = 1024;
        *(_DWORD *)v62 = v23;
        *(_WORD *)&v62[4] = 1024;
        *(_DWORD *)&v62[6] = v24;
        _os_log_error_impl(&dword_215C5C000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d CDX PCNT Mismatch! [cdxTicket CDXTicketPCNT] = %d, [connectionPIDList count] = %d", buf, 0x28u);
      }
    }
LABEL_26:
    v17 = 0;
  }
LABEL_27:
  v28 = (id)objc_msgSend(v17, "CDXTicketTrimmed");
  if (v18)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_msgSend((id)objc_msgSend(v28, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v29;
          v57 = 2080;
          v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
          v59 = 1024;
          v60 = 680;
          v61 = 2080;
          *(_QWORD *)v62 = v31;
          _os_log_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Malformed GKSSessionTokenData in sessionInfo! %s", buf, 0x26u);
        }
      }
      v18 = 0;
    }
  }
  if (!v28)
  {
    v28 = -[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:](self, "createInsecureTicketUsingSortedConnectionsFromList:", v16);
    if (!v28)
      goto LABEL_53;
  }
  v32 = -[CDXClient createSessionWithTicket:sessionKey:](-[GKConnectionInternal cdxClient](self, "cdxClient"), "createSessionWithTicket:sessionKey:", v28, v18);
  objc_msgSend(v32, "setDelegate:", self);
  if (!v32)
  {
LABEL_52:
    v28 = 0;
LABEL_53:
    v43 = 0;
    goto LABEL_51;
  }
  v66[0] = CFSTR("cdxClientSession");
  v66[1] = CFSTR("connectionPIDList");
  v67[0] = v32;
  v67[1] = obj;
  v50 = v28;
  -[NSMutableDictionary setObject:forKey:](-[GKConnectionInternal cdxSessions](self, "cdxSessions"), "setObject:forKey:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2), objc_msgSend(v28, "valueForKey:", CFSTR("CDXTicketSID")));
  v28 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v53 != v35)
          objc_enumerationMutation(obj);
        v37 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v38 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToPreblobMap, "objectForKeyedSubscript:", v37);
        if (objc_msgSend(v38, "length"))
        {
          objc_msgSend(v28, "appendData:", v38);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v41 = objc_msgSend(v38, "length");
              v42 = objc_msgSend(v28, "length");
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)&buf[4] = v39;
              v57 = 2080;
              v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
              v59 = 1024;
              v60 = 712;
              v61 = 1024;
              *(_DWORD *)v62 = v41;
              *(_WORD *)&v62[4] = 1024;
              *(_DWORD *)&v62[6] = v42;
              v63 = 2112;
              v64[0] = v37;
              _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d appending nextBlob=%d => combined=%d=, for pid=%@", buf, 0x32u);
            }
          }
          perfTimerStart();
          reportingGKLog();
        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v34);
  }
  TimingLog(3, 0, (uint64_t)"starting CDX");
  v43 = v32;
  objc_msgSend(v32, "sendData:", v28);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_msgSend(v50, "length");
      v47 = objc_msgSend(v28, "length");
      v48 = objc_msgSend(obj, "count");
      v49 = -[NSMutableDictionary count](self->_pidToPreblobMap, "count");
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v44;
      v57 = 2080;
      v58 = "-[GKConnectionInternal connectPendingConnectionsFromList:sessionInfo:]";
      v59 = 1024;
      v60 = 733;
      v61 = 1024;
      *(_DWORD *)v62 = v46;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = v47;
      v63 = 1024;
      LODWORD(v64[0]) = v48;
      WORD2(v64[0]) = 1024;
      *(_DWORD *)((char *)v64 + 6) = v49;
      _os_log_impl(&dword_215C5C000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting CDX: ticket(%d) and data(%d) from %d preblobs (%d total CDs)", buf, 0x34u);
    }
  }
LABEL_51:

}

- (BOOL)shouldWeInitiateRelayWithPID:(unsigned int)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  unsigned int v25;
  unsigned __int8 v26[16];
  unsigned __int8 md[16];
  _DWORD v28[2];
  unsigned int data;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  memset(md, 170, sizeof(md));
  memset(v26, 170, sizeof(v26));
  data = bswap32(*(&self->super._pid + 1));
  v30 = bswap32(a3);
  v28[0] = v30;
  v28[1] = data;
  CC_MD5(&data, 8u, md);
  CC_MD5(v28, 8u, v26);
  v5 = bswap64(*(unint64_t *)md);
  v6 = bswap64(*(unint64_t *)v26);
  if (v5 == v6 && (v5 = bswap64(*(unint64_t *)&md[8]), v6 = bswap64(*(unint64_t *)&v26[8]), v5 == v6))
  {
    v7 = 0;
  }
  else if (v5 < v6)
  {
    v7 = -1;
  }
  else
  {
    v7 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(&self->super._pid + 1);
      v11 = CFSTR("should not");
      v14 = 136316418;
      v15 = v8;
      if (v7 < 0)
        v11 = CFSTR("should");
      v16 = 2080;
      v17 = "-[GKConnectionInternal shouldWeInitiateRelayWithPID:]";
      v18 = 1024;
      v19 = 752;
      v20 = 1024;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 1024;
      v25 = a3;
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldWeInitiateRelayWithPID: Local participant='%d' %@ initiate relay with remote participant='%d'", (uint8_t *)&v14, 0x32u);
    }
  }
  return v7 >> 31;
}

- (void)connectParticipantsWithConnectionData:(id)a3 withSessionInfo:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  GKAsyncSocket *v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v50;
  id obj;
  id v52;
  NSObject *object;
  _QWORD v55[7];
  _QWORD block[9];
  int v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[7];
  _QWORD v63[6];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  __int128 v69;
  __int128 v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  _BYTE v74[128];
  _BYTE buf[54];
  __int16 v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)&self->_gckPID;
      v8 = *(&self->super._pid + 1);
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 757;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v7;
      *(_WORD *)&buf[38] = 1024;
      *(_DWORD *)&buf[40] = v8;
      *(_WORD *)&buf[44] = 2112;
      *(_QWORD *)&buf[46] = a3;
      v76 = 2112;
      v77 = a4;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnectionInternal(%@ (%d)) connectParticipantsWithConnectionData is '%@', sessionInfo is '%@'", buf, 0x40u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 759;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d start-p2p-hole-punch", buf, 0x1Cu);
    }
  }
  TimingLog(3, 1, (uint64_t)"Start holepunching for peer to peer");
  object = dispatch_group_create();
  if (object)
  {
    v52 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    obj = (id)objc_msgSend(a3, "allKeys");
    if (a4)
    {
      objc_sync_enter(self);
      if (LOBYTE(self->_pendingConnectionPIDList) && objc_msgSend(obj, "count") == 1)
      {
        v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(obj, "objectAtIndexedSubscript:", 0));
        if ((unint64_t)objc_msgSend(v11, "length") < 4)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v35 = VRTraceErrorLogLevelToCSTR();
            v36 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              -[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:].cold.2(objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", 0), "UTF8String"), buf, v35, v36);
          }
        }
        else
        {
          v12 = *(_DWORD *)objc_msgSend(v11, "bytes");
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), bswap32(v12));
          objc_msgSend(*(id *)&self->_fAllowMoreRelay, "addObject:", v13);

          LOBYTE(self->_pendingConnectionPIDList) = 0;
        }
      }
      objc_sync_exit(self);
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v59 != v38)
              objc_enumerationMutation(obj);
            v40 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
            v41 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v40);
            v42 = v41;
            if (v41)
            {
              v43 = bswap32(*(_DWORD *)objc_msgSend(v41, "bytes"));
              v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v43);
              -[GKConnectionInternal setParticipantID:forPeerID:](self, "setParticipantID:forPeerID:", v40, v44);
              connectingGKLog();
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
              reportingGKAppInfo();
              v45 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165;
              block[3] = &unk_24D4666B8;
              block[4] = self;
              block[5] = v40;
              block[6] = v44;
              block[7] = v42;
              block[8] = v52;
              v57 = v43;
              dispatch_group_async(object, v45, block);
            }
          }
          v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        }
        while (v37);
      }
      v46 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_169;
      v55[3] = &unk_24D4661E0;
      v55[4] = self;
      v55[5] = v52;
      v55[6] = a4;
      dispatch_group_notify(object, v46, v55);

      dispatch_release(object);
    }
    else
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      if (v48)
      {
        v50 = 0;
        v47 = *(_QWORD *)v65;
        for (j = *(_QWORD *)v65; ; j = *(_QWORD *)v65)
        {
          if (j != v47)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v50);
          v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v15);
          if ((unint64_t)objc_msgSend(v16, "length") > 5)
          {
            v21 = *(_DWORD *)objc_msgSend(v16, "bytes");
            v22 = *(unsigned __int16 *)(objc_msgSend(v16, "bytes") + 4);
            if (-[GKConnectionInternal shouldWeInitiateRelayWithPID:](self, "shouldWeInitiateRelayWithPID:", bswap32(v21)))
            {
              v23 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
              v24 = objc_msgSend(v16, "bytes");
              if ((unint64_t)(objc_msgSend(v16, "length") - 11) <= 0xFFFFFFFFFFFFFFFALL)
              {
                v25 = 6;
                do
                {
                  v73 = 0xAAAAAAAAAAAAAAAALL;
                  v72 = 0xAAAAAAAAAAAAAAAALL;
                  v26 = *(unsigned __int8 *)(v24 + v25);
                  if (v26 == 4)
                  {
                    v73 = 0;
                    v72 = 528;
                    HIDWORD(v72) = *(_DWORD *)(v24 + v25 + 1);
                    TimingLog(3, 0, (uint64_t)"starting local CDX tcp connection (connect)");
                    v27 = objc_alloc_init(GKAsyncSocket);
                    v25 += 5;
                    if (v27)
                    {
                      objc_msgSend(v23, "addObject:", v27);
                      v63[0] = MEMORY[0x24BDAC760];
                      v63[1] = 3221225472;
                      v63[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke;
                      v63[3] = &unk_24D4665D8;
                      v63[4] = self;
                      v63[5] = v27;
                      -[GKAsyncSocket setReceiveDataHandler:](v27, "setReceiveDataHandler:", v63);
                      v62[0] = MEMORY[0x24BDAC760];
                      v62[1] = 3221225472;
                      v62[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2;
                      v62[3] = &unk_24D466640;
                      v62[4] = v23;
                      v62[5] = v27;
                      v62[6] = self;
                      -[GKAsyncSocket setConnectedHandler:](v27, "setConnectedHandler:", v62);
                      *(_QWORD *)&buf[46] = 0xAAAAAAAAAAAAAAAALL;
                      *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(_OWORD *)&buf[16] = v28;
                      *(_OWORD *)&buf[32] = v28;
                      *(_OWORD *)buf = v28;
                      v71 = 0xAAAAAAAAAAAAAAAALL;
                      v69 = v28;
                      v70 = v28;
                      v29 = (void *)MEMORY[0x24BDD17C8];
                      v30 = *(&self->super._pid + 1);
                      SAToIPPORT();
                      -[GKAsyncSocket setSocketName:](v27, "setSocketName:", objc_msgSend(v29, "stringWithFormat:", CFSTR("localCDX[%u][%08X] (connect-to[%s]) (ptr=%p)"), v30, v30, IPPORTToStringWithSize(), v27));
                      -[GKAsyncSocket setTargetQueue:](v27, "setTargetQueue:", MEMORY[0x24BDAC9B8]);
                      -[GKAsyncSocket tcpConnectSockAddr:port:](v27, "tcpConnectSockAddr:port:", &v72, v22);
                    }
                  }
                  else
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v31 = VRTraceErrorLogLevelToCSTR();
                      v32 = *MEMORY[0x24BDFDC28];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315906;
                        *(_QWORD *)&buf[4] = v31;
                        *(_WORD *)&buf[12] = 2080;
                        *(_QWORD *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
                        *(_WORD *)&buf[22] = 1024;
                        *(_DWORD *)&buf[24] = 848;
                        *(_WORD *)&buf[28] = 1024;
                        *(_DWORD *)&buf[30] = v26;
                        _os_log_error_impl(&dword_215C5C000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d unknown ip address size (%u)", buf, 0x22u);
                      }
                    }
                    ++v25;
                  }
                }
                while ((unint64_t)(objc_msgSend(v16, "length") - v25) > 4);
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v33 = VRTraceErrorLogLevelToCSTR();
              v34 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = v33;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 792;
                _os_log_impl(&dword_215C5C000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d other side to start local gaming CDX", buf, 0x1Cu);
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            {
              v19 = "<nil>";
              if (v15)
                v19 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
              v20 = objc_msgSend(v16, "length");
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 777;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = v19;
              *(_WORD *)&buf[38] = 1024;
              *(_DWORD *)&buf[40] = v20;
              _os_log_error_impl(&dword_215C5C000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d not enough connection data for %s (%u)", buf, 0x2Cu);
            }
          }
          if (++v50 >= v48)
          {
            v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
            if (!v48)
              break;
            v50 = 0;
          }
        }
      }
      dispatch_release(object);

    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
      -[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:].cold.1();
  }
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "localGamingReceiveDataHandler:data:time:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v10 = 136315906;
      v11 = v4;
      v12 = 2080;
      v13 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
      v14 = 1024;
      v15 = 823;
      v16 = 2080;
      v17 = v6;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connected local CDX (%s)", (uint8_t *)&v10, 0x26u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (a2)
    return objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_0);
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v9 = a1 + 40;
  v8 = *(void **)(a1 + 40);
  v10 = bswap32(*(_DWORD *)(*(_QWORD *)(v9 + 8) + 20));
  return objc_msgSend(v8, "sendData:withCompletionHandler:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v10, 4), 0);
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_155(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int ErrorLogLevelForModule;
  int64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  _QWORD v18[7];
  _QWORD v19[9];
  _QWORD v20[4];
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "timerQueue");
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v2);
  v4 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2_166;
  v20[3] = &unk_24D466668;
  v5 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  v22 = v3;
  v19[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_167;
  v19[3] = &unk_24D466690;
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v23 = v5;
  v24 = v7;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[4] = v21;
  v19[5] = v5;
  v19[6] = v7;
  v19[7] = v3;
  v19[8] = v20;
  objc_msgSend(v5, "internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:", v6);
  if (v3)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "timerQueue");
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_168;
    v18[3] = &unk_24D4661E0;
    v18[4] = *(_QWORD *)(a1 + 32);
    v18[5] = v3;
    v18[6] = *(_QWORD *)(a1 + 48);
    dispatch_sync(v8, v18);
    v9 = objc_msgSend(*(id *)(a1 + 32), "shouldWeInitiateRelayWithPID:", *(unsigned int *)(a1 + 72));
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9)
    {
      v11 = 5000000000;
      if (ErrorLogLevelForModule >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v26 = v12;
          v27 = 2080;
          v28 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
          v29 = 1024;
          v30 = 990;
          _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectParticipantsWithConnectionData: This side is initiating relay", buf, 0x1Cu);
        }
      }
      v14 = v19;
    }
    else
    {
      v11 = 120000000000;
      if (ErrorLogLevelForModule >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v26 = v15;
          v27 = 2080;
          v28 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
          v29 = 1024;
          v30 = 1000;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d connectParticipantsWithConnectionData: This side is not initiating relay", buf, 0x1Cu);
        }
      }
      v14 = v20;
    }
    v17 = dispatch_time(0, v11);
    dispatch_source_set_timer(v3, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v3, v14);
    dispatch_resume(v3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165_cold_1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_FAULT))
    {
      __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165_cold_2();
    }
  }
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_2_166(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _BYTE v9[24];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v9 = 136315906;
      *(_QWORD *)&v9[4] = v2;
      *(_WORD *)&v9[12] = 2080;
      *(_QWORD *)&v9[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke_2";
      *(_WORD *)&v9[22] = 1024;
      v10 = 896;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************************************ connect_timeout_block Timer hit for '%@'", v9, 0x26u);
    }
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  if (!GCKSessionIsParticipantConnected(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), objc_msgSend(*(id *)(a1 + 56), "intValue"), 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v9 = 136315906;
        *(_QWORD *)&v9[4] = v5;
        *(_WORD *)&v9[12] = 2080;
        *(_QWORD *)&v9[14] = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
        *(_WORD *)&v9[22] = 1024;
        v10 = 901;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************************************ connect_timeout_block Timer disconnecting '%@'", v9, 0x26u);
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "cancelConnectParticipant:", *(_QWORD *)(a1 + 32));
    *(_QWORD *)&v9[8] = 0;
    *(_QWORD *)v9 = 2;
    *(_QWORD *)&v9[16] = 0x801A001700000000;
    objc_msgSend(*(id *)(a1 + 48), "addEvent:remotePeer:", v9, objc_msgSend(*(id *)(a1 + 56), "intValue", 2, 0, 0x801A001700000000));
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "pidToConnectTimeoutSource"), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_167(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v21 = 136315906;
      v22 = v2;
      v23 = 2080;
      v24 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
      v25 = 1024;
      v26 = 919;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ************************************ relay_setup_block Timer hit for '%@'", (uint8_t *)&v21, 0x26u);
    }
  }
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 464);
  objc_sync_enter(v5);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 464), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  objc_sync_exit(v5);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = v8;
        v23 = 2080;
        v24 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
        v25 = 1024;
        v26 = 942;
        v10 = " [%s] %s:%d relay_setup_block relayInitiateInfo is not nil";
        v11 = v9;
        v12 = 28;
LABEL_8:
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, v12);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315650;
        v22 = v13;
        v23 = 2080;
        v24 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
        v25 = 1024;
        v26 = 930;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d relay_setup_block relayInitiateInfo is nil", (uint8_t *)&v21, 0x1Cu);
      }
    }
    if (!GCKSessionIsParticipantConnected(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), objc_msgSend(*(id *)(a1 + 48), "intValue"), 1))
    {
      perfTimerStop();
      perfTimerStart();
      v15 = GCKSessionInitiateRelay(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), objc_msgSend(*(id *)(a1 + 48), "intValue"), (const void *)objc_msgSend(*(id *)(a1 + 40), "createInitiateRelayDictionaryForParticipant:remotePeerID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48)));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v21 = 136316162;
          v22 = v16;
          v23 = 2080;
          v24 = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]_block_invoke";
          v25 = 1024;
          v26 = 939;
          v27 = 2112;
          v28 = v18;
          v29 = 1024;
          v30 = v15;
          v10 = " [%s] %s:%d ************************************ GCKSessionInitiateRelay called for '%@' (%08X)";
          v11 = v17;
          v12 = 44;
          goto LABEL_8;
        }
      }
    }
  }
  dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 56), *(dispatch_block_t *)(a1 + 64));
  v19 = *(NSObject **)(a1 + 56);
  v20 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_168(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "pidToConnectTimeoutSource"), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_169(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(*(id *)(a1 + 32), "connectPendingConnectionsFromList:sessionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
}

- (void)internal_setRemoteConnectionData:(id)a3 fromParticipantID:(id)a4 pendingConnectionPIDList:(id)a5
{
  int ErrorLogLevelForModule;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  NSObject **v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  unsigned int v31;
  __int16 v32;
  int v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[10];
  uint64_t v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(*(id *)&self->_gckPID, "UTF8String");
      *(_DWORD *)buf = 136316162;
      v36 = v11;
      v37 = 2080;
      v38 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
      v39 = 1024;
      v40 = 1031;
      v41 = 2080;
      *(_QWORD *)v42 = v13;
      *(_WORD *)&v42[8] = 2080;
      v43 = objc_msgSend(a4, "UTF8String");
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnectionInternal(%s) -setRemoteConnectionData (%s)", buf, 0x30u);
    }
  }
  v34 = 0;
  v33 = 1350;
  v14 = *(_DWORD *)objc_msgSend(a3, "bytes");
  v15 = bswap32(v14);
  perfTimerStart();
  TimingLog(3, 0, (uint64_t)"Set remote preblob: holepunching for peer to peer\n");
  if ((GCKSessionPrepareConnection((uint64_t)self->_pidGUID, v15, (uint64_t)&v34, (uint64_t)&v33) & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        -[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:].cold.1();
    }
  }
  else
  {
    perfTimerStop();
    v32 = bswap32((unsigned __int16)v33 + 10) >> 16;
    v16 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v32, 2);
    v31 = v14;
    objc_msgSend(v16, "appendBytes:length:", &v31, 4);
    v31 = bswap32(*(&self->super._pid + 1));
    objc_msgSend(v16, "appendBytes:length:", &v31, 4);
    objc_msgSend(v16, "appendBytes:length:", v34, v33);
    free(v34);
    pthread_mutex_lock((pthread_mutex_t *)&self->_cPreblobFetch.__opaque[32]);
    v17 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
    v18 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(a3, "bytes") + 4, objc_msgSend(a3, "length") - 4);
    objc_msgSend(a5, "addObject:", v17);
    objc_msgSend(*(id *)&self->_wakeTime, "setObject:forKeyedSubscript:", v17, v18);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preblobToPIDMap, "setObject:forKeyedSubscript:", v18, v17);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToPreblobMap, "setObject:forKeyedSubscript:", v16, v17);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v18, "length");
        v22 = objc_msgSend(v16, "length");
        v23 = objc_msgSend(*(id *)&self->_wakeTime, "count");
        v24 = -[NSMutableDictionary count](self->_preblobToPIDMap, "count");
        v25 = -[NSMutableDictionary count](self->_pidToPreblobMap, "count");
        *(_DWORD *)buf = 136317186;
        v36 = v19;
        v37 = 2080;
        v38 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
        v39 = 1024;
        v40 = 1079;
        v41 = 1024;
        *(_DWORD *)v42 = v21;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v22;
        LOWORD(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 2) = v15;
        HIWORD(v43) = 1024;
        v44 = v23;
        v45 = 1024;
        v46 = v24;
        v47 = 1024;
        v48 = v25;
        _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setting preblob(%d) blob(%d) for %u, _preblobToPIDMap(%d) _pidToPreblobMap(%d) _pidToConnectionDataMap(%d)", buf, 0x40u);
      }
    }
    TimingLog(3, 0, (uint64_t)"Set remote preblob done");
    if (!*(_DWORD *)&self->_cPrepareThread.__opaque[32])
      *(_DWORD *)&self->_cPrepareThread.__opaque[32] = 1;
    *(double *)&self->_fPrepareThread = micro() + 0.3;
    pthread_mutex_unlock((pthread_mutex_t *)&self->_cPreblobFetch.__opaque[32]);
    v26 = VRTraceGetErrorLogLevelForModule();
    v27 = (NSObject **)MEMORY[0x24BDFDC28];
    if (v26 >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *v27;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = micro();
        *(_DWORD *)buf = 136315906;
        v36 = v28;
        v37 = 2080;
        v38 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
        v39 = 1024;
        v40 = 1093;
        v41 = 2048;
        *(double *)v42 = v30;
        _os_log_impl(&dword_215C5C000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %.3lf setRemoteCD returning", buf, 0x26u);
      }
    }
  }
}

- (OpaqueGCKSession)gckSession
{
  return (OpaqueGCKSession *)self->_pidGUID;
}

- (void)addEvent:(id *)a3 remotePeer:(unsigned int)a4
{
  uint64_t v4;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  OpaqueGCKSession *gckSession;
  NSMutableArray *gckEventList;
  GCKEventItem *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  GKConnectionInternal *v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x24BDAC8D0];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x24BDFDC28];
    v10 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v20 = 136315650;
      v21 = v8;
      v22 = 2080;
      v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
      v24 = 1024;
      v25 = 1107;
      v11 = " [%s] %s:%d ";
      v12 = v9;
      v13 = 28;
LABEL_13:
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v20, v13);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[GKConnectionInternal addEvent:remotePeer:].cold.1();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[GKConnectionInternal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      v16 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        v20 = 136316162;
        v21 = v14;
        v22 = 2080;
        v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
        v24 = 1024;
        v25 = 1107;
        v26 = 2112;
        v27 = v7;
        v28 = 2048;
        v29 = self;
        v11 = " [%s] %s:%d %@(%p) ";
        v12 = v15;
        v13 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v20 = 136316162;
        v21 = v14;
        v22 = 2080;
        v23 = "-[GKConnectionInternal addEvent:remotePeer:]";
        v24 = 1024;
        v25 = 1107;
        v26 = 2112;
        v27 = v7;
        v28 = 2048;
        v29 = self;
        _os_log_debug_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v20, 0x30u);
      }
    }
  }
LABEL_18:
  gckSession = self->_gckSession;
  objc_sync_enter(gckSession);
  gckEventList = self->_gckEventList;
  if (gckEventList)
  {
    -[NSMutableArray sendCallbacksToDelegate:remotePeer:](gckEventList, "sendCallbacksToDelegate:remotePeer:", a3, v4);
  }
  else
  {
    v19 = -[GCKEventItem initWithEvent:remotePeer:]([GCKEventItem alloc], "initWithEvent:remotePeer:", a3, v4);
    -[OpaqueGCKSession addObject:](self->_gckSession, "addObject:", v19);

  }
  objc_sync_exit(gckSession);
}

- (void)setEventDelegate:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  OpaqueGCKSession *gckSession;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  OpaqueGCKSession *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  GKConnectionInternal *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    v8 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 136315650;
      v26 = v6;
      v27 = 2080;
      v28 = "-[GKConnectionInternal setEventDelegate:]";
      v29 = 1024;
      v30 = 1120;
      v9 = " [%s] %s:%d ";
      v10 = v7;
      v11 = 28;
LABEL_13:
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[GKConnectionInternal setEventDelegate:].cold.1();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[GKConnectionInternal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      v14 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        *(_DWORD *)buf = 136316162;
        v26 = v12;
        v27 = 2080;
        v28 = "-[GKConnectionInternal setEventDelegate:]";
        v29 = 1024;
        v30 = 1120;
        v31 = 2112;
        v32 = v5;
        v33 = 2048;
        v34 = self;
        v9 = " [%s] %s:%d %@(%p) ";
        v10 = v13;
        v11 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        v26 = v12;
        v27 = 2080;
        v28 = "-[GKConnectionInternal setEventDelegate:]";
        v29 = 1024;
        v30 = 1120;
        v31 = 2112;
        v32 = v5;
        v33 = 2048;
        v34 = self;
        _os_log_debug_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
LABEL_18:
  obj = self->_gckSession;
  objc_sync_enter(obj);
  self->_gckEventList = (NSMutableArray *)a3;
  if (a3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    gckSession = self->_gckSession;
    v16 = -[OpaqueGCKSession countByEnumeratingWithState:objects:count:](gckSession, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(gckSession);
          -[NSMutableArray sendCallbacksToDelegate:remotePeer:](self->_gckEventList, "sendCallbacksToDelegate:remotePeer:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "event"), objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "pid"));
        }
        v16 = -[OpaqueGCKSession countByEnumeratingWithState:objects:count:](gckSession, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }
    -[OpaqueGCKSession removeAllObjects](self->_gckSession, "removeAllObjects");
  }
  objc_sync_exit(obj);
}

- (id)eventDelegate
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  GKConnectionInternal *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      v6 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315650;
          v15 = v4;
          v16 = 2080;
          v17 = "-[GKConnectionInternal eventDelegate]";
          v18 = 1024;
          v19 = 1133;
          v7 = " [%s] %s:%d ";
          v8 = v5;
          v9 = 28;
LABEL_13:
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal eventDelegate].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[GKConnectionInternal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      v12 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316162;
          v15 = v10;
          v16 = 2080;
          v17 = "-[GKConnectionInternal eventDelegate]";
          v18 = 1024;
          v19 = 1133;
          v20 = 2112;
          v21 = v3;
          v22 = 2048;
          v23 = self;
          v7 = " [%s] %s:%d %@(%p) ";
          v8 = v11;
          v9 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = 136316162;
        v15 = v10;
        v16 = 2080;
        v17 = "-[GKConnectionInternal eventDelegate]";
        v18 = 1024;
        v19 = 1133;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        _os_log_debug_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return self->_gckEventList;
}

- (unsigned)gckPID
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  GKConnectionInternal *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((GKConnectionInternal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x24BDFDC28];
      v6 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136315650;
          v15 = v4;
          v16 = 2080;
          v17 = "-[GKConnectionInternal gckPID]";
          v18 = 1024;
          v19 = 1138;
          v7 = " [%s] %s:%d ";
          v8 = v5;
          v9 = 28;
LABEL_13:
          _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[GKConnectionInternal gckPID].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[GKConnectionInternal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      v12 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316162;
          v15 = v10;
          v16 = 2080;
          v17 = "-[GKConnectionInternal gckPID]";
          v18 = 1024;
          v19 = 1138;
          v20 = 2112;
          v21 = v3;
          v22 = 2048;
          v23 = self;
          v7 = " [%s] %s:%d %@(%p) ";
          v8 = v11;
          v9 = 48;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = 136316162;
        v15 = v10;
        v16 = 2080;
        v17 = "-[GKConnectionInternal gckPID]";
        v18 = 1024;
        v19 = 1138;
        v20 = 2112;
        v21 = v3;
        v22 = 2048;
        v23 = self;
        _os_log_debug_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) ", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return *(&self->super._pid + 1);
}

- (void)setCdxClient:(id)a3
{
  id eventDelegate;
  id v6;

  eventDelegate = self->_eventDelegate;
  if (eventDelegate != a3)
  {
    objc_msgSend(self->_eventDelegate, "setDelegate:", 0);
    v6 = a3;
    self->_eventDelegate = v6;
    objc_msgSend(v6, "setDelegate:", self);

    if (objc_msgSend(self->_eventDelegate, "preblob"))
      -[GKConnectionInternal CDXClient:preblob:](self, "CDXClient:preblob:", self->_eventDelegate, objc_msgSend(self->_eventDelegate, "preblob"));
  }
}

- (id)createInsecureTicketUsingSortedConnectionsFromList:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void **v6;
  _BYTE *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v37;
  _BYTE *v38;
  void **v39;
  uint64_t v40;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  size_t v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  _BYTE v59[128];
  uint64_t v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v61 = xmmword_215CDD990;
  v60 = 0x706050403020100;
  v48 = 1500;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v50 = v4;
      v51 = 2080;
      v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
      v53 = 1024;
      v54 = 1178;
      _os_log_impl(&dword_215C5C000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d <radar:7609403> remains unfixed.", buf, 0x1Cu);
    }
  }
  if (!objc_msgSend(a3, "count"))
    return 0;
  v6 = (void **)CDXVendorCreateWithSingleKey((unsigned int *)&v61);
  v7 = malloc_type_calloc(1uLL, 0x5DCuLL, 0x3EE178B8uLL);
  if (!v7)
  {
LABEL_51:
    v35 = 0;
    if (!v6)
      goto LABEL_53;
    goto LABEL_52;
  }
  v43 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v8 = objc_msgSend(a3, "count");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
  if (v9)
  {
    v10 = v9;
    v37 = v8;
    v38 = v7;
    v39 = v6;
    v11 = 0;
    v12 = -1;
    v13 = 50462976;
    v42 = *(_QWORD *)v45;
    while (1)
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v45 != v42)
          objc_enumerationMutation(a3);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
        v13 ^= bswap32(objc_msgSend(v16, "unsignedLongValue"));
        LODWORD(v60) = v13;
        if (objc_msgSend(v16, "unsignedLongValue") == *(&self->super._pid + 1))
          v12 = v15 + v14;
        v17 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_preblobToPIDMap, "objectForKeyedSubscript:", v16);
        v18 = v17;
        if (!v17
          || (v19 = CDXGetPreblobLength((unsigned __int8 *)objc_msgSend(v17, "bytes"))) == 0
          || (v20 = (unint64_t)v19, (unint64_t)v19 > objc_msgSend(v18, "length")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_18;
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          v33 = "<nil>";
          if (v18)
            v33 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v50 = v21;
          v51 = 2080;
          v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
          v53 = 1024;
          v54 = 1208;
          v55 = 2080;
          v56 = (uint64_t)v33;
          v31 = v22;
          v32 = " [%s] %s:%d Preblob is too small: %s";
LABEL_41:
          _os_log_error_impl(&dword_215C5C000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x26u);
LABEL_18:
          objc_msgSend(v43, "appendBytes:length:", ", 1);
          goto LABEL_19;
        }
        if (v20 < objc_msgSend(v18, "length"))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v40 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v24 = objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
              *(_DWORD *)buf = 136316162;
              v50 = v40;
              v51 = 2080;
              v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
              v53 = 1024;
              v54 = 1221;
              v55 = 2080;
              v56 = v24;
              v57 = 1024;
              v58 = v20;
              _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trimming preblob %s to %d bytes", buf, 0x2Cu);
            }
          }
          v18 = (void *)objc_msgSend(v18, "subdataWithRange:", 0, v20);
        }
        if ((CDXVerifyPreblob((unsigned __int8 *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length")) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_18;
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x24BDFDC28];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            goto LABEL_18;
          v30 = "<nil>";
          if (v18)
            v30 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v50 = v28;
          v51 = 2080;
          v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
          v53 = 1024;
          v54 = 1226;
          v55 = 2080;
          v56 = (uint64_t)v30;
          v31 = v29;
          v32 = " [%s] %s:%d Invalid preblob: %s";
          goto LABEL_41;
        }
        if (*(_BYTE *)objc_msgSend(v18, "bytes") == 1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v25 = VRTraceErrorLogLevelToCSTR();
            v26 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (v18)
                v27 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
              else
                v27 = "<nil>";
              *(_DWORD *)buf = 136315906;
              v50 = v25;
              v51 = 2080;
              v52 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
              v53 = 1024;
              v54 = 1236;
              v55 = 2080;
              v56 = (uint64_t)v27;
              _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Rejecting anonymous preblob: %s", buf, 0x26u);
            }
          }
          goto LABEL_18;
        }
        objc_msgSend(v43, "appendData:", v18);
LABEL_19:
        ++v14;
      }
      while (v10 != v14);
      v11 = v15 + v10;
      v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
      v10 = v34;
      if (!v34)
      {
        v7 = v38;
        v6 = v39;
        v8 = v37;
        goto LABEL_47;
      }
    }
  }
  v12 = -1;
LABEL_47:
  if (CDXVendorCreateTicket((uint64_t)v6, v7, &v48, &v60, (const void *)objc_msgSend(v43, "bytes"), objc_msgSend(v43, "length"), v8, v12, 300, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:].cold.1();
    }
    goto LABEL_51;
  }
  v35 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v48, 1);
  v7 = 0;
  if (v6)
LABEL_52:
    CDXVendorRelease(v6);
LABEL_53:
  if (v7)
    free(v7);
  return v35;
}

- (void)CDXClient:(id)a3 error:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *Name;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[GKConnectionInternal CDXClient:error:]";
      v12 = 1024;
      v13 = 1282;
      v14 = 2080;
      Name = sel_getName(a2);
      v16 = 2080;
      v17 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      _os_log_error_impl(&dword_215C5C000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d [GKConnection %s]: %s", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (void)CDXClient:(id)a3 preblob:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  NSMutableDictionary *cdxSessions;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  unsigned int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = v7;
      v18 = 2080;
      v19 = "-[GKConnectionInternal CDXClient:preblob:]";
      v20 = 1024;
      v21 = 1286;
      _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d got-a-preblob", buf, 0x1Cu);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
  cdxSessions = self->_cdxSessions;
  if (cdxSessions)

  self->_cdxSessions = (NSMutableDictionary *)a4;
  v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(&self->super._pid + 1));
  objc_msgSend(*(id *)&self->_wakeTime, "setObject:forKeyedSubscript:", v10, self->_cdxSessions);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_preblobToPIDMap, "setObject:forKeyedSubscript:", self->_cdxSessions, v10);
  if (self->_preblob)
  {
    v15 = bswap32(*(&self->super._pid + 1));
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v15, 4);
    objc_msgSend(v11, "appendData:", self->_cdxSessions);
    TimingLog(3, 0, (uint64_t)"Got local connection data - passing data to app");
    ((void (*)(void))self->_preblob[2].super.isa)();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v11, "length");
        *(_DWORD *)buf = 136316162;
        v17 = v12;
        v18 = 2080;
        v19 = "-[GKConnectionInternal CDXClient:preblob:]";
        v20 = 1024;
        v21 = 1303;
        v22 = 2048;
        v23 = a3;
        v24 = 2048;
        v25 = v14;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CDXClient=%p Got local connection data size=%lu", buf, 0x30u);
      }
    }

    self->_preblob = 0;
  }
  pthread_cond_signal((pthread_cond_t *)&self->_xPreblobFetch.__opaque[48]);
  pthread_mutex_unlock((pthread_mutex_t *)&self->_preblobCallbackCancelTime);
}

- (id)extractBlobUsingData:(id)a3 withSourcePID:(unsigned int)a4 destPID:(unsigned int)a5
{
  unsigned __int16 *v7;
  unint64_t v8;
  unsigned __int16 *v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v22;
  id v23;
  char *v24;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unsigned int v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  v23 = a3;
  v8 = (unint64_t)v7 + objc_msgSend(a3, "length");
  v24 = (char *)v7;
  while ((unint64_t)v7 < v8)
  {
    v9 = v7 + 5;
    if ((unint64_t)(v7 + 5) > v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_16;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v19 = objc_msgSend(v23, "length");
      *(_DWORD *)buf = 136316418;
      v27 = v17;
      v28 = 2080;
      v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
      v30 = 1024;
      v31 = 1340;
      v32 = 1024;
      v33 = v19;
      v34 = 1024;
      v35 = (_DWORD)v7 - (_DWORD)v24;
      v36 = 1024;
      v37 = 10;
      v20 = " [%s] %s:%d Unable to read blob header (total=%d, offset=%d, headerLength=%d)";
      goto LABEL_20;
    }
    v10 = bswap32(*v7) >> 16;
    v11 = (unsigned __int16 *)((char *)v7 + v10);
    if ((unint64_t)v7 + v10 > v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_16;
      v21 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v22 = objc_msgSend(v23, "length");
      *(_DWORD *)buf = 136316418;
      v27 = v21;
      v28 = 2080;
      v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
      v30 = 1024;
      v31 = 1347;
      v32 = 1024;
      v33 = v22;
      v34 = 1024;
      v35 = (_DWORD)v7 - (_DWORD)v24;
      v36 = 1024;
      v37 = v10;
      v20 = " [%s] %s:%d GKConnection: bad blobs? (total=%d, offset=%d, blobLength=%d)";
LABEL_20:
      _os_log_error_impl(&dword_215C5C000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0x2Eu);
LABEL_16:
      reportingGKLog();
      return 0;
    }
    v12 = bswap32(*(_DWORD *)(v7 + 1));
    v13 = bswap32(*(_DWORD *)(v7 + 3));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v27 = v14;
        v28 = 2080;
        v29 = "-[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:]";
        v30 = 1024;
        v31 = 1357;
        v32 = 1024;
        v33 = (_DWORD)v9 - (_DWORD)v24;
        v34 = 1024;
        v35 = v10;
        v36 = 1024;
        v37 = v12;
        v38 = 1024;
        v39 = v13;
        _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection:receivedData @%d (+%d): dstPID(%u), srcPID(%u)", buf, 0x34u);
      }
    }
    v7 = v11;
    if (v12 == a5)
    {
      v7 = v11;
      if (v13 == a4)
        return (id)objc_msgSend(v23, "subdataWithRange:", (char *)v9 - v24, v10 - 10);
    }
  }
  return 0;
}

- (void)CDXClientSession:(id)a3 receivedData:(id)a4 from:(int64_t)a5
{
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[8];
  char v32;
  _QWORD block[8];
  char v34;
  unint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v37 = v9;
      v38 = 2080;
      v39 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
      v40 = 1024;
      v41 = 1379;
      v42 = 1024;
      v43 = objc_msgSend(a4, "length");
      v44 = 1024;
      v45 = a5;
      _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection:receivedData(%d):from=%d", buf, 0x28u);
    }
  }
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](-[GKConnectionInternal cdxSessions](self, "cdxSessions"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "ticket"), "valueForKey:", CFSTR("CDXTicketSID")));
  if (v11)
  {
    v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("connectionPIDList")), "objectAtIndex:", a5), "unsignedLongValue");
    v13 = -[GKConnectionInternal extractBlobUsingData:withSourcePID:destPID:](self, "extractBlobUsingData:withSourcePID:destPID:", a4, v12, *(&self->super._pid + 1));
    if (v13)
    {
      v14 = v13;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v37 = v15;
          v38 = 2080;
          v39 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
          v40 = 1024;
          v41 = 1395;
          v42 = 1024;
          v43 = v12;
          _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d starting-ice.%d", buf, 0x22u);
        }
      }
      TimingLog(3, 0, (uint64_t)"CDX done - starting ICE");
      perfTimerStop();
      perfTimerStart();
      reportingGKLog();
      if ((GCKSessionEstablishConnection((uint64_t)self->_pidGUID, v12, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length")) & 0x80000000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[GKConnectionInternal CDXClientSession:receivedData:from:].cold.1();
        }
        reportingGKLog();
      }
      else
      {
        v35 = 0xAAAAAAAAAAAAAAAALL;
        if (-[GKConnectionInternal convertPeerID:toParticipantID:](self, "convertPeerID:toParticipantID:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v12), &v35))
        {
          pthread_mutex_lock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
          v17 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayUpdateInfoMap, "objectForKeyedSubscript:", v35);
          if (v17)
          {
            v18 = v17;
            if ((objc_msgSend(v17, "isEqual:", objc_msgSend(MEMORY[0x24BDBCEF8], "null")) & 1) == 0)
            {
              v19 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("participantConnectionData"));
              v20 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("relayInfo"));
              v21 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("didInitiate")), "BOOLValue");
              v22 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke;
              block[3] = &unk_24D4666E0;
              block[4] = self;
              block[5] = v35;
              block[6] = v19;
              block[7] = v20;
              v34 = v21;
              dispatch_async(v22, block);
            }
          }
          v23 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToRelayUpdateInfoMap, "setObject:forKeyedSubscript:", v23, v35);
          v24 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_initRelayQueue, "objectForKeyedSubscript:", v35);
          if (v24)
          {
            v25 = v24;
            if ((objc_msgSend(v24, "isEqual:", objc_msgSend(MEMORY[0x24BDBCEF8], "null")) & 1) == 0)
            {
              v26 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("participantConnectionData"));
              v27 = objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("relayInfo"));
              v28 = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("didInitiate")), "BOOLValue");
              v29 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
              v31[0] = MEMORY[0x24BDAC760];
              v31[1] = 3221225472;
              v31[2] = __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke_2;
              v31[3] = &unk_24D4666E0;
              v31[4] = self;
              v31[5] = v35;
              v31[6] = v26;
              v31[7] = v27;
              v32 = v28;
              dispatch_async(v29, v31);
            }
          }
          v30 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_initRelayQueue, "setObject:forKeyedSubscript:", v30, v35);
          pthread_mutex_unlock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
        }
      }
    }
  }
}

uint64_t __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

uint64_t __59__GKConnectionInternal_CDXClientSession_receivedData_from___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalUpdateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

- (BOOL)convertParticipantID:(id)a3 toPeerID:(id *)a4
{
  NSMutableArray *allowRelayPIDList;
  void *v8;
  uint64_t v9;
  id v10;

  allowRelayPIDList = self->_allowRelayPIDList;
  objc_sync_enter(allowRelayPIDList);
  v8 = (void *)-[NSMutableArray allKeysForObject:](self->_allowRelayPIDList, "allKeysForObject:", a3);
  v9 = objc_msgSend(v8, "count");
  if (v9)
    v10 = (id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  else
    v10 = 0;
  *a4 = v10;
  objc_sync_exit(allowRelayPIDList);
  return v9 != 0;
}

- (BOOL)convertPeerID:(id)a3 toParticipantID:(id *)a4
{
  NSMutableArray *allowRelayPIDList;
  void *v8;
  void *v9;

  allowRelayPIDList = self->_allowRelayPIDList;
  objc_sync_enter(allowRelayPIDList);
  v8 = (void *)-[NSMutableArray objectForKeyedSubscript:](self->_allowRelayPIDList, "objectForKeyedSubscript:", a3);
  v9 = v8;
  if (v8)
    *a4 = v8;
  objc_sync_exit(allowRelayPIDList);
  return v9 != 0;
}

- (void)setParticipantID:(id)a3 forPeerID:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id v22;
  NSMutableArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  const char *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = -[NSMutableArray objectForKeyedSubscript:](self->_allowRelayPIDList, "objectForKeyedSubscript:", a4);
  if (a3)
  {
    v21 = (void *)v7;
    obj = self->_allowRelayPIDList;
    objc_sync_enter(obj);
    v8 = (void *)-[NSMutableArray allKeysForObject:](self->_allowRelayPIDList, "allKeysForObject:", a3);
    v22 = a3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (v12 && (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "isEqualToString:", a4) & 1) == 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v15 = objc_msgSend(v12, "UTF8String");
                *(_DWORD *)buf = 136315906;
                v29 = v13;
                v30 = 2080;
                v31 = "-[GKConnectionInternal setParticipantID:forPeerID:]";
                v32 = 1024;
                v33 = 1493;
                v34 = 2080;
                v35 = v15;
                _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection: removeObjectForKey(forPeerID)[%s]", buf, 0x26u);
              }
            }
            -[NSMutableArray removeObjectForKey:](self->_allowRelayPIDList, "removeObjectForKey:", v12);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
      }
      while (v9);
    }
    objc_sync_exit(obj);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v22, "UTF8String");
        v19 = objc_msgSend(a4, "UTF8String");
        if (v21)
          v20 = (const char *)objc_msgSend(v21, "UTF8String");
        else
          v20 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v29 = v16;
        v30 = 2080;
        v31 = "-[GKConnectionInternal setParticipantID:forPeerID:]";
        v32 = 1024;
        v33 = 1499;
        v34 = 2080;
        v35 = v18;
        v36 = 2080;
        v37 = v19;
        v38 = 2080;
        v39 = v20;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKConnection: setParticipantID:[%s] forPeerID[%s] (old participantID:[%s])", buf, 0x3Au);
      }
    }
    -[NSMutableArray setObject:forKeyedSubscript:](self->_allowRelayPIDList, "setObject:forKeyedSubscript:", v22, a4);
  }
}

- (id)createInitiateRelayDictionaryForParticipant:(id)a3 remotePeerID:(id)a4
{
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *Name;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315906;
    v17 = v9;
    v18 = 2080;
    v19 = "-[GKConnectionInternal createInitiateRelayDictionaryForParticipant:remotePeerID:]";
    v20 = 1024;
    v21 = 1510;
    v22 = 2080;
    Name = sel_getName(a2);
    v11 = " [%s] %s:%d **************************** %s: relay not enabled";
    v12 = v10;
    v13 = 38;
    goto LABEL_10;
  }
  v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_preblobToPIDMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a4, "intValue")));
  if (v7)
    return (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", self->_cdxSessions, *(_QWORD *)off_24D4656F8, +[GKConnection externalAddressForCDXSelfConnectionData:](GKConnectionInternal, "externalAddressForCDXSelfConnectionData:", self->_cdxSessions), *(_QWORD *)off_24D465700, &unk_24D4700E8, *(_QWORD *)off_24D465708, v7, *(_QWORD *)off_24D4656D0, +[GKConnection externalAddressForCDXSelfConnectionData:](GKConnectionInternal, "externalAddressForCDXSelfConnectionData:", v7), *(_QWORD *)off_24D4656D8, &unk_24D4700E8,
                 *(_QWORD *)off_24D4656E0,
                 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = v14;
      v18 = 2080;
      v19 = "-[GKConnectionInternal createInitiateRelayDictionaryForParticipant:remotePeerID:]";
      v20 = 1024;
      v21 = 1525;
      v22 = 2080;
      Name = sel_getName(a2);
      v24 = 1024;
      v25 = objc_msgSend(a4, "intValue");
      v11 = " [%s] %s:%d **************************** %s: no preblob found for %d";
      v12 = v15;
      v13 = 44;
LABEL_10:
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
  return 0;
}

- (id)newRelayUpdateDictionaryForParticipant:(id)a3 didInitiate:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  unint64_t v10;

  if (!+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled", a3, a4))
    return 0;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  if (!-[GKConnectionInternal convertParticipantID:toPeerID:](self, "convertParticipantID:toPeerID:", a3, &v10))
    return 0;
  v6 = *(void **)&self->_xRelay.__opaque[48];
  objc_sync_enter(v6);
  v7 = (id)objc_msgSend(*(id *)&self->_xRelay.__opaque[48], "objectForKeyedSubscript:", v10);
  objc_sync_exit(v6);
  if (!v7)
    return 0;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24D470100, *(_QWORD *)off_24D465738);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayInitiateInfoMap, "objectForKeyedSubscript:", objc_msgSend(CFSTR(">"), "stringByAppendingString:", v10)), *(_QWORD *)off_24D4656C0);
  return v8;
}

- (void)doRelayCheckForRemotePeerID:(id)a3
{
  NSMutableDictionary *pidToRelayConnectionDataMap;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int ErrorLogLevelForModule;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *Name;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  pidToRelayConnectionDataMap = self->_pidToRelayConnectionDataMap;
  objc_sync_enter(pidToRelayConnectionDataMap);
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayConnectionDataMap, "objectForKeyedSubscript:", objc_msgSend(CFSTR(">"), "stringByAppendingString:", a3));
  v8 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayConnectionDataMap, "objectForKeyedSubscript:", objc_msgSend(CFSTR("<"), "stringByAppendingString:", a3));
  objc_sync_exit(pidToRelayConnectionDataMap);
  if (v8)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136316674;
        v25 = v10;
        v26 = 2080;
        v27 = "-[GKConnectionInternal doRelayCheckForRemotePeerID:]";
        v28 = 1024;
        v29 = 1622;
        v30 = 2080;
        Name = sel_getName(a2);
        v32 = 2080;
        v33 = objc_msgSend(a3, "UTF8String");
        v34 = 2048;
        v35 = v8;
        v36 = 2048;
        v37 = v7;
        v12 = " [%s] %s:%d %s (remote:%s) - remoteRelayUpdateInfo[%p] localRelayUpdateInfo[%p]";
        v13 = v11;
        v14 = 68;
LABEL_15:
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, v14);
      }
    }
  }
  else
  {
    v15 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)off_24D4656C0);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315906;
        v25 = v17;
        v26 = 2080;
        v27 = "-[GKConnectionInternal doRelayCheckForRemotePeerID:]";
        v28 = 1024;
        v29 = 1605;
        v30 = 2080;
        Name = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before GCKSessionEstablishConnectionWithRelayInfo: remote dict:%s", (uint8_t *)&v24, 0x26u);
      }
    }
    v19 = GCKSessionEstablishConnectionWithRelayInfo((uint64_t)self->_pidGUID, objc_msgSend(a3, "intValue"), objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), (uint64_t)v8);
    perfTimerStop();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v22 = sel_getName(a2);
        v23 = objc_msgSend(a3, "UTF8String");
        v24 = 136316418;
        v25 = v20;
        v26 = 2080;
        v27 = "-[GKConnectionInternal doRelayCheckForRemotePeerID:]";
        v28 = 1024;
        v29 = 1620;
        v30 = 2080;
        Name = v22;
        v32 = 2080;
        v33 = v23;
        v34 = 1024;
        LODWORD(v35) = v19;
        v12 = " [%s] %s:%d %s (remote:%s) - GCKSessionEstablishConnectionWithRelayInfo returns (%d)";
        v13 = v21;
        v14 = 54;
        goto LABEL_15;
      }
    }
  }
}

- (void)internalInitiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  int ErrorLogLevelForModule;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *global_queue;
  _QWORD block[9];
  BOOL v38;
  in_addr_t v39;
  id v40;
  _BYTE buf[22];
  __int16 v42;
  int v43;
  __int16 v44;
  const char *Name;
  __int16 v46;
  _BYTE v47[10];
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  if (+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled", a3, a4))
  {
    v40 = (id)0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayIn"
                              "fo:didInitiate:]";
        v42 = 1024;
        v43 = 1635;
        v44 = 2080;
        Name = sel_getName(a2);
        v46 = 2080;
        *(_QWORD *)v47 = objc_msgSend(a3, "UTF8String");
        _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - remote participant[%s]", buf, 0x30u);
      }
    }
    if (-[GKConnectionInternal convertParticipantID:toPeerID:](self, "convertParticipantID:toPeerID:", a3, &v40))
    {
      perfTimerStart();
      v13 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKSTargetPeerID")) == 0;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v13)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v23 = sel_getName(a2);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRel"
                                  "ayInfo:didInitiate:]";
            v42 = 1024;
            v43 = 1647;
            v44 = 2080;
            Name = v23;
            _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary: no value", buf, 0x26u);
          }
        }
      }
      else
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v17 = sel_getName(a2);
            v18 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("GKSTargetPeerID")), "intValue");
            v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("GKSOriginPeerID")), "intValue");
            v20 = *(&self->super._pid + 1);
            *(_DWORD *)buf = 136316674;
            *(_QWORD *)&buf[4] = v15;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRel"
                                  "ayInfo:didInitiate:]";
            v42 = 1024;
            v43 = 1641;
            v44 = 2080;
            Name = v17;
            v46 = 1024;
            *(_DWORD *)v47 = v18;
            *(_WORD *)&v47[4] = 1024;
            *(_DWORD *)&v47[6] = v19;
            v48 = 1024;
            v49 = v20;
            _os_log_impl(&dword_215C5C000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary (%d/%d == %d ?)", buf, 0x38u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKSTargetPeerID")), "unsignedIntValue") != *(&self->super._pid + 1)&& objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKSOriginPeerID")), "unsignedIntValue") != *(&self->super._pid + 1))
        {
          return;
        }
      }
      v24 = *(void **)&self->_xRelay.__opaque[48];
      objc_sync_enter(v24);
      v25 = objc_msgSend(*(id *)&self->_xRelay.__opaque[48], "objectForKeyedSubscript:", v40);
      objc_sync_exit(v24);
      if (v25)
        return;
      v26 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a5);
      v39 = inet_addr("72.247.44.23");
      v27 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v39, 4);
      v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("GeckoFixRelayInfo")), "BOOLValue");
      v29 = *(_QWORD *)off_24D4656E8;
      if (v28)
      {
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *(_QWORD *)off_24D4656E8);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24D470118, *(_QWORD *)off_24D4656F0);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, *(_QWORD *)off_24D465710);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24D470118, *(_QWORD *)off_24D465720);
        v30 = *(_QWORD *)off_24D465728;
      }
      else
      {
        if (!objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D4656E8))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v29);
        v31 = *(_QWORD *)off_24D4656F0;
        if (!objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D4656F0))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24D470118, v31);
        v32 = *(_QWORD *)off_24D465710;
        if (!objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D465710))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v32);
        v33 = *(_QWORD *)off_24D465720;
        if (!objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D465720))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24D470118, v33);
        v30 = *(_QWORD *)off_24D465728;
        if (objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D465728))
          goto LABEL_30;
      }
      qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 20), v30);
      if (v28)
      {
        objc_msgSend(v26, "removeObjectForKey:", *(_QWORD *)off_24D4656C8);
        v34 = *(_QWORD *)off_24D465730;
        goto LABEL_31;
      }
LABEL_30:
      v34 = *(_QWORD *)off_24D465730;
      if (objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)off_24D465730))
      {
LABEL_32:
        v35 = *(void **)&self->_xRelay.__opaque[48];
        objc_sync_enter(v35);
        objc_msgSend(*(id *)&self->_xRelay.__opaque[48], "setObject:forKeyedSubscript:", v26, v40);
        objc_sync_exit(v35);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
        block[3] = &unk_24D466708;
        block[4] = self;
        block[5] = v26;
        block[7] = a3;
        block[8] = a2;
        block[6] = v40;
        v38 = a6;
        dispatch_async(global_queue, block);
        return;
      }
LABEL_31:
      *(_QWORD *)&buf[4] = 0;
      *(_DWORD *)buf = bswap32(objc_msgSend(v40, "intValue") ^ *(&self->super._pid + 1));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 8), v34);
      goto LABEL_32;
    }
  }
}

void __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *Name;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int updated;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v23 = 1350;
  perfTimerStart();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "description"), "UTF8String");
      *(_DWORD *)buf = 136315906;
      v26 = v2;
      v27 = 2080;
      v28 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
      v29 = 1024;
      v30 = 1721;
      v31 = 2080;
      v32 = v4;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d before GCKSessionPrepareConnectionWithRelayInfo: dict:%s", buf, 0x26u);
    }
  }
  v5 = GCKSessionPrepareConnectionWithRelayInfo(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), objc_msgSend(*(id *)(a1 + 48), "intValue"), (uint64_t)&v24, (uint64_t)&v23, *(_QWORD *)(a1 + 40), 0);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v5 < 0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke_cold_1();
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        v26 = v7;
        v27 = 2080;
        v28 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
        v29 = 1024;
        v30 = 1736;
        v31 = 2080;
        v32 = v9;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d after GCKSessionPrepareConnectionWithRelayInfo: dict:%s", buf, 0x26u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        Name = sel_getName(*(SEL *)(a1 + 64));
        v13 = objc_msgSend(*(id *)(a1 + 48), "UTF8String");
        *(_DWORD *)buf = 136316674;
        v26 = v10;
        v27 = 2080;
        v28 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
        v29 = 1024;
        v30 = 1738;
        v31 = 2080;
        v32 = (uint64_t)Name;
        v33 = 2080;
        v34 = v13;
        v35 = 1024;
        v36 = v5;
        v37 = 1024;
        v38 = v23;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s (remote:%s) - GCKSessionPrepareConnectionWithRelayInfo returns (%08X), data(%d)", buf, 0x3Cu);
      }
    }
    perfTimerStop();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v24, v23), objc_msgSend(CFSTR(">"), "stringByAppendingString:", *(_QWORD *)(a1 + 48)));
    free(v24);
    v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "newRelayUpdateDictionaryForParticipant:didInitiate:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
    v15 = *(_QWORD *)off_24D465718;
    v22 = bswap32(*(_DWORD *)objc_msgSend((id)objc_msgSend(v14, "objectForKey:", *(_QWORD *)off_24D465718), "bytes"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v22, 4), v15);
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
    objc_sync_enter(v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setObject:forKeyedSubscript:", v14, objc_msgSend(CFSTR(">"), "stringByAppendingString:", *(_QWORD *)(a1 + 48)));
    objc_sync_exit(v16);
    updated = GCKSessionUpdateRelay(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), objc_msgSend(*(id *)(a1 + 48), "intValue"), v14);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v20 = sel_getName(*(SEL *)(a1 + 64));
        v21 = objc_msgSend(*(id *)(a1 + 48), "UTF8String");
        *(_DWORD *)buf = 136316418;
        v26 = v18;
        v27 = 2080;
        v28 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
        v29 = 1024;
        v30 = 1766;
        v31 = 2080;
        v32 = (uint64_t)v20;
        v33 = 2080;
        v34 = v21;
        v35 = 1024;
        v36 = updated;
        _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s (remote:%s) - GCKSessionUpdateRelay returns (%d)", buf, 0x36u);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "doRelayCheckForRemotePeerID:", *(_QWORD *)(a1 + 48));
  }
}

- (void)initiateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  _BOOL8 v6;
  NSMutableDictionary **p_pidToConnectTimeoutSource;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD block[8];
  BOOL v17;

  if (a5)
  {
    v6 = a6;
    p_pidToConnectTimeoutSource = &self->_pidToConnectTimeoutSource;
    pthread_mutex_lock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", a5, 1);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_pidToRelayUpdateInfoMap, "objectForKeyedSubscript:", a3))
    {
      v13 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __98__GKConnectionInternal_initiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
      block[3] = &unk_24D4666E0;
      block[4] = self;
      block[5] = a3;
      block[6] = a4;
      block[7] = v12;
      v17 = v6;
      dispatch_async(v13, block);
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v15 = v14;
      if (a4)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", a4, CFSTR("participantConnectionData"));
      if (v12)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("relayInfo"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6), CFSTR("didInitiate"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToRelayUpdateInfoMap, "setObject:forKeyedSubscript:", v15, a3);
    }
    pthread_mutex_unlock((pthread_mutex_t *)p_pidToConnectTimeoutSource);
  }
}

uint64_t __98__GKConnectionInternal_initiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

- (void)internalUpdateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  int ErrorLogLevelForModule;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  int v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *pidToRelayConnectionDataMap;
  NSObject *global_queue;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[6];
  char v30;
  int v31;
  unint64_t v32;
  _BYTE buf[22];
  __int16 v34;
  int v35;
  __int16 v36;
  const char *Name;
  __int16 v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  if (+[GKConnection isRelayEnabled](GKConnection, "isRelayEnabled", a3, a4, a5, a6))
  {
    v32 = 0xAAAAAAAAAAAAAAAALL;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]";
        v34 = 1024;
        v35 = 1809;
        v36 = 2080;
        Name = sel_getName(a2);
        v38 = 2080;
        v39[0] = objc_msgSend(a3, "UTF8String");
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - remote[%s]", buf, 0x30u);
      }
    }
    if (-[GKConnectionInternal convertParticipantID:toPeerID:](self, "convertParticipantID:toPeerID:", a3, &v32))
    {
      v12 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKSTargetPeerID")) == 0;
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (!v12)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
          {
            v16 = sel_getName(a2);
            v17 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("GKSTargetPeerID")), "intValue");
            v18 = *(&self->super._pid + 1);
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelay"
                                  "Info:didInitiate:]";
            v34 = 1024;
            v35 = 1815;
            v36 = 2080;
            Name = v16;
            v38 = 1024;
            LODWORD(v39[0]) = v17;
            WORD2(v39[0]) = 1024;
            *(_DWORD *)((char *)v39 + 6) = v18;
            _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via dictionary (%d == %d ?)", buf, 0x32u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("GKSTargetPeerID")), "unsignedIntValue") != *(&self->super._pid + 1))return;
LABEL_16:
        v23 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a5);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("GeckoFixRelayInfo")), "BOOLValue") & 1) != 0)
        {
          qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
          objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 20), *(_QWORD *)off_24D465728);
          objc_msgSend(v23, "removeObjectForKey:", *(_QWORD *)off_24D4656C8);
        }
        else
        {
          v24 = *(_QWORD *)off_24D465728;
          if (!objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)off_24D465728))
          {
            qmemcpy(buf, "ABCDEFGHIJABCDEFGHIJ", 20);
            objc_msgSend(v23, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 20), v24);
          }
        }
        pidToRelayConnectionDataMap = self->_pidToRelayConnectionDataMap;
        objc_sync_enter(pidToRelayConnectionDataMap);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pidToRelayConnectionDataMap, "setObject:forKeyedSubscript:", v23, objc_msgSend(CFSTR("<"), "stringByAppendingString:", v32));
        objc_sync_exit(pidToRelayConnectionDataMap);
        global_queue = dispatch_get_global_queue(0, 0);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __104__GKConnectionInternal_internalUpdateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
        v29[3] = &unk_24D4661B8;
        v29[4] = self;
        v29[5] = v32;
        dispatch_async(global_queue, v29);
        return;
      }
      if (ErrorLogLevelForModule >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          v21 = sel_getName(a2);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayIn"
                                "fo:didInitiate:]";
          v34 = 1024;
          v35 = 1820;
          v36 = 2080;
          Name = v21;
          _os_log_impl(&dword_215C5C000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s - checking intended target via data", buf, 0x26u);
        }
      }
      v22 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *(_QWORD *)off_24D4656C0);
      v31 = -1431655766;
      v30 = 0;
      objc_msgSend(v22, "bytes");
      objc_msgSend(v22, "length");
      ICEGetCallInfoForConnectionData();
      if (*(&self->super._pid + 1) == -1431655766)
        goto LABEL_16;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[GKConnectionInternal internalUpdateRelayWithParticipant:withConnectionData:withRelayIn"
                                "fo:didInitiate:]";
          v34 = 1024;
          v35 = 1826;
          _os_log_impl(&dword_215C5C000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d this update not for me", buf, 0x1Cu);
        }
      }
    }
  }
}

uint64_t __104__GKConnectionInternal_internalUpdateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doRelayCheckForRemotePeerID:", *(_QWORD *)(a1 + 40));
}

- (void)updateRelayWithParticipant:(id)a3 withConnectionData:(id)a4 withRelayInfo:(id)a5 didInitiate:(BOOL)a6
{
  _BOOL8 v6;
  NSMutableDictionary **p_pidToConnectTimeoutSource;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD block[8];
  BOOL v17;

  if (a5)
  {
    v6 = a6;
    p_pidToConnectTimeoutSource = &self->_pidToConnectTimeoutSource;
    pthread_mutex_lock((pthread_mutex_t *)&self->_pidToConnectTimeoutSource);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", a5, 1);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_initRelayQueue, "objectForKeyedSubscript:", a3))
    {
      v13 = -[GKConnectionInternal asyncWorkQueue](self, "asyncWorkQueue");
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __96__GKConnectionInternal_updateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke;
      block[3] = &unk_24D4666E0;
      block[4] = self;
      block[5] = a3;
      block[6] = a4;
      block[7] = v12;
      v17 = v6;
      dispatch_async(v13, block);
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v15 = v14;
      if (a4)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", a4, CFSTR("participantConnectionData"));
      if (v12)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("relayInfo"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6), CFSTR("didInitiate"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_initRelayQueue, "setObject:forKeyedSubscript:", v15, a3);
    }
    pthread_mutex_unlock((pthread_mutex_t *)p_pidToConnectTimeoutSource);
  }
}

uint64_t __96__GKConnectionInternal_updateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalUpdateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
}

- (void)cancelConnectParticipant:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  _BYTE v8[12];
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v7 = "<nil>";
      *(_DWORD *)v8 = 136315906;
      *(_QWORD *)&v8[4] = v5;
      v9 = 2080;
      v10 = "-[GKConnectionInternal cancelConnectParticipant:]";
      v11 = 1024;
      v12 = 1887;
      v13 = 2080;
      v14 = v7;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cancel-connect-participant.%s", v8, 0x26u);
    }
  }
  *(_QWORD *)v8 = 0xAAAAAAAAAAAAAAAALL;
  if (-[GKConnectionInternal convertParticipantID:toPeerID:](self, "convertParticipantID:toPeerID:", a3, v8))
  {
    if (!GCKSessionIsParticipantConnected((uint64_t)self->_pidGUID, objc_msgSend(*(id *)v8, "intValue"), 1))GCKSessionDisposeConnection((uint64_t)self->_pidGUID, objc_msgSend(*(id *)v8, "intValue"));
  }
}

- (id)networkStatisticsDictionaryForGCKStats:(void *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  unsigned int *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[10];
  _QWORD v41[10];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (void *)-[NSMutableArray allKeys](self->_allowRelayPIDList, "allKeys");
  v31 = (id)-[NSMutableArray allKeys](self->_allowRelayPIDList, "allKeys");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v28 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v29 = v6;
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v6);
        v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v30 = v8;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("GKSStatsLinks"));
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, v7);
        if (a3)
        {
          v10 = (unsigned int *)a3;
          do
          {
            v11 = *v10;
            if (v11 == objc_msgSend(v7, "intValue"))
            {
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              v12 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v33;
                do
                {
                  v15 = 0;
                  do
                  {
                    if (*(_QWORD *)v33 != v14)
                      objc_enumerationMutation(v31);
                    v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
                    v17 = a3;
                    while (1)
                    {
                      v18 = v10[17];
                      if (v18 == objc_msgSend(v16, "intValue")
                        && (objc_msgSend(v7, "isEqual:", v16) & 1) == 0)
                      {
                        break;
                      }
                      v17 = (_QWORD *)v17[18];
                      if (!v17)
                        goto LABEL_20;
                    }
                    v40[0] = CFSTR("GKSStatsUpTime");
                    LODWORD(v19) = v10[10];
                    v41[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
                    v40[1] = CFSTR("GKSStatsRecvRate");
                    LODWORD(v20) = v10[11];
                    v41[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
                    v40[2] = CFSTR("GKSStatsSendRate");
                    LODWORD(v21) = v10[12];
                    v41[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
                    v40[3] = CFSTR("GKSStatsRecvPLR");
                    LODWORD(v22) = v10[13];
                    v41[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v22);
                    v40[4] = CFSTR("GKSStatsSendPLR");
                    LODWORD(v23) = v10[14];
                    v41[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
                    v40[5] = CFSTR("GKSStatsRecvBWE");
                    v41[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10[8]);
                    v40[6] = CFSTR("GKSStatsSendBWE");
                    v41[6] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10[9]);
                    v40[7] = CFSTR("GKSStatsRTT");
                    v41[7] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10[3]);
                    v40[8] = CFSTR("GKSStatsBytesReceived");
                    v41[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)v10 + 2));
                    v40[9] = CFSTR("GKSStatsBytesSent");
                    v41[9] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)v10 + 3));
                    objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 10), v16);
LABEL_20:
                    ++v15;
                  }
                  while (v15 != v13);
                  v13 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
                }
                while (v13);
              }
            }
            v10 = (unsigned int *)*((_QWORD *)v10 + 18);
          }
          while (v10);
        }
        v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v28);
  }
  return v27;
}

- (id)networkStatistics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _BYTE v30[128];
  _QWORD v31[2];
  _QWORD v32[2];
  const __CFString *v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)-[NSMutableArray allKeys](self->_allowRelayPIDList, "allKeys");
  v4 = (void *)-[NSMutableArray allKeys](self->_allowRelayPIDList, "allKeys");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
  if (v18)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v3);
        v19 = v5;
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v5);
        v31[0] = CFSTR("GKSStatsRecvRate");
        v31[1] = CFSTR("GKSStatsSendRate");
        v32[0] = &unk_24D470178;
        v32[1] = &unk_24D470178;
        v33 = CFSTR("fake0");
        v34 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("GKSStatsInterfaces"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("GKSStatsLinks"));
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, v6);
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v4);
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              if ((objc_msgSend(v6, "isEqual:", v14) & 1) == 0)
              {
                v28[0] = CFSTR("GKSStatsUpTime");
                v28[1] = CFSTR("GKSStatsBytesReceived");
                v29[0] = &unk_24D470188;
                v29[1] = &unk_24D470100;
                v28[2] = CFSTR("GKSStatsBytesSent");
                v28[3] = CFSTR("GKSStatsRecvRate");
                v29[2] = &unk_24D470100;
                v29[3] = &unk_24D470198;
                v28[4] = CFSTR("GKSStatsSendRate");
                v29[4] = &unk_24D470198;
                objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 5), v14);
              }
            }
            v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          }
          while (v11);
        }
        v5 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    }
    while (v18);
  }
  return v17;
}

- (BOOL)localGamingCheckEstablishConnection:(id)a3 connectionData:(id)a4
{
  int v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  int v17;
  int ErrorLogLevelForModule;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  _BYTE v26[24];
  __int128 v27;
  int v28;
  __int16 v29;
  unsigned int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "unsignedLongValue");
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
      *(_DWORD *)v26 = 136316162;
      *(_QWORD *)&v26[4] = v8;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 2003;
      WORD2(v27) = 2080;
      *(_QWORD *)((char *)&v27 + 6) = v10;
      HIWORD(v27) = 1024;
      v28 = objc_msgSend(a4, "length");
      _os_log_impl(&dword_215C5C000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteConnectionData: [%s], total size=%u", v26, 0x2Cu);
    }
  }
  if ((unint64_t)objc_msgSend(a4, "length") < 5)
    return 0;
  v11 = bswap32(*(_DWORD *)objc_msgSend(a4, "bytes"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v14 = "<nil>";
      v15 = objc_msgSend(a4, "length");
      *(_DWORD *)v26 = 136316418;
      *(_QWORD *)&v26[4] = v12;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 2007;
      WORD2(v27) = 2080;
      *(_QWORD *)((char *)&v27 + 6) = v14;
      HIWORD(v27) = 1024;
      v28 = v15;
      v29 = 1024;
      v30 = v11;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteConnectionData: [%s], total size=%u (expect %u)", v26, 0x32u);
    }
  }
  if (objc_msgSend(a4, "length") - 4 < (unint64_t)v11)
    return 0;
  TimingLog(3, 0, (uint64_t)"local CDX done - starting ICE");
  v17 = GCKSessionEstablishConnection((uint64_t)self->_pidGUID, v7, objc_msgSend(a4, "bytes") + 4, objc_msgSend(a4, "length") - 4);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v17 < 0)
  {
    if (ErrorLogLevelForModule < 7)
      goto LABEL_24;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v26 = 136316162;
    *(_QWORD *)&v26[4] = v24;
    *(_WORD *)&v26[12] = 2080;
    *(_QWORD *)&v26[14] = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = 2017;
    WORD2(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 6) = v7;
    WORD5(v27) = 1024;
    HIDWORD(v27) = v17;
    v21 = " [%s] %s:%d GCKSessionEstablishConnection for local peer (%08X) failed (%08X)";
    v22 = v25;
    v23 = 40;
  }
  else
  {
    if (ErrorLogLevelForModule < 7)
      goto LABEL_24;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v26 = 136315906;
    *(_QWORD *)&v26[4] = v19;
    *(_WORD *)&v26[12] = 2080;
    *(_QWORD *)&v26[14] = "-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:]";
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = 2019;
    WORD2(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 6) = v7;
    v21 = " [%s] %s:%d GCKSessionEstablishConnection for local peer (%08X) succeeded";
    v22 = v20;
    v23 = 34;
  }
  _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, v21, v26, v23);
LABEL_24:
  -[NSMutableDictionary removeObject:](self->_localGamingSocketToConnectionDataMap, "removeObject:", a3, *(_OWORD *)v26, *(_QWORD *)&v26[16], v27);
  return 1;
}

- (void)localGamingReceiveDataHandler:(id)a3 data:(id)a4 time:(double)a5 error:(id)a6
{
  void *v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  dispatch_time_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSMutableDictionary *localGamingSocketToConnectionDataMap;
  const char *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  int v39;
  uint64_t v40;
  NSObject *v41;
  _QWORD block[5];
  unsigned int v43;
  signed int v44;
  void *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[26];
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (!a4 || a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_31;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x24BDFDC28];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    if (a6)
      v17 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
    else
      v17 = "<nil>";
    *(_DWORD *)buf = 136315906;
    v47 = v15;
    v48 = 2080;
    v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
    v50 = 1024;
    v51 = 2030;
    v52 = 2080;
    *(_QWORD *)v53 = v17;
    v29 = " [%s] %s:%d localGamingReceiveDataHandler: error=[%s].  Invalidating..";
    v30 = v16;
    v31 = 38;
    goto LABEL_30;
  }
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_localGamingSocketToPIDMap, "objectForKeyedSubscript:", objc_msgSend(a3, "socketName"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v11)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v47 = v13;
        v48 = 2080;
        v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
        v50 = 1024;
        v51 = 2042;
        v52 = 2080;
        *(_QWORD *)v53 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        *(_WORD *)&v53[8] = 2080;
        *(_QWORD *)&v53[10] = objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
        *(_WORD *)&v53[18] = 1024;
        *(_DWORD *)&v53[20] = objc_msgSend(a4, "length");
        *(_WORD *)&v53[24] = 2048;
        v54 = a5;
        _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localGamingReceiveDataHandler: got [%s] (append to [%s]), size=%u, t=%.6lf", buf, 0x40u);
      }
    }
    objc_msgSend(v11, "appendData:", a4);
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v47 = v18;
        v48 = 2080;
        v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
        v50 = 1024;
        v51 = 2038;
        v52 = 2080;
        *(_QWORD *)v53 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        *(_WORD *)&v53[8] = 1024;
        *(_DWORD *)&v53[10] = objc_msgSend(a4, "length");
        *(_WORD *)&v53[14] = 2048;
        *(double *)&v53[16] = a5;
        _os_log_impl(&dword_215C5C000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localGamingReceiveDataHandler: got [%s], size=%u, t=%.6lf", buf, 0x36u);
      }
    }
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_localGamingSocketToPIDMap, "setObject:forKeyedSubscript:", v11, objc_msgSend(a3, "socketName"));
  }
  v20 = (void *)-[OS_dispatch_source objectForKeyedSubscript:](self->_localGamingCDXListenSource, "objectForKeyedSubscript:", objc_msgSend(a3, "socketName"));
  if (v20)
  {
    v21 = (uint64_t)v20;
    objc_msgSend(v20, "unsignedLongValue");
LABEL_18:
    if (-[GKConnectionInternal localGamingCheckEstablishConnection:connectionData:](self, "localGamingCheckEstablishConnection:connectionData:", v21, v11))
    {
      -[OS_dispatch_source removeObjectForKey:](self->_localGamingCDXListenSource, "removeObjectForKey:", objc_msgSend(a3, "socketName"));
      -[NSMutableDictionary removeObjectForKey:](self->_localGamingSocketToPIDMap, "removeObjectForKey:", objc_msgSend(a3, "socketName"));
      v22 = dispatch_time(0, 10000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__GKConnectionInternal_localGamingReceiveDataHandler_data_time_error___block_invoke;
      block[3] = &unk_24D466170;
      block[4] = a3;
      dispatch_after(v22, MEMORY[0x24BDAC9B8], block);
    }
    return;
  }
  if ((unint64_t)objc_msgSend(v11, "length") <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:].cold.1(v23, a4);
    }
    return;
  }
  v24 = bswap32(*(_DWORD *)objc_msgSend(v11, "bytes"));
  v21 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
  -[OS_dispatch_source setObject:forKeyedSubscript:](self->_localGamingCDXListenSource, "setObject:forKeyedSubscript:", v21, objc_msgSend(a3, "socketName"));
  objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", 0, 4, 0, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      localGamingSocketToConnectionDataMap = self->_localGamingSocketToConnectionDataMap;
      if (localGamingSocketToConnectionDataMap)
        v28 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](localGamingSocketToConnectionDataMap, "description"), "UTF8String");
      else
        v28 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v47 = v25;
      v48 = 2080;
      v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
      v50 = 1024;
      v51 = 2064;
      v52 = 1024;
      *(_DWORD *)v53 = v24;
      *(_WORD *)&v53[4] = 2080;
      *(_QWORD *)&v53[6] = v28;
      _os_log_impl(&dword_215C5C000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Checking if peer (%08X) is in prepared set [%s]", buf, 0x2Cu);
    }
  }
  if (!-[NSMutableDictionary containsObject:](self->_localGamingSocketToConnectionDataMap, "containsObject:", v21))
  {
    v45 = 0;
    v44 = 1350;
    TimingLog(3, 0, (uint64_t)"local CDX start\n");
    v34 = GCKSessionPrepareConnectionWithRelayInfo((uint64_t)self->_pidGUID, v24, (uint64_t)&v45, (uint64_t)&v44, 0, 1);
    if ((v34 & 0x80000000) == 0)
    {
      -[NSMutableDictionary addObject:](self->_localGamingSocketToConnectionDataMap, "addObject:", v21);
      v43 = bswap32(v44);
      v35 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithBytes:length:", &v43, 4);
      objc_msgSend(v35, "appendBytes:length:", v45, v44);
      free(v45);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (v35)
            v38 = (const char *)objc_msgSend((id)objc_msgSend(v35, "description"), "UTF8String");
          else
            v38 = "<nil>";
          *(_DWORD *)buf = 136316674;
          v47 = v36;
          v48 = 2080;
          v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
          v50 = 1024;
          v51 = 2090;
          v52 = 2080;
          *(_QWORD *)v53 = v38;
          *(_WORD *)&v53[8] = 1024;
          *(_DWORD *)&v53[10] = v44;
          *(_WORD *)&v53[14] = 1024;
          *(_DWORD *)&v53[16] = v24;
          *(_WORD *)&v53[20] = 1024;
          *(_DWORD *)&v53[22] = v24;
          _os_log_impl(&dword_215C5C000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d after GCKSessionPrepareConnection: [%s], size=%u (remote PID = %u [%08X])", buf, 0x38u);
        }
      }
      objc_msgSend(a3, "sendData:withCompletionHandler:", v35, 0);
      goto LABEL_18;
    }
    v39 = v34;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7
      || (v40 = VRTraceErrorLogLevelToCSTR(),
          v41 = *MEMORY[0x24BDFDC28],
          !os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT)))
    {
LABEL_31:
      objc_msgSend(a3, "invalidate");
      return;
    }
    *(_DWORD *)buf = 136315906;
    v47 = v40;
    v48 = 2080;
    v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
    v50 = 1024;
    v51 = 2080;
    v52 = 1024;
    *(_DWORD *)v53 = v39;
    v29 = " [%s] %s:%d Cannot get candidates (%08X) - cancel localCDX";
    v30 = v41;
    v31 = 34;
LABEL_30:
    _os_log_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v47 = v32;
      v48 = 2080;
      v49 = "-[GKConnectionInternal localGamingReceiveDataHandler:data:time:error:]";
      v50 = 1024;
      v51 = 2066;
      v52 = 1024;
      *(_DWORD *)v53 = v24;
      _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already prepared conenction for peer (%08X) - cancel this localCDX socket", buf, 0x22u);
    }
  }
  objc_msgSend(a3, "invalidate");
  -[OS_dispatch_source removeObjectForKey:](self->_localGamingCDXListenSource, "removeObjectForKey:", objc_msgSend(a3, "socketName"));
  -[NSMutableDictionary removeObjectForKey:](self->_localGamingSocketToPIDMap, "removeObjectForKey:", objc_msgSend(a3, "socketName"));
}

uint64_t __70__GKConnectionInternal_localGamingReceiveDataHandler_data_time_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (BOOL)startListeningForLocalGamingCDX
{
  BOOL result;
  int v4;
  int v5;
  _BYTE *v6;
  os_log_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BYTE *v12;
  os_log_t *v13;
  int v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;
  os_log_t *v18;
  int v19;
  int v20;
  int ErrorLogLevelForModule;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  int updateRelayQueue_high;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  sockaddr v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (HIDWORD(self->_updateRelayQueue) != -1)
    return 1;
  *(_QWORD *)&v44.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v44.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  v4 = socket(2, 1, 6);
  HIDWORD(self->_updateRelayQueue) = v4;
  if (v4 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        -[GKConnectionInternal startListeningForLocalGamingCDX].cold.1();
    }
  }
  else
  {
    v5 = 0;
    *(_QWORD *)&v44.sa_data[6] = 0;
    *(_WORD *)&v44.sa_len = 528;
    *(_DWORD *)&v44.sa_data[2] = 0;
    v6 = (_BYTE *)MEMORY[0x24BDFDC18];
    v7 = (os_log_t *)MEMORY[0x24BDFDC28];
    v8 = 512;
    while (1)
    {
      *(_WORD *)((char *)&self->super.super.isa + v8) = 16470 - v5;
      *(_WORD *)v44.sa_data = bswap32(16470 - v5) >> 16;
      if (bind(HIDWORD(self->_updateRelayQueue), &v44, 0x10u) != -1)
        break;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *v7;
        v11 = *v7;
        if (*v6)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v6;
            v13 = v7;
            v14 = *(unsigned __int16 *)((char *)&self->super.super.isa + v8);
            v15 = *__error();
            *(_DWORD *)buf = 136316162;
            v35 = v9;
            v36 = 2080;
            v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
            v38 = 1024;
            v39 = 2130;
            v40 = 1024;
            v41 = v14;
            v7 = v13;
            v6 = v12;
            v42 = 1024;
            v43 = v15;
            _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bind() to port %u failed for local gaming CDX (%d), retrying...", buf, 0x28u);
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v16 = v8;
          v17 = v6;
          v18 = v7;
          v19 = *(unsigned __int16 *)((char *)&self->super.super.isa + v16);
          v20 = *__error();
          *(_DWORD *)buf = 136316162;
          v35 = v9;
          v36 = 2080;
          v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
          v38 = 1024;
          v39 = 2130;
          v40 = 1024;
          v41 = v19;
          v7 = v18;
          v6 = v17;
          v8 = v16;
          v42 = 1024;
          v43 = v20;
          _os_log_debug_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d bind() to port %u failed for local gaming CDX (%d), retrying...", buf, 0x28u);
        }
      }
      if (++v5 == 10)
      {
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (ErrorLogLevelForModule >= 8)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = v6;
          v24 = v22;
          v25 = *v7;
          v26 = *v7;
          if (*v23)
          {
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = *__error();
              *(_DWORD *)buf = 136315906;
              v35 = v24;
              v36 = 2080;
              v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
              v38 = 1024;
              v39 = 2133;
              v40 = 1024;
              v41 = v27;
              _os_log_impl(&dword_215C5C000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d bind() failed for local gaming CDX (%d), trying ANY...", buf, 0x22u);
            }
          }
          else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            -[GKConnectionInternal startListeningForLocalGamingCDX].cold.6();
          }
        }
        *(_WORD *)v44.sa_data = 0;
        if (bind(HIDWORD(self->_updateRelayQueue), &v44, 0x10u) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              -[GKConnectionInternal startListeningForLocalGamingCDX].cold.2();
          }
          *(_WORD *)((char *)&self->super.super.isa + v8) = 0;
          goto LABEL_44;
        }
        *(_DWORD *)buf = 16;
        if (getsockname(HIDWORD(self->_updateRelayQueue), &v44, (socklen_t *)buf) == -1)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              -[GKConnectionInternal startListeningForLocalGamingCDX].cold.3();
          }
          goto LABEL_44;
        }
        *(_WORD *)((char *)&self->super.super.isa + v8) = bswap32(*(unsigned __int16 *)v44.sa_data) >> 16;
        break;
      }
    }
    if (listen(HIDWORD(self->_updateRelayQueue), 4) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          -[GKConnectionInternal startListeningForLocalGamingCDX].cold.4();
      }
    }
    else
    {
      v28 = dispatch_source_create(MEMORY[0x24BDACA00], SHIDWORD(self->_updateRelayQueue), 0, MEMORY[0x24BDAC9B8]);
      *(_QWORD *)&self->_localGamingCDXPort = v28;
      if (v28)
      {
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke;
        handler[3] = &unk_24D466170;
        handler[4] = self;
        dispatch_source_set_event_handler(v28, handler);
        dispatch_resume(*(dispatch_object_t *)&self->_localGamingCDXPort);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            v31 = *(unsigned __int16 *)((char *)&self->super.super.isa + v8);
            *(_DWORD *)buf = 136315906;
            v35 = v29;
            v36 = 2080;
            v37 = "-[GKConnectionInternal startListeningForLocalGamingCDX]";
            v38 = 1024;
            v39 = 2192;
            v40 = 1024;
            v41 = v31;
            _os_log_impl(&dword_215C5C000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startListeningForLocalGamingCDX: listening on %u", buf, 0x22u);
          }
        }
        return 1;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          -[GKConnectionInternal startListeningForLocalGamingCDX].cold.5();
      }
    }
  }
LABEL_44:
  updateRelayQueue_high = HIDWORD(self->_updateRelayQueue);
  if (updateRelayQueue_high == -1)
    return 0;
  close(updateRelayQueue_high);
  result = 0;
  HIDWORD(self->_updateRelayQueue) = -1;
  return result;
}

GKAsyncSocket *__55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  sockaddr v4;
  GKAsyncSocket *result;
  GKAsyncSocket *v6;
  void *v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  _QWORD v12[6];
  socklen_t v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];
  sockaddr buf[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)&buf[0].sa_len = 136315650;
      *(_QWORD *)&buf[0].sa_data[2] = v2;
      *(_WORD *)&buf[0].sa_data[10] = 2080;
      *(_QWORD *)&buf[0].sa_data[12] = "-[GKConnectionInternal startListeningForLocalGamingCDX]_block_invoke";
      *(_WORD *)&buf[1].sa_data[4] = 1024;
      *(_DWORD *)&buf[1].sa_data[6] = 2162;
      _os_log_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _localGamingCDXListenSource callback", &buf[0].sa_len, 0x1Cu);
    }
  }
  *(_QWORD *)&v4.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  buf[6] = v4;
  buf[7] = v4;
  buf[4] = v4;
  buf[5] = v4;
  buf[2] = v4;
  buf[3] = v4;
  buf[0] = v4;
  buf[1] = v4;
  v13 = 128;
  result = (GKAsyncSocket *)accept(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 508), buf, &v13);
  if ((_DWORD)result != -1)
  {
    v6 = result;
    TimingLog(3, 0, (uint64_t)"starting local CDX tcp connection (accept)");
    result = objc_alloc_init(GKAsyncSocket);
    if (result)
    {
      v7 = result;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke_206;
      v12[3] = &unk_24D4665D8;
      v12[4] = *(_QWORD *)(a1 + 32);
      v12[5] = result;
      -[GKAsyncSocket setReceiveDataHandler:](result, "setReceiveDataHandler:", v12);
      *(_QWORD *)((char *)v19 + 14) = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v19[0] = v8;
      v17 = v8;
      v18 = v8;
      v16 = 0xAAAAAAAAAAAAAAAALL;
      v14 = v8;
      v15 = v8;
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 20);
      SAToIPPORT();
      objc_msgSend(v7, "setSocketName:", objc_msgSend(v9, "stringWithFormat:", CFSTR("localCDX[%u][%08X] (connect-from[%s]) (ptr=%p) (listener)"), v10, v10, IPPORTToStringWithSize(), v7));
      objc_msgSend(v7, "setTargetQueue:", MEMORY[0x24BDAC9B8]);
      objc_msgSend(v7, "tcpAttachSocketDescriptor:", v6);
      v11 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20));
      return (GKAsyncSocket *)objc_msgSend(v7, "sendData:withCompletionHandler:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v11, 4), 0);
    }
  }
  return result;
}

uint64_t __55__GKConnectionInternal_startListeningForLocalGamingCDX__block_invoke_206(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "localGamingReceiveDataHandler:data:time:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (id)getLocalConnectionDataForLocalGaming
{
  void *v3;
  int LocalInterfaceListWithOptions;
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  char v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v17 = -86;
  -[GKConnectionInternal startListeningForLocalGamingCDX](self, "startListeningForLocalGamingCDX");
  v19 = bswap32(*(&self->super._pid + 1));
  objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v19, 4));
  v18 = bswap32(LOWORD(self->_fPreReleased)) >> 16;
  objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v18, 2));
  LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x24BDFDC28];
  if (ErrorLogLevelForModule >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    v9 = *v6;
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v7;
        v23 = 2080;
        v24 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
        v25 = 1024;
        v26 = 2227;
        v27 = 1024;
        v28 = LocalInterfaceListWithOptions;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d After GetLocalInterfaceListWithOptions iNumInt=%d", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[GKConnectionInternal getLocalConnectionDataForLocalGaming].cold.1();
    }
  }
  if (LocalInterfaceListWithOptions >= 1)
  {
    v10 = 0;
    do
    {
      v11 = v20;
      if (strcmp((const char *)(v20 + v10 + 4), "lo0") && (*(_BYTE *)(v11 + v10) & 1) == 0)
      {
        v17 = 4;
        objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v17, 1));
        *(_DWORD *)buf = -1431655766;
        *(_DWORD *)buf = bswap32(*(_DWORD *)(v20 + v10 + 20));
        objc_msgSend(v3, "appendData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4));
      }
      v10 += 40;
    }
    while (40 * LocalInterfaceListWithOptions != v10);
  }
  FreeLocalInterfaceList();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v3, "length");
      if (v3)
        v15 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      else
        v15 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v22 = v12;
      v23 = 2080;
      v24 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
      v25 = 1024;
      v26 = 2248;
      v27 = 1024;
      v28 = v14;
      v29 = 2080;
      v30 = v15;
      _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d getLocalConnectionDataForLocalGaming returned %d bytes (%s)", buf, 0x2Cu);
    }
  }
  return v3;
}

- (NSMutableDictionary)pidToConnectTimeoutSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPidToConnectTimeoutSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)self->_pidsPreparedForConnection;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  self->_pidsPreparedForConnection = (NSMutableSet *)a3;
}

- (CDXClient)cdxClient
{
  return (CDXClient *)self->_eventDelegate;
}

- (NSMutableDictionary)cdxSessions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCdxSessions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)initWithParticipantID:.cold.1()
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

- (void)getLocalConnectionDataWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v2, v3, " [%s] %s:%d Got local connection data size=%lu", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)connectPendingConnectionsFromList:(uint64_t)a1 sessionInfo:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v2, v3, " [%s] %s:%d connectPendingConnections: sessionInfo: %s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)connectParticipantsWithConnectionData:withSessionInfo:.cold.1()
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
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d CANNOT CREATE DISPATCH GROUP", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)connectParticipantsWithConnectionData:(uint64_t)a3 withSessionInfo:(os_log_t)log .cold.2(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = "-[GKConnectionInternal connectParticipantsWithConnectionData:withSessionInfo:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 874;
  *((_WORD *)buf + 14) = 2080;
  *(_QWORD *)(buf + 30) = a1;
  _os_log_error_impl(&dword_215C5C000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Participant connection data NOT found for %s", buf, 0x26u);
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d Unable to create timer dispatch source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

void __78__GKConnectionInternal_connectParticipantsWithConnectionData_withSessionInfo___block_invoke_165_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_18_0();
  _os_log_fault_impl(&dword_215C5C000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unable to create timer dispatch source", v1, 0x1Cu);
  OUTLINED_FUNCTION_12();
}

- (void)internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  v2 = "-[GKConnectionInternal internal_setRemoteConnectionData:fromParticipantID:pendingConnectionPIDList:]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, (uint64_t)v0, " [%s] %s:%d GCKSessionPrepareConnection FAILED(%08X)", v1);
  OUTLINED_FUNCTION_12();
}

- (void)addEvent:remotePeer:.cold.1()
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)setEventDelegate:.cold.1()
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)eventDelegate
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)gckPID
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, " [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)createInsecureTicketUsingSortedConnectionsFromList:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  v2 = "-[GKConnectionInternal createInsecureTicketUsingSortedConnectionsFromList:]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, (uint64_t)v0, " [%s] %s:%d Unable to generate ticket! error = %d", v1);
  OUTLINED_FUNCTION_12();
}

- (void)CDXClientSession:receivedData:from:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  v2 = "-[GKConnectionInternal CDXClientSession:receivedData:from:]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, (uint64_t)v0, " [%s] %s:%d GKConnection: GCKSessionEstablishConnection failed (%08X)", v1);
  OUTLINED_FUNCTION_12();
}

void __106__GKConnectionInternal_internalInitiateRelayWithParticipant_withConnectionData_withRelayInfo_didInitiate___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  v2 = "-[GKConnectionInternal internalInitiateRelayWithParticipant:withConnectionData:withRelayInfo:didInitiate:]_block_invoke";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_11_0(&dword_215C5C000, v0, (uint64_t)v0, " [%s] %s:%d Cannot get relay candidates (%08X)", v1);
  OUTLINED_FUNCTION_12();
}

- (void)localGamingReceiveDataHandler:(uint64_t)a1 data:(void *)a2 time:error:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9(a2, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_215C5C000, v2, v3, " [%s] %s:%d expecting at least 4 bytes of data (%d)", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)startListeningForLocalGamingCDX
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_19_0(&dword_215C5C000, v0, v1, " [%s] %s:%d bind() failed for local gaming CDX (%d), trying ANY...", v2);
  OUTLINED_FUNCTION_2();
}

- (void)getLocalConnectionDataForLocalGaming
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  v2 = "-[GKConnectionInternal getLocalConnectionDataForLocalGaming]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_19_0(&dword_215C5C000, v0, (uint64_t)v0, " [%s] %s:%d After GetLocalInterfaceListWithOptions iNumInt=%d", v1);
  OUTLINED_FUNCTION_12();
}

@end
