@implementation _IDSDeviceConnection

- (_IDSDeviceConnection)initWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  _IDSDeviceConnection *v18;
  _IDSDeviceConnection *v19;
  CFMutableDictionaryRef Mutable;
  NSMutableDictionary *awdMetrics;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v36;
  NSString *openSocketCompletionHandlerID;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *nsuuid;
  void *v42;
  void *v43;
  uint64_t v44;
  NSString *service;
  void *v46;
  uint64_t v47;
  NSString *clientName;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSString *connectionUUID;
  uint64_t v54;
  uint64_t v55;
  NSString *streamName;
  uint64_t v57;
  NSString *serviceToken;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  NSNumber *clientTimeout;
  void **p_clientTimeout;
  NSObject *v65;
  NSNumber *v66;
  void *v67;
  void *v68;
  NSString *v69;
  void *v70;
  NSObject *v71;
  int socket;
  NSString *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id openSocketCompletionHandler;
  void *v80;
  __CFDictionary *v81;
  __CFDictionary *v82;
  NSString *v83;
  NSString *v84;
  NSString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSString *v90;
  NSString *v91;
  void *v92;
  void *v93;
  dispatch_time_t v94;
  void *v95;
  NSObject *v96;
  int v97;
  void *key;
  id v99;
  NSObject *queue;
  _QWORD v101[4];
  _IDSDeviceConnection *v102;
  _QWORD block[4];
  id v104;
  _IDSDeviceConnection *v105;
  objc_super v106;
  uint8_t buf[4];
  _IDSDeviceConnection *v108;
  __int16 v109;
  _BYTE v110[14];
  __int16 v111;
  NSString *v112;
  __int16 v113;
  NSString *v114;
  __int16 v115;
  int v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = a6;
  if (_IDSRunningInDaemon())
  {
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907ECC80();
    goto LABEL_25;
  }
  kdebug_trace();
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "assertQueueIsCurrent");

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1907EEE9C();

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__daemonDied_, CFSTR("__kIDSDaemonDidDisconnectNotification"), 0);

  v106.receiver = self;
  v106.super_class = (Class)_IDSDeviceConnection;
  v18 = -[_IDSDeviceConnection init](&v106, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_socket = -1;
    if (!v18->_awdMetrics)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      awdMetrics = v19->_awdMetrics;
      v19->_awdMetrics = (NSMutableDictionary *)Mutable;

    }
    +[_IDSDeviceConnectionActiveMap sharedInstance](_IDSDeviceConnectionActiveMap, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "getActiveConnectionCount");

    self = (_IDSDeviceConnection *)objc_msgSend(v12, "copy");
    if (queue)
    {
      if (!v10)
        goto LABEL_20;
    }
    else
    {
      queue = MEMORY[0x1E0C80D38];
      v24 = MEMORY[0x1E0C80D38];
      if (!v10)
        goto LABEL_20;
    }
    objc_msgSend(v10, "_internal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "service");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (v23 < 31)
      {
        v99 = v12;
        goto LABEL_30;
      }
      +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1907EEDEC(v10, v23, v27);

      v28 = objc_alloc(MEMORY[0x1E0C99D80]);
      v29 = (void *)objc_msgSend(v28, "initWithObjectsAndKeys:", CFSTR("Too many active connections. Client is leaking sockets."), *MEMORY[0x1E0CB2D50], 0);
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v31 = 58;
LABEL_23:
      v34 = (void *)objc_msgSend(v30, "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), v31, v29);

      if (v34)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1907563B0;
        block[3] = &unk_1E2C60E00;
        v104 = v34;
        v105 = self;
        v13 = v34;
        self = self;
        dispatch_async(queue, block);

LABEL_25:
        v19 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v99 = v12;
      v19 = 0;
LABEL_30:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v36 = objc_claimAutoreleasedReturnValue();
      openSocketCompletionHandlerID = v19->_openSocketCompletionHandlerID;
      v19->_openSocketCompletionHandlerID = (NSString *)v36;

      objc_msgSend(v10, "_internal");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "nsuuid");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "UUIDString");
      v40 = objc_claimAutoreleasedReturnValue();
      nsuuid = v19->_nsuuid;
      v19->_nsuuid = (NSString *)v40;

      objc_msgSend(v10, "_internal");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_isDefaultPairedDevice = objc_msgSend(v42, "isDefaultPairedDevice");

      objc_msgSend(v10, "_internal");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "service");
      v44 = objc_claimAutoreleasedReturnValue();
      service = v19->_service;
      v19->_service = (NSString *)v44;

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "processName");
      v47 = objc_claimAutoreleasedReturnValue();
      clientName = v19->_clientName;
      v19->_clientName = (NSString *)v47;

      v49 = *MEMORY[0x1E0D349E0];
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D349E0]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(v11, "objectForKey:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "copy");
        connectionUUID = v19->_connectionUUID;
        v19->_connectionUUID = (NSString *)v52;

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
        v54 = objc_claimAutoreleasedReturnValue();
        v51 = v19->_connectionUUID;
        v19->_connectionUUID = (NSString *)v54;
      }

      key = (void *)*MEMORY[0x1E0D34A28];
      objc_msgSend(v11, "objectForKey:");
      v13 = objc_claimAutoreleasedReturnValue();
      v97 = v23;
      if (v13)
      {
        objc_msgSend(CFSTR("_"), "stringByAppendingString:", v13);
        v55 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v55 = objc_msgSend((id)*MEMORY[0x1E0D34A20], "copy");
      }
      streamName = v19->_streamName;
      v19->_streamName = (NSString *)v55;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
      v57 = objc_claimAutoreleasedReturnValue();
      serviceToken = v19->_serviceToken;
      v19->_serviceToken = (NSString *)v57;

      v59 = *MEMORY[0x1E0D349D8];
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D349D8]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(v11, "objectForKey:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "copy");
        p_clientTimeout = (void **)&v19->_clientTimeout;
        clientTimeout = v19->_clientTimeout;
        v19->_clientTimeout = (NSNumber *)v62;

        if (-[NSNumber intValue](v19->_clientTimeout, "intValue") > 9)
        {
LABEL_43:
          +[_IDSDeviceConnectionActiveMap sharedInstance](_IDSDeviceConnectionActiveMap, "sharedInstance");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v19->_connectionUUID;
          -[_IDSDeviceConnection deviceConnectionKey](v19, "deviceConnectionKey");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setActiveConnection:forKey:", v69, v70);

          +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            socket = v19->_socket;
            v73 = v19->_streamName;
            v74 = v19->_connectionUUID;
            objc_msgSend(v10, "uniqueID");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219522;
            v108 = v19;
            v109 = 1024;
            *(_DWORD *)v110 = socket;
            *(_WORD *)&v110[4] = 2112;
            *(_QWORD *)&v110[6] = v11;
            v111 = 2112;
            v112 = v73;
            v113 = 2112;
            v114 = v74;
            v115 = 1024;
            v116 = v97;
            v117 = 2112;
            v118 = v75;
            _os_log_impl(&dword_1906E0000, v71, OS_LOG_TYPE_DEFAULT, "<%p> Init connection socket %d with options: %@ (streamName:%@, connectionUUID:%@ active connections:%d), device: %@", buf, 0x40u);

          }
          +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "listener");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "addHandler:", v19);

          -[_IDSDeviceConnection _connect](v19, "_connect");
          v78 = MEMORY[0x19400FE1C](self);
          openSocketCompletionHandler = v19->_openSocketCompletionHandler;
          v19->_openSocketCompletionHandler = (id)v78;

          objc_storeStrong((id *)&v19->_openSocketCompletionHandlerQueue, queue);
          objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D34A30]);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
          v81 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
          v82 = v81;
          v83 = v19->_openSocketCompletionHandlerID;
          if (v83)
            CFDictionarySetValue(v81, CFSTR("completionHandlerID"), v83);
          if (*MEMORY[0x1E0D349B8])
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D349C0], (const void *)*MEMORY[0x1E0D349B8]);
          v84 = v19->_service;
          if (v84)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D34A18], v84);
          v85 = v19->_streamName;
          if (v85)
            CFDictionarySetValue(v82, key, v85);
          objc_msgSend(v10, "_internal");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "uniqueID");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          if (v87)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D349F0], v87);

          +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "listenerID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();

          if (v89)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D349C8], v89);

          v90 = v19->_clientName;
          if (v90)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D349D0], v90);
          v91 = v19->_nsuuid;
          if (v91)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D346A0], v91);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19->_isDefaultPairedDevice);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (v92)
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E0D34650], v92);

          if (v80 && !objc_msgSend(v80, "integerValue"))
          {
            v19->_mtu = 1378;
            -[__CFDictionary setObject:forKey:](v82, "setObject:forKey:", CFSTR("udp"), CFSTR("protocol"));
          }
          +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "openSocketWithOptions:", v82);

          v94 = dispatch_time(0, 1000000000 * -[NSNumber intValue](v19->_clientTimeout, "intValue"));
          +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "queue");
          v96 = objc_claimAutoreleasedReturnValue();
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = sub_1907563C4;
          v101[3] = &unk_1E2C60550;
          v19 = v19;
          v102 = v19;
          dispatch_after(v94, v96, v101);

          v12 = v99;
          goto LABEL_26;
        }
        +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = v19->_clientTimeout;
          *(_DWORD *)buf = 134218242;
          v108 = v19;
          v109 = 2112;
          *(_QWORD *)v110 = v66;
          _os_log_impl(&dword_1906E0000, v65, OS_LOG_TYPE_DEFAULT, "<%p> The client passed the smaller timeout %@ than the default value. IDSDeviceConnection will use the default value.", buf, 0x16u);
        }

      }
      else
      {
        p_clientTimeout = (void **)&v19->_clientTimeout;
      }
      v67 = *p_clientTimeout;
      *p_clientTimeout = &unk_1E2CAE240;

      goto LABEL_43;
    }
