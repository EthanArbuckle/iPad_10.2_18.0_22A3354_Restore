@implementation CDXClient

+ (id)sharedClient
{
  void *v2;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__CDXClient_sharedClient__block_invoke;
  block[3] = &unk_24D466170;
  block[4] = a1;
  if (sharedClient_onceToken != -1)
    dispatch_once(&sharedClient_onceToken, block);
  v2 = (void *)sharedClient_sharedClient;
  objc_sync_enter((id)sharedClient_sharedClient);
  if (!*(_QWORD *)(sharedClient_sharedClient + 136))
    objc_msgSend((id)sharedClient_sharedClient, "start");
  objc_sync_exit(v2);
  return (id)sharedClient_sharedClient;
}

uint64_t __25__CDXClient_sharedClient__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithOptions:delegate:", 0, 0);
  sharedClient_sharedClient = result;
  return result;
}

- (NSError)error
{
  NSError *v3;

  objc_sync_enter(self);
  v3 = self->error_;
  objc_sync_exit(self);
  return v3;
}

- (void)setError:(id)a3
{
  NSError *error;
  NSError *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int64_t restartCount;
  double v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  CDXClient *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  error = self->error_;
  self->error_ = (NSError *)objc_msgSend(a3, "copyWithZone:", -[CDXClient zone](self, "zone"));
  v6 = error;
  objc_sync_exit(self);
  if (a3)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqual:", -[NSError domain](error, "domain"))
      || (v7 = objc_msgSend(a3, "code"), v7 != -[NSError code](error, "code")))
    {
      if ((CDXClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[CDXClient setError:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[CDXClient performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_24D466D90;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v17 = 136316418;
            v18 = v9;
            v19 = 2080;
            v20 = "-[CDXClient setError:]";
            v21 = 1024;
            v22 = 818;
            v23 = 2112;
            v24 = (uint64_t)v8;
            v25 = 2048;
            v26 = self;
            v27 = 2080;
            v28 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            _os_log_error_impl(&dword_215C5C000, v10, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) err = %s", (uint8_t *)&v17, 0x3Au);
          }
        }
      }
      if (self->scDynamicStore_)
      {
        v11 = (void *)objc_msgSend(a3, "domain");
        if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD1128]))
        {
          restartCount = self->restartCount_;
          self->restartCount_ = restartCount + 1;
          v13 = exp2((double)restartCount);
          objc_sync_enter(self);
          -[CDXClient stopListeningOnSockets](self, "stopListeningOnSockets");
          -[CDXClient stopHolePunchTimer](self, "stopHolePunchTimer");
          objc_sync_exit(self);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v16 = objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
              v17 = 136316162;
              v18 = v14;
              v19 = 2080;
              v20 = "-[CDXClient setError:]";
              v21 = 1024;
              v22 = 830;
              v23 = 2080;
              v24 = v16;
              v25 = 2048;
              v26 = *(CDXClient **)&v13;
              _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Will restart in %f seconds due to POSIX error.", (uint8_t *)&v17, 0x30u);
            }
          }
          -[CDXClient performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_restart, 0, v13);
        }
      }
    }
    -[CDXClientDelegate CDXClient:error:](self->delegate_, "CDXClient:error:", self, a3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("CDXClientErrorNotification"), self);
  }
}

- (NSData)preblob
{
  NSData *v3;

  objc_sync_enter(self);
  v3 = self->preblob_;
  objc_sync_exit(self);
  return v3;
}

- (void)setPreblob:(id)a3
{
  NSData *v5;

  objc_sync_enter(self);

  v5 = (NSData *)objc_msgSend(a3, "copyWithZone:", -[CDXClient zone](self, "zone"));
  self->preblob_ = v5;
  -[CDXClientDelegate CDXClient:preblob:](self->delegate_, "CDXClient:preblob:", self, v5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("CDXClientDidUpdatePreblobNotification"), self);
  objc_sync_exit(self);
}

