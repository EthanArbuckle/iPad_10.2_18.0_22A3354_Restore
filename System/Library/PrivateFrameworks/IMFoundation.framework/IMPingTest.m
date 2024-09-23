@implementation IMPingTest

- (IMPingTest)initWithAddress:(id)a3 wifi:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  IMPingTest *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *address;
  uint64_t v23;
  _IMPingStatisticsCollector *v24;
  id collector;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IMPingTest;
  v9 = -[IMPingTest init](&v27, sel_init);
  if (v9)
  {
    if (objc_msgSend_isEqualToString_(v6, v7, IMPingTestDefaultGateway, v8))
    {
      objc_msgSend_sharedInstance(NetworkChangeNotifier, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_myGatewayAddress(v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_copy(v17, v18, v19, v20);
      address = v9->_address;
      v9->_address = (NSString *)v21;

    }
    else
    {
      v23 = objc_msgSend_copy(v6, v10, v11, v12);
      v13 = v9->_address;
      v9->_address = (NSString *)v23;
    }

    v9->_usesWifi = a4;
    v24 = objc_alloc_init(_IMPingStatisticsCollector);
    collector = v9->_collector;
    v9->_collector = v24;

  }
  return v9;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_stop(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMPingTest;
  -[IMPingTest dealloc](&v5, sel_dealloc);
}

- (void)startWithTimeout:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  dispatch_queue_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  IMPingTest *v18;
  BOOL isRunning;
  _QWORD block[5];
  dispatch_queue_t v21;
  id v22;
  double v23;
  BOOL v24;

  v8 = (dispatch_queue_t)a4;
  v9 = a5;
  if (_IMWillLog(CFSTR("IMPingTest")))
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("_startWithTimeout:%f"), v12, v13, v14, v15, v16, SLOBYTE(a3));
  if (!v8)
    v8 = dispatch_queue_create("com.apple.imcore.impingtest", 0);
  v17 = (void *)objc_msgSend_copy(v9, v10, v11, v12);
  v18 = self;
  objc_sync_enter(v18);
  isRunning = v18->_isRunning;
  if (!isRunning)
  {
    v18->_secondsToRun = a3;
    v18->_isRunning = 1;
  }
  objc_sync_exit(v18);

  if (v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1906B4730;
    block[3] = &unk_1E2C465C0;
    v24 = !isRunning;
    block[4] = v18;
    v23 = a3;
    v21 = v8;
    v22 = v17;
    dispatch_async(v21, block);

  }
}

- (void)stop
{
  NSObject *sendTimer;
  OS_dispatch_source *v3;
  NSObject *socketReadSource;
  OS_dispatch_source *v5;
  IMPingTest *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isRunning = 0;
  sendTimer = obj->_sendTimer;
  if (sendTimer)
  {
    dispatch_source_cancel(sendTimer);
    v3 = obj->_sendTimer;
    obj->_sendTimer = 0;

  }
  socketReadSource = obj->_socketReadSource;
  if (socketReadSource)
  {
    dispatch_source_cancel(socketReadSource);
    v5 = obj->_socketReadSource;
    obj->_socketReadSource = 0;

  }
  objc_sync_exit(obj);

}

- (id)pingStats
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_pingStats(self->_collector, a2, v2, v3);
}

- (id)pingStats:(double)a3
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x1E0DE7D20])(self->_collector, sel_pingStatsForLastNSeconds_);
}

- (BOOL)writeResultsToFile:(id)a3 error:(id *)a4
{
  return MEMORY[0x1E0DE7D20](self->_collector, sel_logStatsToFile_error_, a3, a4);
}

- (int)_setupAndPerformPing:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  hostent *v29;
  _BOOL4 usesWifi;
  protoent *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  __CFString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v56;
  _QWORD v57[2];
  int v58;
  unsigned int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (_IMWillLog(CFSTR("IMPingTest")))
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("_setupAndPerformPing"), v12, v13, v14, v15, v16, v56);
  if (!self->_isRunning)
  {
    v19 = 4;
    goto LABEL_29;
  }
  v17 = (const char *)objc_msgSend_UTF8String(self->_address, v10, v11, v12);
  if (v17)
  {
    v18 = v17;
    LODWORD(v61) = 0;
    v62 = 0;
    HIDWORD(v61) = inet_addr(v17);
    if (HIDWORD(v61) != -1)
    {
      BYTE1(v61) = 2;
      goto LABEL_13;
    }
    v29 = gethostbyname(v18);
    if (v29)
    {
      BYTE1(v61) = v29->h_addrtype;
      __memcpy_chk();
LABEL_13:
      usesWifi = self->_usesWifi;
      v58 = 51200;
      v57[1] = 0xAAAAAAAA00000000;
      v31 = getprotobyname("icmp");
      if (v31)
      {
        v32 = socket(2, 2, v31->p_proto);
        v19 = 1;
        if ((v32 & 0x80000000) != 0)
          goto LABEL_24;
        v33 = v32;
        fcntl(v32, 4, 4);
        v34 = setsockopt(v33, 0xFFFF, 4098, &v58, 4u);
        v60 = 1;
        if (usesWifi)
        {
          setsockopt(v33, 0, 6969, &v60, 4u);
        }
        else
        {
          v35 = (void *)MEMORY[0x19400E788](v34);
          v36 = (const void *)IMPCInterfaceName();
          v37 = (__CFString *)CFRetain(v36);
          v41 = objc_msgSend_length(v37, v38, v39, v40);
          v42 = CFSTR("pdp_ip0");
          if (v41)
            v42 = v37;
          v43 = v42;

          v44 = objc_retainAutorelease(v43);
          v48 = (const char *)objc_msgSend_UTF8String(v44, v45, v46, v47);

          v59 = if_nametoindex(v48);
          setsockopt(v33, 0, 25, &v59, 4u);
          objc_autoreleasePoolPop(v35);
        }
        v57[0] = 1;
        if (setsockopt(v33, 0xFFFF, 4102, v57, 0x10u))
        {
          close(v33);
          v19 = *__error();
          if (v19)
          {
LABEL_24:
            if (_IMWillLog(CFSTR("IMPingTest")))
              _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("Error creating socket %d"), v50, v51, v52, v53, v54, v19);
            goto LABEL_29;
          }
          v33 = 0xFFFFFFFFLL;
        }
        objc_msgSend__doPingWithSocket_address_timeToRunTestInSeconds_pingTimeout_queue_completionHandler_(self, v49, v33, v61, v62, v8, v9, a3, 2.0);
        v19 = 0;
        goto LABEL_29;
      }
      v19 = 46;
      goto LABEL_24;
    }
    v19 = 65;
  }
  else
  {
    v19 = 22;
  }
  if (_IMWillLog(CFSTR("IMPingTest")))
  {
    v23 = objc_msgSend_UTF8String(self->_address, v20, v21, v22);
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("Error _LookupHostAddress %s"), v24, v25, v26, v27, v28, v23);
  }