LABEL_20:
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1907EED68(v10);

    v33 = objc_alloc(MEMORY[0x1E0C99D80]);
    v29 = (void *)objc_msgSend(v33, "initWithObjectsAndKeys:", CFSTR("Bad parameters. No valid IDSDevice found."), *MEMORY[0x1E0CB2D50], 0);
    v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v31 = 20;
    goto LABEL_23;
  }
LABEL_27:

  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  -[_IDSDeviceConnection _close](self, "_close");
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeListenerID:", self->_serviceToken);

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeHandler:", self);

  -[_IDSDeviceConnection _cleanupCompletionBlock](self, "_cleanupCompletionBlock");
  v7.receiver = self;
  v7.super_class = (Class)_IDSDeviceConnection;
  -[_IDSDeviceConnection dealloc](&v7, sel_dealloc);
}

- (void)_connect
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  NSString *serviceToken;
  void *v10;
  NSObject *v11;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EEFA0();

  }
  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasListenerForID:", self->_serviceToken);

  if ((v7 & 1) == 0)
  {
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    serviceToken = self->_serviceToken;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_service);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(serviceToken) = objc_msgSend(v8, "addListenerID:services:", serviceToken, v10);

    if ((serviceToken & 1) == 0)
    {
      +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1907EEF28();

    }
  }
}