- (void)sendHolePunch
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int64_t holePunchAttemptCount;
  void *v9;
  uint64_t v10;
  void *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  socklen_t v17;
  int v18;
  unint64_t holePunchSID;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v18 = 8;
  holePunchSID = self->holePunchSID_;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = v3;
      v27 = 2080;
      v28 = "-[CDXClient sendHolePunch]";
      v29 = 1024;
      v30 = 878;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d requesting-hole-punch", buf, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
      holePunchAttemptCount = self->holePunchAttemptCount_;
      *(_DWORD *)buf = 136316162;
      v26 = v5;
      v27 = 2080;
      v28 = "-[CDXClient sendHolePunch]";
      v29 = 1024;
      v30 = 880;
      v31 = 2080;
      v32 = v7;
      v33 = 1024;
      v34 = holePunchAttemptCount;
      _os_log_impl(&dword_215C5C000, v6, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Poking hole to CDX server... (Try #%d)", buf, 0x2Cu);
    }
  }
  objc_sync_enter(self);
  if (sendto(self->fd_, &v18, 0x10uLL, 0, -[CDXClient currentSockAddr](self, "currentSockAddr"), -[CDXClient currentSockAddrLen](self, "currentSockAddrLen")) <= 0)
  {
    if (*__error() == 12)
    {
      objc_sync_exit(self);
      return;
    }
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *__error();
    v23 = *MEMORY[0x24BDD0FD8];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = __error();
    v24 = objc_msgSend(v11, "stringWithFormat:", CFSTR("Call to send() failed, \"%s\"."), strerror(*v12));
    v13 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    -[CDXClient setError:](self, "setError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v10, v13));
  }
  objc_sync_exit(self);
  *(_DWORD *)buf = 0;
  v17 = 4;
  getsockopt(self->fd_, 0xFFFF, 4103, buf, &v17);
  v14 = *(int *)buf;
  if (*(_DWORD *)buf)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FD8];
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Socket has async error. %s"), strerror(*(int *)buf));
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    -[CDXClient setError:](self, "setError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v14, v16));
  }
}