LABEL_29:

  return v19;
}

- (void)_doPingWithSocket:(int)a3 address:(sockaddr_in)a4 timeToRunTestInSeconds:(double)a5 pingTimeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  id v23;
  uint32_t v24;
  const char *v25;
  unsigned int v26;
  OS_dispatch_source *v27;
  OS_dispatch_source *sendTimer;
  NSObject *v29;
  dispatch_time_t v30;
  NSObject *v31;
  NSObject *socketReadSource;
  _QWORD v33[3];
  __int16 v34;
  _QWORD handler[5];
  id v36;
  _QWORD *v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int16 v44;
  uint64_t v45;

  v11 = *(_QWORD *)a4.sin_zero;
  v12 = *(_QWORD *)&a4.sin_len;
  v13 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = a8;
  if (_IMWillLog(CFSTR("IMPingTest")))
    _IMAlwaysLog(0, CFSTR("IMPingTest"), CFSTR("_doPing: %d"), v17, v18, v19, v20, v21, v13);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v22 = IMTimeOfDay();
  v23 = self->_collector;
  v24 = arc4random();
  if (v15)
  {
    v26 = v24 % 0xFFFF;
    objc_msgSend__setupReadSource_address_icmID_queue_completionHander_(self, v25, v13, v12, v11, v24 % 0xFFFF, v15, v16);
    v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v15);
    sendTimer = self->_sendTimer;
    self->_sendTimer = v27;

    v29 = self->_sendTimer;
    if (v29)
    {
      v30 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v29, v30, 0x3B9ACA00uLL, 0x5F5E100uLL);
      v31 = self->_sendTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_1906B4E0C;
      handler[3] = &unk_1E2C465E8;
      v38 = v22;
      v39 = a5;
      v41 = v12;
      v42 = v11;
      handler[4] = self;
      v37 = v33;
      v43 = v13;
      v44 = v26;
      v36 = v23;
      v40 = a6;
      dispatch_source_set_event_handler(v31, handler);
      dispatch_resume((dispatch_object_t)self->_sendTimer);
      socketReadSource = self->_socketReadSource;
      if (socketReadSource)
        dispatch_resume(socketReadSource);

    }
  }

  _Block_object_dispose(v33, 8);
}

- (void)_setupReadSource:(int)a3 address:(sockaddr_in)a4 icmID:(unsigned __int16)a5 queue:(id)a6 completionHander:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *socketReadSource;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  int v22;
  _QWORD handler[5];
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int16 v27;
  uint64_t v28;

  v9 = *(_QWORD *)a4.sin_zero;
  v10 = *(_QWORD *)&a4.sin_len;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], a3, 0, (dispatch_queue_t)a6);
  socketReadSource = self->_socketReadSource;
  self->_socketReadSource = v14;

  v16 = self->_socketReadSource;
  v17 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1906B5150;
  v20[3] = &unk_1E2C46610;
  v22 = a3;
  v20[4] = self;
  v21 = v13;
  v18 = v13;
  dispatch_source_set_cancel_handler(v16, v20);
  v19 = self->_socketReadSource;
  handler[0] = v17;
  handler[1] = 3221225472;
  handler[2] = sub_1906B51E4;
  handler[3] = &unk_1E2C46638;
  handler[4] = self;
  v24 = a3;
  v25 = v10;
  v26 = v9;
  v27 = a5;
  dispatch_source_set_event_handler(v19, handler);

}

- (double)longTimeInterval
{
  return 1000000.0;
}

- (double)secondsToRun
{
  return self->_secondsToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketReadSource, 0);
  objc_storeStrong((id *)&self->_sendTimer, 0);
  objc_storeStrong(&self->_collector, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