- (int)socket
{
  return self->_socket;
}

- (NSInputStream)inputStream
{
  return self->_inputStreamForSocket;
}

- (NSOutputStream)outputStream
{
  return self->_outputStreamForSocket;
}

- (unint64_t)mtu
{
  return self->_mtu;
}

- (NSDictionary)metrics
{
  NSMutableDictionary *awdMetrics;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  awdMetrics = self->_awdMetrics;
  if (awdMetrics)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345F8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D34600]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345D8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345F0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345E8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    v40 = v6;
    objc_msgSend(v6, "doubleValue");
    v12 = llround((v10 - v11) * 1000.0);
    v39 = v7;
    objc_msgSend(v7, "doubleValue");
    v14 = v13;
    objc_msgSend(v6, "doubleValue");
    v16 = llround((v14 - v15) * 1000.0);
    objc_msgSend(v38, "doubleValue");
    v18 = v17;
    objc_msgSend(v8, "doubleValue");
    v20 = llround((v18 - v19) * 1000.0);
    objc_msgSend(v7, "doubleValue");
    v22 = v21;
    objc_msgSend(v38, "doubleValue");
    v24 = llround((v22 - v23) * 1000.0);
    v37 = (void *)MEMORY[0x1E0C99D80];
    v36 = *MEMORY[0x1E0D34628];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *MEMORY[0x1E0D34630];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D34610];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0D34608];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v20 & ~(v20 >> 63));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x1E0D34620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v41, v36, v25, v26, v27, v28, v29, v30, v31, v32, v33, *MEMORY[0x1E0D34618], 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = 0;
  }
  return (NSDictionary *)v34;
}