- (BOOL)handleHolePunchEvent
{
  int64_t holePunchAttemptCount;
  double holePunchInterval;
  uint32_t v5;
  float v6;
  float v7;
  float v8;
  NSObject *holePunchTimer;
  dispatch_time_t v10;
  BOOL v11;

  objc_sync_enter(self);
  if (self->holePunchTimer_ && (-[CDXClient sendHolePunch](self, "sendHolePunch"), self->holePunchTimer_))
  {
    if (!self->preblobIsUpToDate_)
    {
      holePunchAttemptCount = self->holePunchAttemptCount_;
      self->holePunchAttemptCount_ = holePunchAttemptCount + 1;
      holePunchInterval = self->holePunchInterval_;
      v5 = arc4random();
      v6 = pow(1.33333333, (double)(int)holePunchAttemptCount) * 0.1;
      v7 = holePunchInterval;
      if (v6 > v7)
        v6 = holePunchInterval;
      v8 = ((float)((float)(v5 & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v6;
      holePunchTimer = self->holePunchTimer_;
      v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      dispatch_source_set_timer(holePunchTimer, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->holePunchInterval_ * 1000000000.0));
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (void)resetHolepunchTimer
{
  int64_t holePunchAttemptCount;
  double holePunchInterval;
  uint32_t v5;
  float v6;
  float v7;
  float v8;
  NSObject *holePunchTimer;
  dispatch_time_t v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  if (self->holePunchTimer_)
  {
    self->holePunchAttemptCount_ = 0;
    self->preblobIsUpToDate_ = 0;
    self->prevHolePunchSID_ = self->holePunchSID_;
    v11[0] = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = 0xAAAAAAAAAAAAAAAALL;
    MEMORY[0x2199EFD28](v11);
    self->holePunchSID_ = v11[0];
    holePunchAttemptCount = self->holePunchAttemptCount_;
    self->holePunchAttemptCount_ = holePunchAttemptCount + 1;
    holePunchInterval = self->holePunchInterval_;
    v5 = arc4random();
    v6 = pow(1.33333333, (double)(int)holePunchAttemptCount) * 0.1;
    v7 = holePunchInterval;
    if (v6 > v7)
      v6 = holePunchInterval;
    v8 = ((float)((float)(v5 & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v6;
    holePunchTimer = self->holePunchTimer_;
    v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_source_set_timer(holePunchTimer, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->holePunchInterval_ * 1000000000.0));
  }
  objc_sync_exit(self);
}

- (void)handleFDEvent
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(v0, *MEMORY[0x24BDAC8D0]), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d %s: Received hole punch, no change from previous.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)networkDidChange
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      if (self)
        v5 = (const char *)objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
      else
        v5 = "<nil>";
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[CDXClient networkDidChange]";
      v10 = 1024;
      v11 = 1080;
      v12 = 2080;
      v13 = v5;
      _os_log_impl(&dword_215C5C000, v4, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Processing network change. . .", (uint8_t *)&v6, 0x26u);
    }
  }
  -[CDXClient setError:](self, "setError:", 0);
  -[CDXClient resetHolepunchTimer](self, "resetHolepunchTimer");
  self->willReconfigureShortly_ = 0;
  -[CDXClient restart](self, "restart");
}

- (void)stopListeningOnSockets
{
  NSObject *source;
  NSObject *v4;

  source = self->source_;
  if (source)
  {
    dispatch_source_cancel(source);
    v4 = self->source_;
    if (!dispatch_source_testcancel(v4))
    {
      while (1)
        ;
    }
    if (v4)
    {
      dispatch_release(v4);
      self->source_ = 0;
    }
  }
}

- (void)startListeningOnSockets
{
  OS_dispatch_source *v3;
  uint64_t v4;
  int fd;
  NSObject *source;
  _QWORD v7[5];
  _QWORD handler[4];
  int v9;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], self->fd_, 0, (dispatch_queue_t)self->queue_);
  self->source_ = v3;
  if (v3)
  {
    v4 = MEMORY[0x24BDAC760];
    fd = self->fd_;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__CDXClient_startListeningOnSockets__block_invoke;
    handler[3] = &__block_descriptor_36_e5_v8__0l;
    v9 = fd;
    dispatch_source_set_cancel_handler((dispatch_source_t)v3, handler);
    source = self->source_;
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __36__CDXClient_startListeningOnSockets__block_invoke_2;
    v7[3] = &unk_24D466170;
    v7[4] = self;
    dispatch_source_set_event_handler(source, v7);
    dispatch_resume((dispatch_object_t)self->source_);
  }
  else
  {
    -[CDXClient setError:](self, "setError:", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDXClient"), 4, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to create dispatch read source for file descriptor."), *MEMORY[0x24BDD0FD8], 0)));
  }
}

uint64_t __36__CDXClient_startListeningOnSockets__block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __36__CDXClient_startListeningOnSockets__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleFDEvent");
}

- (CDXClient)initWithOptions:(id)a3 delegate:(id)a4
{
  CDXClient *v6;
  CDXClient *v7;
  CFMutableDictionaryRef Mutable;
  NSString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSString *server;
  const char *v14;
  unsigned __int16 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int port;
  double v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  double holePunchInterval;
  NSString *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSString *v29;
  const char *v30;
  unsigned __int16 v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  int *v41;
  int v42;
  _BYTE *v43;
  int v44;
  NSObject *v45;
  unsigned int v47;
  objc_super v48;
  uint8_t buf[48];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v48.receiver = self;
  v48.super_class = (Class)CDXClient;
  v6 = -[CDXClient init](&v48, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->delegate_ = (CDXClientDelegate *)a4;
  if (IsGarbageCollectionEnabled_cachedValue == -1)
  {
    IsGarbageCollectionEnabled_cachedValue = objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(CFSTR("NSGarbageCollector")), "performSelector:", sel_defaultCollector), "valueForKey:", CFSTR("isEnabled")), "BOOLValue");
    if (IsGarbageCollectionEnabled_cachedValue)
      goto LABEL_4;
  }
  else if (IsGarbageCollectionEnabled_cachedValue)
  {
LABEL_4:
    Mutable = (CFMutableDictionaryRef)(id)-[objc_class performSelector:](NSClassFromString(CFSTR("NSMapTable")), "performSelector:", sel_mapTableWithStrongToWeakObjects);
    goto LABEL_7;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], 0);