- (void)setStreamPairWithInputStream:(id)a3 outputStream:(id)a4
{
  NSInputStream *v7;
  NSOutputStream *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSInputStream *inputStreamForSocket;
  NSOutputStream *v14;
  NSOutputStream **p_outputStreamForSocket;
  NSOutputStream *outputStreamForSocket;
  int v17;
  _IDSDeviceConnection *v18;
  __int16 v19;
  NSInputStream *v20;
  __int16 v21;
  NSOutputStream *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (NSInputStream *)a3;
  v8 = (NSOutputStream *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "assertQueueIsCurrent");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1907EF02C();

  }
  +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134218498;
    v18 = self;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%p> Updating stream pair: %@:%@", (uint8_t *)&v17, 0x20u);
  }

  inputStreamForSocket = self->_inputStreamForSocket;
  if (inputStreamForSocket != v7)
  {
    -[NSInputStream close](inputStreamForSocket, "close");
    objc_storeStrong((id *)&self->_inputStreamForSocket, a3);
  }
  outputStreamForSocket = self->_outputStreamForSocket;
  p_outputStreamForSocket = &self->_outputStreamForSocket;
  v14 = outputStreamForSocket;
  if (outputStreamForSocket != v8)
  {
    -[NSOutputStream close](v14, "close");
    objc_storeStrong((id *)p_outputStreamForSocket, a4);
  }

}

- (BOOL)updateConnectionWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  int v23;
  uint8_t buf[4];
  _IDSDeviceConnection *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assertQueueIsCurrent");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907EF0B8();

  }
  if (self->_socket < 0)
  {
    v17 = objc_alloc(MEMORY[0x1E0C99D80]);
    v11 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", CFSTR("Cannot change priority when not connected"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v14 = 0;
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v11);
      goto LABEL_24;
    }
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D34638]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99D80]);
    v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", CFSTR("Options dictionary contains no valid options"), *MEMORY[0x1E0CB2D50], 0);
LABEL_20:
    v21 = (void *)v19;
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 29, v19);

    goto LABEL_23;
  }
  v12 = objc_msgSend(v10, "integerValue");
  if (v12 != 100 && v12 != 300 && v12 != 200)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v19 = objc_msgSend(v20, "initWithObjectsAndKeys:", CFSTR("Invalid priority level specified"), *MEMORY[0x1E0CB2D50], 0);
    goto LABEL_20;
  }
  v23 = TrafficClassForIDSOpenSocketPriorityLevel();
  v13 = setsockopt(self->_socket, 0xFFFF, 4230, &v23, 4u);
  v14 = v13 == 0;
  if (v13)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D80]);
    v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", CFSTR("Could not set traffic class for underlying socket"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.identityservices.error"), 20, v16);
  }
  else
  {
    +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = self;
      v26 = 1024;
      v27 = v23;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "<%p> Updated socket traffic class: %d", buf, 0x12u);
    }
  }

LABEL_24:
  return v14;
}

- (void)close
{
  void *v3;
  int v4;
  NSObject *v5;

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "assertQueueIsCurrent");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1907EF144();

  }
  -[_IDSDeviceConnection _close](self, "_close");
}

- (void)_close
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int socket;
  NSString *streamName;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *service;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *clientName;
  void *v18;
  NSString *nsuuid;
  void *v20;
  NSString *v21;
  NSMutableDictionary *awdMetrics;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSInputStream *inputStreamForSocket;
  NSInputStream *v28;
  NSOutputStream *outputStreamForSocket;
  _QWORD v30[4];
  _QWORD v31[4];
  uint8_t buf[4];
  _IDSDeviceConnection *v33;
  __int16 v34;
  _WORD v35[17];

  *(_QWORD *)&v35[13] = *MEMORY[0x1E0C80C00];
  if (self->_socket < 0 && !self->_openSocketCompletionHandler)
    return;
  -[_IDSDeviceConnection deviceConnectionKey](self, "deviceConnectionKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_IDSDeviceConnectionActiveMap sharedInstance](_IDSDeviceConnectionActiveMap, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasActiveConnection:forKey:", self->_connectionUUID, v3);

  +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      socket = self->_socket;
      streamName = self->_streamName;
      *(_DWORD *)buf = 134218498;
      v33 = self;
      v34 = 1024;
      *(_DWORD *)v35 = socket;
      v35[2] = 2112;
      *(_QWORD *)&v35[3] = streamName;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Closing socket: %d (name %@)", buf, 0x1Cu);
    }

    v10 = (void *)MEMORY[0x1E0C99E08];
    v11 = *MEMORY[0x1E0D349B8];
    v12 = *MEMORY[0x1E0D34A18];
    v30[0] = *MEMORY[0x1E0D349C0];
    v30[1] = v12;
    service = self->_service;
    v31[0] = v11;
    v31[1] = service;
    v14 = *MEMORY[0x1E0D34A28];
    v15 = *MEMORY[0x1E0D34A20];
    v16 = *MEMORY[0x1E0D349D0];
    v30[2] = *MEMORY[0x1E0D34A28];
    v30[3] = v16;
    clientName = self->_clientName;
    v31[2] = v15;
    v31[3] = clientName;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithDictionary:", v18);
    v6 = objc_claimAutoreleasedReturnValue();

    nsuuid = self->_nsuuid;
    if (nsuuid)
      -[NSObject setObject:forKey:](v6, "setObject:forKey:", nsuuid, *MEMORY[0x1E0D346A0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDefaultPairedDevice);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", v20, *MEMORY[0x1E0D34650]);

    v21 = self->_streamName;
    if (v21)
      -[NSObject setObject:forKey:](v6, "setObject:forKey:", v21, v14);
    awdMetrics = self->_awdMetrics;
    if (awdMetrics)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D345E0]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_awdMetrics, "objectForKeyedSubscript:", *MEMORY[0x1E0D34600]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        -[NSObject setObject:forKey:](v6, "setObject:forKey:", v23, *MEMORY[0x1E0D349A8]);
      if (v24)
        -[NSObject setObject:forKey:](v6, "setObject:forKey:", v24, *MEMORY[0x1E0D349B0]);

    }
    -[NSObject setObject:forKey:](v6, "setObject:forKey:", self->_connectionUUID, *MEMORY[0x1E0D349E0]);
    +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "closeSocketWithOptions:", v6);

    +[_IDSDeviceConnectionActiveMap sharedInstance](_IDSDeviceConnectionActiveMap, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeActiveConnection:forKey:", self->_connectionUUID, v3);
    goto LABEL_19;
  }
  if (v7)
  {
    -[_IDSDeviceConnection deviceConnectionKey](self, "deviceConnectionKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v33 = self;
    v34 = 2112;
    *(_QWORD *)v35 = v26;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Closing socket: skipped, a new connection for this %@", buf, 0x16u);
LABEL_19:

  }
  inputStreamForSocket = self->_inputStreamForSocket;
  if (inputStreamForSocket)
  {
    -[NSInputStream open](inputStreamForSocket, "open");
    -[NSInputStream close](self->_inputStreamForSocket, "close");
    v28 = self->_inputStreamForSocket;
    self->_inputStreamForSocket = 0;

    -[NSOutputStream open](self->_outputStreamForSocket, "open");
    -[NSOutputStream close](self->_outputStreamForSocket, "close");
    outputStreamForSocket = self->_outputStreamForSocket;
    self->_outputStreamForSocket = 0;

  }
  else
  {
    close(self->_socket);
  }
  -[_IDSDeviceConnection _cleanupCompletionBlock](self, "_cleanupCompletionBlock");
  self->_socket = -1;

}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *openSocketCompletionHandlerID;
  NSObject *v14;
  int v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  int socket;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  NSObject *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  __CFString *v28;
  NSString *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *awdMetrics;
  NSMutableDictionary *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  int v38;
  void *v39;
  NSObject *openSocketCompletionHandlerQueue;
  id v41;
  void *v42;
  NSString *connectionUUID;
  void *v44;
  int v45;
  _QWORD block[4];
  id v47;
  id v48;
  int v49;
  uint8_t buf[4];
  _BYTE v51[34];
  __int16 v52;
  NSString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKey:", CFSTR("object-type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToIgnoringCase:", CFSTR("device-socket"));

  if (v9)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("completionHandlerID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("metrics"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      openSocketCompletionHandlerID = self->_openSocketCompletionHandlerID;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v51 = self;
      *(_WORD *)&v51[8] = 2112;
      *(_QWORD *)&v51[10] = openSocketCompletionHandlerID;
      *(_WORD *)&v51[18] = 2112;
      *(_QWORD *)&v51[20] = v10;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_INFO, "<%p> World, id[%@] !=? id[%@]", buf, 0x20u);
    }

    if (!objc_msgSend(v10, "isEqualToString:", self->_openSocketCompletionHandlerID))
      goto LABEL_43;
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v51 = self;
      *(_WORD *)&v51[8] = 2112;
      *(_QWORD *)&v51[10] = v6;
      *(_WORD *)&v51[18] = 2112;
      *(_QWORD *)&v51[20] = v7;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%p> xpc object: [%@] context: [%@]", buf, 0x20u);
    }

    if (v6)
      v15 = xpc_fd_dup(v6);
    else
      v15 = -1;
    self->_socket = v15;
    objc_msgSend(v7, "objectForKey:", CFSTR("error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDSDeviceConnection](IDSLogging, "IDSDeviceConnection");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (!v18)
        goto LABEL_16;
      socket = self->_socket;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v51 = socket;
      *(_WORD *)&v51[4] = 2112;
      *(_QWORD *)&v51[6] = v16;
      v20 = "Received XPC Response/Socket: %d    Error: %@";
      v21 = v17;
      v22 = 18;
    }
    else
    {
      if (!v18)
        goto LABEL_16;
      v23 = self->_socket;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v51 = v23;
      v20 = "Received XPC Response/Socket: %d";
      v21 = v17;
      v22 = 8;
    }
    _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_16:

    +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v15;
      v25 = v11;
      v26 = self->_socket;
      if (v26 == -1)
        v27 = CFSTR("NO");
      else
        v27 = CFSTR("YES");
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %@"), v16);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = &stru_1E2C65AE8;
      }
      v29 = self->_openSocketCompletionHandlerID;
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)v51 = self;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)&v51[10] = v26;
      *(_WORD *)&v51[14] = 2112;
      *(_QWORD *)&v51[16] = v27;
      *(_WORD *)&v51[24] = 2112;
      *(_QWORD *)&v51[26] = v28;
      v52 = 2112;
      v53 = v29;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "<%p> Opened socket: %d (Success: %@) %@ (%@)", buf, 0x30u);
      if (v16)

      v11 = v25;
      v15 = v45;
    }

    if (!self->_awdMetrics)
      goto LABEL_35;
    if (v11)
    {
      v30 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
      awdMetrics = self->_awdMetrics;
      self->_awdMetrics = v30;

    }
    if (v15 == -1)
    {
      v32 = self->_awdMetrics;
    }
    else
    {
      v32 = self->_awdMetrics;
      if (!self->_hasTimedOut)
      {
        v33 = *MEMORY[0x1E0D34600];
        v34 = MEMORY[0x1E0C9AAB0];
LABEL_34:
        -[NSMutableDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, v33);
        v35 = (void *)MEMORY[0x1E0CB37E8];
        ids_monotonic_time();
        objc_msgSend(v35, "numberWithDouble:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_awdMetrics, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D345E0]);

LABEL_35:
        if (self->_hasTimedOut)
        {
          +[IDSTransportLog IDSDeviceConnection](IDSTransportLog, "IDSDeviceConnection");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = self->_socket;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v51 = v38;
            _os_log_impl(&dword_1906E0000, v37, OS_LOG_TYPE_DEFAULT, "Open socket request already timed out, closing %d.", buf, 8u);
          }

          -[_IDSDeviceConnection close](self, "close");
        }
        else
        {
          v39 = (void *)MEMORY[0x19400FE1C](self->_openSocketCompletionHandler);
          openSocketCompletionHandlerQueue = self->_openSocketCompletionHandlerQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1907578CC;
          block[3] = &unk_1E2C62E20;
          v41 = v39;
          v48 = v41;
          v49 = v15;
          v47 = v16;
          dispatch_async(openSocketCompletionHandlerQueue, block);
          -[_IDSDeviceConnection _cleanupCompletionBlock](self, "_cleanupCompletionBlock");
          if (v16)
          {
            +[_IDSDeviceConnectionActiveMap sharedInstance](_IDSDeviceConnectionActiveMap, "sharedInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            connectionUUID = self->_connectionUUID;
            -[_IDSDeviceConnection deviceConnectionKey](self, "deviceConnectionKey");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeActiveConnection:forKey:", connectionUUID, v44);

          }
        }

LABEL_43:
        goto LABEL_44;
      }
    }
    v33 = *MEMORY[0x1E0D34600];
    v34 = MEMORY[0x1E0C9AAA0];
    goto LABEL_34;
  }