LABEL_7:
  v7->sessionLookup_ = (NSMutableDictionary *)Mutable;
  v9 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXOverrideServer"));
  v7->server_ = v9;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        server = v7->server_;
        if (server)
          v14 = -[NSString UTF8String](-[NSString description](server, "description"), "UTF8String");
        else
          v14 = "<nil>";
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1203;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v12;
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v14;
        _os_log_impl(&dword_215C5C000, v11, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverrideServer: %s", buf, 0x30u);
      }
    }
  }
  v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXOverridePort")), "integerValue");
  v7->port_ = v15;
  if (v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        port = v7->port_;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v16;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1206;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v18;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = port;
        _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverridePort: %d", buf, 0x2Cu);
      }
    }
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXOverrideHolePunchInterval")), "doubleValue");
  v7->holePunchInterval_ = v20;
  if (v20 != 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
      holePunchInterval = v7->holePunchInterval_;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1209;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v23;
      *(_WORD *)&buf[38] = 2048;
      *(double *)&buf[40] = holePunchInterval;
      _os_log_impl(&dword_215C5C000, v22, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverrideHolePunchInterval: %f", buf, 0x30u);
    }
  }
  v25 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXIP"));
  v7->server_ = v25;
  if (v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        v29 = v7->server_;
        if (v29)
          v30 = -[NSString UTF8String](-[NSString description](v29, "description"), "UTF8String");
        else
          v30 = "<nil>";
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1214;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v28;
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = v30;
        _os_log_impl(&dword_215C5C000, v27, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXIP(deprecated, please use CDXOverrideServer instead): %s", buf, 0x30u);
      }
    }
  }
  v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXPort")), "integerValue");
  v7->port_ = v31;
  if (v31)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        v35 = v7->port_;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1217;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v34;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v35;
        _os_log_impl(&dword_215C5C000, v33, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXPort(deprecated, please use CDXOverridePort instead): %d", buf, 0x2Cu);
      }
    }
  }
  if (!-[NSString length](v7->server_, "length"))
    v7->server_ = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("server")), "copyWithZone:", -[CDXClient zone](v7, "zone"));
  if (!v7->port_)
    v7->port_ = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("port")), "integerValue");
  if (v7->holePunchInterval_ == 0.0)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("holePunchInterval")), "doubleValue");
    v7->holePunchInterval_ = v36;
  }
  v37 = objc_msgSend(off_24D465868, "getIPPortForService:", *(_QWORD *)off_24D465698);
  if (v37)
  {
    v38 = v37;
    if (!-[NSString length](v7->server_, "length"))
    {
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v54 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      memset(buf, 0, sizeof(buf));
      v47 = bswap32(*(_DWORD *)(v38 + 20));
      inet_ntop(2, &v47, (char *)buf, 0xFFu);
      v7->server_ = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", buf);
    }
    if (!v7->port_)
      v7->port_ = *(_WORD *)(v38 + 36);
    free((void *)v38);
  }
  if (!-[NSString length](v7->server_, "length"))
    v7->server_ = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXDefaultServer"));
  if (!v7->port_)
    v7->port_ = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXDefaultPort")), "integerValue");
  if (v7->holePunchInterval_ == 0.0)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "objectForKey:", CFSTR("CDXDefaultHolePunchInterval")), "doubleValue");
    v7->holePunchInterval_ = v39;
  }
  if (!-[NSString length](v7->server_, "length"))
    v7->server_ = (NSString *)CFSTR("17.155.5.253");
  if (!v7->port_)
    v7->port_ = 4398;
  v40 = v7->holePunchInterval_;
  if (v40 == 0.0)
  {
    v7->holePunchInterval_ = 30.0;
    v40 = 30.0;
  }
  v41 = (int *)MEMORY[0x24BDFDC10];
  v42 = *MEMORY[0x24BDFDC10];
  v43 = (_BYTE *)MEMORY[0x24BDFDC20];
  if ((int)*MEMORY[0x24BDFDC10] > 6 || (v44 = *MEMORY[0x24BDFDC20], *MEMORY[0x24BDFDC20]))
  {
    *(double *)buf = v40;
    VRTraceVariable_();
    v42 = *v41;
    v44 = *v43 != 0;
  }
  if (v42 > 6 || v44)
  {
    *(_WORD *)buf = v7->port_;
    VRTraceVariable_();
    v42 = *v41;
    v44 = *v43 != 0;
  }
  if (v42 > 6 || v44)
  {
    -[NSString UTF8String](v7->server_, "UTF8String", v40);
    strlen(-[NSString UTF8String](v7->server_, "UTF8String"));
    VRTraceVariable_();
  }
  v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("queue"), v40), "pointerValue");
  v7->queue_ = (OS_dispatch_queue *)v45;
  if (v45)
    dispatch_retain(v45);
  else
    v7->queue_ = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.cdx.%p"), v7), "UTF8String"), 0);
  -[CDXClient start](v7, "start");
  return v7;
}

- (const)currentSockAddr
{
  addrinfo *cdxMappedIPv4Addr;

  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
    return cdxMappedIPv4Addr->ai_addr;
  else
    return (const sockaddr *)&self->cdxaddr_ipv4;
}

- (unsigned)currentSockAddrLen
{
  addrinfo *cdxMappedIPv4Addr;
  int v3;

  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
    return cdxMappedIPv4Addr->ai_addrlen;
  else
    LOBYTE(v3) = self->cdxaddr_ipv4.sin_len;
  return v3;
}

- (void)mapIPv4AddrToIPv6:(sockaddr_in *)a3
{
  addrinfo *cdxMappedIPv4Addr;
  addrinfo **p_cdxMappedIPv4Addr;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;
  addrinfo v11;
  uint64_t v12;
  uint64_t v13;
  char v14[8];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_cdxMappedIPv4Addr = &self->cdxMappedIPv4Addr;
  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
  {
    freeaddrinfo(cdxMappedIPv4Addr);
    *p_cdxMappedIPv4Addr = 0;
  }
  *(_QWORD *)v14 = 0;
  v15 = 0;
  v7 = inet_ntop(2, &a3->sin_addr, v14, 0x10u);
  memset(&v11, 0, sizeof(v11));
  v11.ai_socktype = 2;
  v11.ai_flags = 1536;
  v8 = getaddrinfo(v7, 0, &v11, p_cdxMappedIPv4Addr);
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = v8;
    v12 = *MEMORY[0x24BDD0FD8];
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Call to getaddrinfo() failed for hostname \"%s\". Error %s."), v7, gai_strerror(v8));
    -[CDXClient setError:](self, "setError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("error"), v10, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
  else
  {
    *(_WORD *)self->cdxMappedIPv4Addr->ai_addr->sa_data = bswap32(self->port_) >> 16;
  }
}

- (void)dealloc
{
  NSObject *source;
  NSObject *holePunchTimer;
  NSObject *queue;
  addrinfo *cdxMappedIPv4Addr;
  objc_super v7;

  source = self->source_;
  if (source)
    dispatch_release(source);
  holePunchTimer = self->holePunchTimer_;
  if (holePunchTimer)
    dispatch_release(holePunchTimer);
  queue = self->queue_;
  if (queue)
    dispatch_release(queue);

  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
    freeaddrinfo(cdxMappedIPv4Addr);

  v7.receiver = self;
  v7.super_class = (Class)CDXClient;
  -[CDXClient dealloc](&v7, sel_dealloc);
}

- (void)start
{
  hostent *v3;
  unsigned int v4;
  uint64_t v5;
  BOOL v6;
  addrinfo *cdxMappedIPv4Addr;
  int ai_family;
  int v9;
  addrinfo *v10;
  int v11;
  OS_dispatch_source *v12;
  NSObject *holePunchTimer;
  dispatch_time_t v14;
  __SCDynamicStore *v15;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int *v37;
  _QWORD handler[5];
  SCDynamicStoreContext v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = gethostbyname2(-[NSString UTF8String](self->server_, "UTF8String"), 2);
  *(_WORD *)&self->cdxaddr_ipv4.sin_len = 528;
  v4 = bswap32(self->port_) >> 16;
  self->cdxaddr_ipv4.sin_port = v4;
  self->cdxaddr_ipv4.sin_addr.s_addr = 16777343;
  v5 = (int)*MEMORY[0x24BDAE7D8];
  if ((_DWORD)v5)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (v6)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = (void *)MEMORY[0x24BDBCE70];
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Call to gethostbyname2() failed for hostname \"%@\". Error %d."), self->server_, v5);
    v21 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x24BDD0FD8], 0);
    v22 = CFSTR("h_errno");
    v23 = v18;
    v24 = v5;