LABEL_44:

}

- (void)_cleanupCompletionBlock
{
  id openSocketCompletionHandler;
  OS_dispatch_queue *openSocketCompletionHandlerQueue;
  NSString *openSocketCompletionHandlerID;

  openSocketCompletionHandler = self->_openSocketCompletionHandler;
  if (openSocketCompletionHandler)
  {
    self->_openSocketCompletionHandler = 0;

  }
  openSocketCompletionHandlerQueue = self->_openSocketCompletionHandlerQueue;
  if (openSocketCompletionHandlerQueue)
  {
    self->_openSocketCompletionHandlerQueue = 0;

  }
  openSocketCompletionHandlerID = self->_openSocketCompletionHandlerID;
  if (openSocketCompletionHandlerID)
  {
    self->_openSocketCompletionHandlerID = 0;

  }
}

- (void)_daemonDied:(id)a3
{
  void *v4;
  _QWORD v5[5];

  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1907579D8;
  v5[3] = &unk_1E2C60550;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (id)deviceConnectionKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->_service, self->_streamName);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdMetrics, 0);
  objc_storeStrong((id *)&self->_clientTimeout, 0);
  objc_storeStrong((id *)&self->_outputStreamForSocket, 0);
  objc_storeStrong((id *)&self->_inputStreamForSocket, 0);
  objc_storeStrong((id *)&self->_openSocketCompletionHandlerID, 0);
  objc_storeStrong((id *)&self->_openSocketCompletionHandlerQueue, 0);
  objc_storeStrong(&self->_openSocketCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_nsuuid, 0);
}

@end