LABEL_22:
    -[CDXClient setError:](self, "setError:", objc_msgSend(v23, "errorWithDomain:code:userInfo:", v22, v24, v21));
    return;
  }
  if (v3->h_length <= 1)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gethostbyname2() did not return any addresses for hostname \"%@\"."), self->server_);
    v21 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x24BDD0FD8], 0);
    v22 = CFSTR("CDXClient");
    v23 = v25;
    v24 = 3;
    goto LABEL_22;
  }
  self->cdxaddr_ipv4.sin_addr.s_addr = **(_DWORD **)v3->h_addr_list;
  self->cdxaddr_ipv4.sin_port = v4;
  objc_sync_enter(self);
  -[CDXClient mapIPv4AddrToIPv6:](self, "mapIPv4AddrToIPv6:", &self->cdxaddr_ipv4);
  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
    ai_family = cdxMappedIPv4Addr->ai_family;
  else
    ai_family = 2;
  v9 = socket(ai_family, 2, 17);
  self->fd_ = v9;
  if (v9 <= 0)
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    v29 = *__error();
    v30 = (void *)MEMORY[0x24BDBCE70];
    v31 = (void *)MEMORY[0x24BDD17C8];
    v32 = __error();
    -[CDXClient setError:](self, "setError:", objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v29, objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", objc_msgSend(v31, "stringWithFormat:", CFSTR("Unable to create FD to CDX. %s"), strerror(*v32)), *MEMORY[0x24BDD0FD8], 0)));
LABEL_25:
    objc_sync_exit(self);
    return;
  }
  LODWORD(v39.version) = 1;
  setsockopt(v9, 0xFFFF, 4130, &v39, 4u);
  v10 = self->cdxMappedIPv4Addr;
  if (v10 && v10->ai_family == 30)
  {
    memset((char *)&v39.version + 4, 0, 24);
    LOWORD(v39.version) = 7708;
    WORD1(v39.version) = bswap32(self->localPort_) >> 16;
    *(_OWORD *)&v39.info = *MEMORY[0x24BDAE878];
    v11 = bind(self->fd_, (const sockaddr *)&v39, 0x1Cu);
  }
  else
  {
    v39.info = 0;
    LOWORD(v39.version) = 528;
    WORD1(v39.version) = bswap32(self->localPort_) >> 16;
    HIDWORD(v39.version) = 0;
    v11 = bind(self->fd_, (const sockaddr *)&v39, 0x10u);
  }
  if (v11)
  {
    v33 = (void *)MEMORY[0x24BDD1540];
    v34 = *__error();
    v35 = (void *)MEMORY[0x24BDBCE70];
    v36 = (void *)MEMORY[0x24BDD17C8];
    v37 = __error();
    -[CDXClient setError:](self, "setError:", objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v34, objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", objc_msgSend(v36, "stringWithFormat:", CFSTR("Unable to bind FD to sockaddr. %s"), strerror(*v37)), *MEMORY[0x24BDD0FD8], 0)));
    goto LABEL_25;
  }
  objc_sync_exit(self);
  -[CDXClient startListeningOnSockets](self, "startListeningOnSockets");
  v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->queue_);
  self->holePunchTimer_ = v12;
  if (v12)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __18__CDXClient_start__block_invoke;
    handler[3] = &unk_24D466170;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
    holePunchTimer = self->holePunchTimer_;
    v14 = dispatch_time(0, (uint64_t)(self->holePunchInterval_ * 1000000000.0));
    dispatch_source_set_timer(holePunchTimer, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->holePunchTimer_);
    -[CDXClient resetHolepunchTimer](self, "resetHolepunchTimer");
    -[CDXClient sendHolePunch](self, "sendHolePunch");
    v39.version = 0;
    v39.info = self;
    v39.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
    v39.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
    v39.copyDescription = 0;
    v15 = SCDynamicStoreCreate(0, (CFStringRef)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.cdx.%p"), self), (SCDynamicStoreCallBack)CDX_SCDynamicStoreCallBack, &v39);
    self->scDynamicStore_ = v15;
    if (v15)
    {
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v15, 0);
      self->scDynamicStoreRunLoopSource_ = RunLoopSource;
      if (RunLoopSource)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, self->scDynamicStoreRunLoopSource_, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        SCDynamicStoreSetNotificationKeys(self->scDynamicStore_, 0, (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("State:/Network/Interface/[^/]+/IPv4"), 0));
      }
    }
  }
  else
  {
    -[CDXClient setError:](self, "setError:", objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDXClient"), 5, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to create dispatch timer source holePunchTimer."), *MEMORY[0x24BDD0FD8], 0)));
  }
}

uint64_t __18__CDXClient_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHolePunchEvent");
}

- (void)restart
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)stopHolePunchTimer
{
  NSObject *holePunchTimer;
  NSObject *v4;

  holePunchTimer = self->holePunchTimer_;
  if (holePunchTimer)
  {
    dispatch_source_cancel(holePunchTimer);
    v4 = self->holePunchTimer_;
    if (v4)
    {
      dispatch_release(v4);
      self->holePunchTimer_ = 0;
    }
  }
}

- (void)invalidate
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
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (BOOL)sendRaw:(id)a3
{
  ssize_t v5;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(self);
  v5 = sendto(self->fd_, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0, -[CDXClient currentSockAddr](self, "currentSockAddr"), -[CDXClient currentSockAddrLen](self, "currentSockAddrLen"));
  objc_sync_exit(self);
  if (*__error() == 12)
    return 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x24BDFDC28];
    v9 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v10 = "<nil>";
        v11 = 136315906;
        v12 = v7;
        v13 = 2080;
        v14 = "-[CDXClient sendRaw:]";
        v15 = 1024;
        v16 = 1639;
        v17 = 2080;
        v18 = v10;
        _os_log_impl(&dword_215C5C000, v8, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d sendRaw:%s", (uint8_t *)&v11, 0x26u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[CDXClient sendRaw:].cold.1();
    }
  }
  return v5 == objc_msgSend(a3, "length");
}

- (void)invalidateSession:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[CDXClient queue](self, "queue");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__CDXClient_invalidateSession___block_invoke;
  v6[3] = &unk_24D4661B8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __31__CDXClient_invalidateSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "ticket"), "CDXTicketSID")));
}

- (id)createSessionWithTicket:(id)a3 sessionKey:(id)a4
{
  CDXClientSession *v7;
  OS_dispatch_queue *v8;
  _QWORD block[7];

  if (!objc_msgSend(a3, "CDXTicketWellFormed"))
    return 0;
  v7 = -[CDXClientSession initWithCDXClient:ticket:sessionKey:](+[CDXClientSession allocWithZone:](CDXClientSession, "allocWithZone:", -[CDXClient zone](self, "zone")), "initWithCDXClient:ticket:sessionKey:", self, a3, a4);
  v8 = -[CDXClient queue](self, "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CDXClient_createSessionWithTicket_sessionKey___block_invoke;
  block[3] = &unk_24D4661E0;
  block[4] = self;
  block[5] = a3;
  block[6] = v7;
  dispatch_async((dispatch_queue_t)v8, block);
  return v7;
}

uint64_t __48__CDXClient_createSessionWithTicket_sessionKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "CDXTicketSID")));
}

- (OS_dispatch_queue)queue
{
  return self->queue_;
}

- (id)preblobCallback
{
  return self->preblobCallback_;
}

- (void)setPreblobCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (CDXClientDelegate)delegate
{
  return self->delegate_;
}

- (void)setDelegate:(id)a3
{
  self->delegate_ = (CDXClientDelegate *)a3;
}

- (void)setError:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[40];

  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(v1, *MEMORY[0x24BDAC8D0]), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_215C5C000, v0, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d err = %s", v2, 0x26u);
  OUTLINED_FUNCTION_2();
}

- (void)sendRaw:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  if (v0)
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d sendRaw:%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
