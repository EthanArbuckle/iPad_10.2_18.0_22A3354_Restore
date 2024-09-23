@implementation NMSMessageCenter

+ (BOOL)messageWindowCountEnabled
{
  return NMSMessageCountWindowEnabled;
}

+ (void)setMessageWindowCountEnabled:(BOOL)a3
{
  NMSMessageCountWindowEnabled = a3;
}

- (NMSMessageCenter)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("-[%@ init] is not supported."), v6);

  return 0;
}

- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3 launchOnDemandNotification:(id)a4 cacheFolderPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NMSMessageCenter *v11;
  uint64_t v12;
  NSString *serviceIdentifier;
  uint64_t v14;
  NSString *launchNotification;
  NMSMessageCenter *v16;
  id v17;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  uint64_t v23;
  NSMutableDictionary *requestHandlers;
  uint64_t v25;
  NSMutableDictionary *errorHandlers;
  uint64_t v27;
  NSMutableDictionary *responseHandlers;
  uint64_t v29;
  NSMutableDictionary *pbMapping;
  os_activity_t v31;
  OS_os_activity *transportActivity;
  _SYMultiSuspendableQueue *v33;
  void *v34;
  uint64_t v35;
  _SYMultiSuspendableQueue *idsIncomingQueue;
  void *v37;
  void *v38;
  NMSPersistentDictionary *v39;
  NMSPersistentDictionary *persistentContextStore;
  dispatch_source_t v41;
  OS_dispatch_source *expireTimer;
  NSObject *v43;
  uint64_t v44;
  NMSWindowData *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NMSWindowData *windowData;
  NMSWindowData *v51;
  _NMSDispatchQueue *v52;
  _NMSDispatchQueue *windowQueue;
  NMSWindowData *v54;
  dispatch_source_t v55;
  OS_dispatch_source *windowTimeout;
  NSObject *v57;
  unint64_t currentBytesInFlight;
  NSObject *v59;
  NMSMessageCenter *v60;
  id v62;
  id v63;
  objc_super v64;
  uint8_t buf[8];
  uint64_t v66;
  void (*v67)(uint64_t);
  void *v68;
  id v69;
  _QWORD handler[4];
  id v71;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v64.receiver = self;
  v64.super_class = (Class)NMSMessageCenter;
  v11 = -[NMSMessageCenter init](&v64, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    serviceIdentifier = v11->_serviceIdentifier;
    v11->_serviceIdentifier = (NSString *)v12;

    v63 = v9;
    v14 = objc_msgSend(v9, "copy");
    launchNotification = v11->_launchNotification;
    v11->_launchNotification = (NSString *)v14;

    v16 = v11;
    v62 = v10;
    v17 = v10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NMSQ.%@"), v11->_serviceIdentifier);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v21;

    v16->_resumed = 0;
    v23 = objc_opt_new();
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = (NSMutableDictionary *)v23;

    v25 = objc_opt_new();
    errorHandlers = v16->_errorHandlers;
    v16->_errorHandlers = (NSMutableDictionary *)v25;

    v27 = objc_opt_new();
    responseHandlers = v16->_responseHandlers;
    v16->_responseHandlers = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    pbMapping = v16->_pbMapping;
    v16->_pbMapping = (NSMutableDictionary *)v29;

    v31 = _os_activity_create(&dword_211704000, "Nano Messaging Service", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
    transportActivity = v16->_transportActivity;
    v16->_transportActivity = (OS_os_activity *)v31;

    v33 = [_SYMultiSuspendableQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NMSQ.%@.Incoming"), v11->_serviceIdentifier);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:](v33, "initWithName:qosClass:serial:target:", v34, 0, 1, v16->_queue);
    idsIncomingQueue = v16->_idsIncomingQueue;
    v16->_idsIncomingQueue = (_SYMultiSuspendableQueue *)v35;

    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nms.%@.db"), v11->_serviceIdentifier);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = -[NMSPersistentDictionary initWithPath:objectClass:loggingFacility:]([NMSPersistentDictionary alloc], "initWithPath:objectClass:loggingFacility:", v38, objc_opt_class(), 0);
    }
    else
    {
      v39 = -[NMSPersistentDictionary initWithSharedDBForService:objectClass:]([NMSPersistentDictionary alloc], "initWithSharedDBForService:objectClass:", v11->_serviceIdentifier, objc_opt_class());
      v38 = 0;
    }
    persistentContextStore = v16->_persistentContextStore;
    v16->_persistentContextStore = v39;

    objc_initWeak(location, v16);
    v41 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v16->_queue);
    expireTimer = v16->_expireTimer;
    v16->_expireTimer = (OS_dispatch_source *)v41;

    v43 = v16->_expireTimer;
    v44 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ___SharedInit_block_invoke;
    handler[3] = &unk_24CC655F8;
    objc_copyWeak(&v71, location);
    dispatch_source_set_event_handler(v43, handler);
    if (v38)
    {
      v45 = [NMSWindowData alloc];
      objc_msgSend(v38, "stringByDeletingLastPathComponent");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-window"), v11->_serviceIdentifier);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringByAppendingPathComponent:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[NMSWindowData initWithPath:logFacility:](v45, "initWithPath:logFacility:", v48, 0);
      windowData = v16->_windowData;
      v16->_windowData = (NMSWindowData *)v49;

    }
    else
    {
      v51 = -[NMSWindowData initWithSharedDBForServiceName:]([NMSWindowData alloc], "initWithSharedDBForServiceName:", v11->_serviceIdentifier);
      v46 = v16->_windowData;
      v16->_windowData = v51;
    }

    v52 = -[_NMSDispatchQueue initWithName:attributes:target:]([_NMSDispatchQueue alloc], "initWithName:attributes:target:", CFSTR("com.apple.private.NanoMessagingService.WindowQueue"), 0, v16->_queue);
    windowQueue = v16->_windowQueue;
    v16->_windowQueue = v52;

    v54 = v16->_windowData;
    if (v54)
    {
      v16->_currentBytesInFlight = -[NMSWindowData lengthOfAllMessagesInFlight](v54, "lengthOfAllMessagesInFlight");
      v55 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v16->_queue);
      windowTimeout = v16->_windowTimeout;
      v16->_windowTimeout = (OS_dispatch_source *)v55;

      v57 = v16->_windowTimeout;
      *(_QWORD *)buf = v44;
      v66 = 3221225472;
      v67 = ___SharedInit_block_invoke_2;
      v68 = &unk_24CC655F8;
      objc_copyWeak(&v69, location);
      dispatch_source_set_event_handler(v57, buf);
      -[NMSMessageCenter setEnableTransmissionWindow:](v16, "setEnableTransmissionWindow:", 1);
      -[NMSMessageCenter setMaxMessagesInFlight:](v16, "setMaxMessagesInFlight:", 20);
      -[NMSMessageCenter setMinMessagesInFlight:](v16, "setMinMessagesInFlight:", 10);
      -[NMSMessageCenter setMaxBytesInFlight:](v16, "setMaxBytesInFlight:", 5000000);
      -[NMSMessageCenter setWindowResponseTimeout:](v16, "setWindowResponseTimeout:", 600.0);
      currentBytesInFlight = v16->_currentBytesInFlight;
      if (currentBytesInFlight >= -[NMSMessageCenter maxBytesInFlight](v16, "maxBytesInFlight"))
        -[_NMSDispatchQueue suspend](v16->_windowQueue, "suspend");
      -[NMSMessageCenter _timeoutWindowedMessages](v16, "_timeoutWindowedMessages");
      objc_destroyWeak(&v69);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v59 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v59, OS_LOG_TYPE_DEFAULT, "Failed to create NMSWindowData object, so transmission window is forcibly disabled.", buf, 2u);
      }
      -[NMSMessageCenter setEnableTransmissionWindow:](v16, "setEnableTransmissionWindow:", 0);
    }
    objc_destroyWeak(&v71);
    objc_destroyWeak(location);

    v60 = v16;
    v9 = v63;
    v10 = v62;
  }

  return v11;
}

- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3
{
  id v4;
  NMSMessageCenter *v5;
  uint64_t v6;
  NSString *serviceIdentifier;
  NMSMessageCenter *v8;
  id v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSMutableDictionary *requestHandlers;
  uint64_t v16;
  NSMutableDictionary *errorHandlers;
  uint64_t v18;
  NSMutableDictionary *responseHandlers;
  uint64_t v20;
  NSMutableDictionary *pbMapping;
  os_activity_t v22;
  OS_os_activity *transportActivity;
  _SYMultiSuspendableQueue *v24;
  void *v25;
  uint64_t v26;
  _SYMultiSuspendableQueue *idsIncomingQueue;
  NMSPersistentDictionary *v28;
  NMSPersistentDictionary *persistentContextStore;
  dispatch_source_t v30;
  OS_dispatch_source *expireTimer;
  NSObject *v32;
  uint64_t v33;
  NMSWindowData *v34;
  NMSWindowData *windowData;
  _NMSDispatchQueue *v36;
  _NMSDispatchQueue *windowQueue;
  NMSWindowData *v38;
  dispatch_source_t v39;
  OS_dispatch_source *windowTimeout;
  NSObject *v41;
  unint64_t currentBytesInFlight;
  NSObject *v43;
  NMSMessageCenter *v44;
  objc_super v46;
  uint8_t buf[8];
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  id v51[2];
  _QWORD handler[4];
  id v53;
  id location;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)NMSMessageCenter;
  v5 = -[NMSMessageCenter init](&v46, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v6;

    v8 = v5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NMSQ.%@"), v5->_serviceIdentifier);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    v8->_resumed = 0;
    v14 = objc_opt_new();
    requestHandlers = v8->_requestHandlers;
    v8->_requestHandlers = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    errorHandlers = v8->_errorHandlers;
    v8->_errorHandlers = (NSMutableDictionary *)v16;

    v18 = objc_opt_new();
    responseHandlers = v8->_responseHandlers;
    v8->_responseHandlers = (NSMutableDictionary *)v18;

    v20 = objc_opt_new();
    pbMapping = v8->_pbMapping;
    v8->_pbMapping = (NSMutableDictionary *)v20;

    v22 = _os_activity_create(&dword_211704000, "Nano Messaging Service", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
    transportActivity = v8->_transportActivity;
    v8->_transportActivity = (OS_os_activity *)v22;

    v24 = [_SYMultiSuspendableQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NMSQ.%@.Incoming"), v5->_serviceIdentifier);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_SYMultiSuspendableQueue initWithName:qosClass:serial:target:](v24, "initWithName:qosClass:serial:target:", v25, 0, 1, v8->_queue);
    idsIncomingQueue = v8->_idsIncomingQueue;
    v8->_idsIncomingQueue = (_SYMultiSuspendableQueue *)v26;

    v28 = -[NMSPersistentDictionary initWithSharedDBForService:objectClass:]([NMSPersistentDictionary alloc], "initWithSharedDBForService:objectClass:", v5->_serviceIdentifier, objc_opt_class());
    persistentContextStore = v8->_persistentContextStore;
    v8->_persistentContextStore = v28;

    objc_initWeak(&location, v8);
    v30 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v8->_queue);
    expireTimer = v8->_expireTimer;
    v8->_expireTimer = (OS_dispatch_source *)v30;

    v32 = v8->_expireTimer;
    v33 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = ___SharedInit_block_invoke;
    handler[3] = &unk_24CC655F8;
    objc_copyWeak(&v53, &location);
    dispatch_source_set_event_handler(v32, handler);
    v34 = -[NMSWindowData initWithSharedDBForServiceName:]([NMSWindowData alloc], "initWithSharedDBForServiceName:", v5->_serviceIdentifier);
    windowData = v8->_windowData;
    v8->_windowData = v34;

    v36 = -[_NMSDispatchQueue initWithName:attributes:target:]([_NMSDispatchQueue alloc], "initWithName:attributes:target:", CFSTR("com.apple.private.NanoMessagingService.WindowQueue"), 0, v8->_queue);
    windowQueue = v8->_windowQueue;
    v8->_windowQueue = v36;

    v38 = v8->_windowData;
    if (v38)
    {
      v8->_currentBytesInFlight = -[NMSWindowData lengthOfAllMessagesInFlight](v38, "lengthOfAllMessagesInFlight");
      v39 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v8->_queue);
      windowTimeout = v8->_windowTimeout;
      v8->_windowTimeout = (OS_dispatch_source *)v39;

      v41 = v8->_windowTimeout;
      *(_QWORD *)buf = v33;
      v48 = 3221225472;
      v49 = ___SharedInit_block_invoke_2;
      v50 = &unk_24CC655F8;
      objc_copyWeak(v51, &location);
      dispatch_source_set_event_handler(v41, buf);
      -[NMSMessageCenter setEnableTransmissionWindow:](v8, "setEnableTransmissionWindow:", 1);
      -[NMSMessageCenter setMaxMessagesInFlight:](v8, "setMaxMessagesInFlight:", 20);
      -[NMSMessageCenter setMinMessagesInFlight:](v8, "setMinMessagesInFlight:", 10);
      -[NMSMessageCenter setMaxBytesInFlight:](v8, "setMaxBytesInFlight:", 5000000);
      -[NMSMessageCenter setWindowResponseTimeout:](v8, "setWindowResponseTimeout:", 600.0);
      currentBytesInFlight = v8->_currentBytesInFlight;
      if (currentBytesInFlight >= -[NMSMessageCenter maxBytesInFlight](v8, "maxBytesInFlight"))
        -[_NMSDispatchQueue suspend](v8->_windowQueue, "suspend");
      -[NMSMessageCenter _timeoutWindowedMessages](v8, "_timeoutWindowedMessages");
      objc_destroyWeak(v51);
    }
    else
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v43 = qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211704000, v43, OS_LOG_TYPE_DEFAULT, "Failed to create NMSWindowData object, so transmission window is forcibly disabled.", buf, 2u);
      }
      -[NMSMessageCenter setEnableTransmissionWindow:](v8, "setEnableTransmissionWindow:", 0);
    }
    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);

    v44 = v8;
  }

  return v5;
}

- (void)dealloc
{
  NSObject *expireTimer;
  NSObject *windowTimeout;
  __CFString *loggingFacility;
  objc_super v6;

  expireTimer = self->_expireTimer;
  if (expireTimer)
  {
    dispatch_source_cancel(expireTimer);
    if (!self->_service)
      dispatch_resume((dispatch_object_t)self->_expireTimer);
  }
  windowTimeout = self->_windowTimeout;
  if (windowTimeout)
    dispatch_source_cancel(windowTimeout);
  loggingFacility = self->_loggingFacility;
  if (loggingFacility)
    CFRelease(loggingFacility);
  if (self->_resumed)
    -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
  v6.receiver = self;
  v6.super_class = (Class)NMSMessageCenter;
  -[NMSMessageCenter dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p identifier:%@>"), v5, self, self->_serviceIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_setNextWindowTimeoutFireDate
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  dispatch_time_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[NMSWindowData dateOfNextMessageExpiry](self->_windowData, "dateOfNextMessageExpiry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    if (v5 > 0.0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v6 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        objc_msgSend(v4, "timeIntervalSinceNow");
        v11 = 138543618;
        v12 = v4;
        v13 = 2048;
        v14 = v8;
        _os_log_impl(&dword_211704000, v7, OS_LOG_TYPE_INFO, "Setting next expiry timer fire date to '%{public}@' (%.02f seconds from now)", (uint8_t *)&v11, 0x16u);

      }
      objc_msgSend(v4, "timeIntervalSinceNow");
      v10 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_windowTimeout, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }

}

- (void)setEnableTransmissionWindow:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_enableTransmissionWindow != a3)
  {
    if (a3)
    {
      if (self->_windowData)
      {
        self->_enableTransmissionWindow = a3;
        -[NMSMessageCenter _setNextWindowTimeoutFireDate](self, "_setNextWindowTimeoutFireDate");
        dispatch_resume((dispatch_object_t)self->_windowTimeout);
      }
      else
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v4 = qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_211704000, v4, OS_LOG_TYPE_DEFAULT, "Not enabling the transmission window, because we were unable to create the window metadata DB.", v5, 2u);
        }
      }
    }
    else
    {
      self->_enableTransmissionWindow = 0;
      dispatch_suspend((dispatch_object_t)self->_windowTimeout);
    }
  }
}

- (void)_timeoutWindowedMessages
{
  unint64_t currentBytesInFlight;
  _BOOL4 v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  currentBytesInFlight = self->_currentBytesInFlight;
  v4 = currentBytesInFlight >= -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight")
    || -[_NMSDispatchQueue isSuspended](self->_windowQueue, "isSuspended");
  -[NMSWindowData expiredMessageIDs](self->_windowData, "expiredMessageIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSWindowData removeAndReturnLengthOfMessagesWithIDs:](self->_windowData, "removeAndReturnLengthOfMessagesWithIDs:", v5);
  self->_currentBytesInFlight = 0;
  if (v4 && -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight"))
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v6 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_currentBytesInFlight;
      v8 = v6;
      v9 = 134218240;
      v10 = v7;
      v11 = 2048;
      v12 = -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight");
      _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Opening window on message timeout: %lu bytes in flight, %lu max", (uint8_t *)&v9, 0x16u);

    }
    -[_NMSDispatchQueue resume](self->_windowQueue, "resume");
  }
  -[NMSMessageCenter _setNextWindowTimeoutFireDate](self, "_setNextWindowTimeoutFireDate");

}

- (id)requestHandlers
{
  return self->_requestHandlers;
}

- (id)errorHandlers
{
  return self->_errorHandlers;
}

- (id)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OS_dispatch_queue *v15;
  NSObject *delegateQueue;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *v18;
  id v19;

  v19 = a4;
  v7 = !self->_resumed;
  v8 = a3;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(v7, a2, CFSTR("Cannot use %@ after using -resume"), v10, v11, v12, v13, v14, (uint64_t)v9);

  -[NMSMessageCenter setDelegate:](self, "setDelegate:", v8);
  if (v19)
  {
    v15 = (OS_dispatch_queue *)v19;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v15;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    delegateQueue = objc_claimAutoreleasedReturnValue();
    v17 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.companionsync.nano-messaging-center.default-delegate-queue", delegateQueue, 0);
    v18 = self->_delegateQueue;
    self->_delegateQueue = v17;

  }
}

- (void)addRequestHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *requestHandlers;
  void *v16;
  id v17;

  v4 = a3;
  v7 = !self->_resumed;
  v8 = a4;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(v7, a2, CFSTR("Cannot use %@ after using -resume"), v10, v11, v12, v13, v14, (uint64_t)v9);

  v17 = (id)objc_msgSend(v8, "copy");
  requestHandlers = self->_requestHandlers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestHandlers, "setObject:forKeyedSubscript:", v17, v16);

}

- (void)addErrorHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *errorHandlers;
  void *v16;
  id v17;

  v4 = a3;
  v7 = !self->_resumed;
  v8 = a4;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(v7, a2, CFSTR("Cannot use %@ after using -resume"), v10, v11, v12, v13, v14, (uint64_t)v9);

  v17 = (id)objc_msgSend(v8, "copy");
  errorHandlers = self->_errorHandlers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](errorHandlers, "setObject:forKeyedSubscript:", v17, v16);

}

- (void)addResponseHandler:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *responseHandlers;
  void *v16;
  id v17;

  v4 = a3;
  v7 = !self->_resumed;
  v8 = a4;
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(v7, a2, CFSTR("Cannot use %@ after using -resume"), v10, v11, v12, v13, v14, (uint64_t)v9);

  v17 = (id)objc_msgSend(v8, "copy");
  responseHandlers = self->_responseHandlers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](responseHandlers, "setObject:forKeyedSubscript:", v17, v16);

}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *pbMapping;
  void *v18;
  id v19;

  v5 = a5;
  v10 = !self->_resumed;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(v10, a2, CFSTR("Cannot use %@ after using -resume"), v12, v13, v14, v15, v16, (uint64_t)v11);

  v19 = (id)objc_opt_new();
  objc_msgSend(v19, "setRequestClass:", a3);
  objc_msgSend(v19, "setResponseClass:", a4);
  pbMapping = self->_pbMapping;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pbMapping, "setObject:forKeyedSubscript:", v19, v18);

}

- (id)_pbMappingForMessageID:(unsigned __int16)a3
{
  NSMutableDictionary *pbMapping;
  void *v4;
  void *v5;

  pbMapping = self->_pbMapping;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pbMapping, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_currentBytesInFlight
{
  return self->_currentBytesInFlight;
}

- (void)_checkForSwitch
{
  void *v3;
  void *v4;
  void *v5;
  NMSPersistentDictionary *persistentContextStore;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  self->_checkedForQWS = 1;
  +[SYDevice targetableDevice](SYDevice, "targetableDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastActiveDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
    persistentContextStore = self->_persistentContextStore;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __35__NMSMessageCenter__checkForSwitch__block_invoke;
    v24[3] = &unk_24CC66B20;
    v25 = v4;
    v7 = v5;
    v26 = v7;
    -[NMSPersistentDictionary enumerateObjectsSortedByEnqueueDate:](persistentContextStore, "enumerateObjectsSortedByEnqueueDate:", v24);
    -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
    if (objc_msgSend(v7, "count"))
    {
      v18 = v4;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("NMSErrorDomain"), 7, 0);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v17 = v7;
      obj = v7;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v14 = (void *)qword_253D84AC0;
            if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
            {
              v15 = v14;
              objc_msgSend(v13, "description");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v28 = v16;
              _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Message dropped by QWS: %@", buf, 0xCu);

            }
            -[NMSMessageCenter _handleError:context:](self, "_handleError:context:", v8, v13, v17);
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v10);
      }

      v7 = v17;
      v4 = v18;
    }

  }
}

void __35__NMSMessageCenter__checkForSwitch__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, _BYTE *a6)
{
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(a4, "laterDate:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);

  if (v9 == v10)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  else
    *a6 = 1;

}

- (void)_expireMessages
{
  void *v3;
  void *v4;
  void *v5;
  NMSPersistentDictionary *persistentContextStore;
  void *v7;
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NMSPersistentDictionary *v14;
  __int128 v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_checkedForQWS)
    -[NMSMessageCenter _checkForSwitch](self, "_checkForSwitch");
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSErrorDomain"), 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x212BE0D64](-[NMSPersistentDictionary lock](self->_persistentContextStore, "lock"));
  persistentContextStore = self->_persistentContextStore;
  v16 = 0;
  -[NMSPersistentDictionary objectWithOldestExpirationDate:](persistentContextStore, "objectWithOldestExpirationDate:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    *(_QWORD *)&v9 = 138412290;
    v15 = v9;
    do
    {
      objc_msgSend(v8, "laterDate:", v4, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v4)
        break;
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v11 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        objc_msgSend(v7, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v15;
        v18 = v13;
        _os_log_impl(&dword_211704000, v12, OS_LOG_TYPE_DEFAULT, "Expired message: %@", buf, 0xCu);

      }
      -[NMSMessageCenter _handleError:context:locked:](self, "_handleError:context:locked:", v3, v7, 1);

      objc_autoreleasePoolPop(v5);
      v5 = (void *)MEMORY[0x212BE0D64]();
      v14 = self->_persistentContextStore;
      v16 = 0;
      -[NMSPersistentDictionary objectWithOldestExpirationDate:](v14, "objectWithOldestExpirationDate:", &v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16;
    }
    while (v7);

  }
  objc_autoreleasePoolPop(v5);
  -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");

}

- (void)_updateExpireTimerWithDate:(id)a3
{
  id v4;
  id v5;
  NSObject *expireTimer;
  double v7;
  dispatch_time_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!self->_nextExpireTimerFireDate
    || (objc_msgSend(v4, "earlierDate:"),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 = v9,
        v5 == v9))
  {
    expireTimer = self->_expireTimer;
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v7 >= 0.0)
      v8 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
    else
      v8 = dispatch_time(0, 0);
    dispatch_source_set_timer(expireTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v4 = v9;
  }

}

- (void)resume
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_211704000, a2, OS_LOG_TYPE_FAULT, "-[IDSService initWithService:%{public}@] returned nil!", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (IDSService)idsService
{
  return self->_service;
}

- (OS_dispatch_queue)actionQ
{
  return self->_queue;
}

- (void)dropExtantMessages
{
  -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
  -[NMSPersistentDictionary removeAllObjects](self->_persistentContextStore, "removeAllObjects");
  -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
}

- (void)suspendIncomingMessages
{
  -[_SYMultiSuspendableQueue suspend](self->_idsIncomingQueue, "suspend");
}

- (void)resumeIncomingMessages
{
  -[_SYMultiSuspendableQueue resume](self->_idsIncomingQueue, "resume");
}

- (id)_buildDataForRequest:(id)a3 options:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  NSMutableDictionary *responseHandlers;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int16 v24;
  char v25;

  v6 = a3;
  v24 = objc_msgSend(v6, "messageID");
  v25 = objc_msgSend(v6, "priority");
  v7 = objc_alloc(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v6, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "length") + 3);

  objc_msgSend(v9, "appendBytes:length:", &v24, 3);
  objc_msgSend(v6, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(v6, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendData:", v12);

  }
  if (a4)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
    objc_msgSend(v6, "sendTimeout");
    if (v14 > 0.0)
    {
      v15 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "sendTimeout");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE4FB30]);

      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA90]);
    }
    if (objc_msgSend(v6, "shouldEncrypt"))
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FA88]);
    responseHandlers = self->_responseHandlers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v6, "messageID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](responseHandlers, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAA0]);
    objc_msgSend(v6, "extraIDSOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "extraIDSOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addEntriesFromDictionary:", v21);

    }
    if (-[NMSMessageCenter enableTransmissionWindow](self, "enableTransmissionWindow"))
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FB48]);
    v22 = objc_retainAutorelease(v13);
    *a4 = v22;

  }
  return v9;
}

- (id)_buildDataForResponse:(id)a3 options:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int16 v23;

  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v7, "messageID");
  v8 = objc_alloc(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v6, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "length") + 2);

  objc_msgSend(v10, "appendBytes:length:", &v23, 2);
  objc_msgSend(v6, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v6, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendData:", v13);

  }
  if (a4)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(v6, "sendTimeout");
    if (v15 > 0.0)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v6, "sendTimeout");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE4FB30]);

    }
    objc_msgSend(v7, "idsIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE4FAF0]);

    objc_msgSend(v6, "extraIDSOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "extraIDSOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v20);

    }
    if (-[NMSMessageCenter enableTransmissionWindow](self, "enableTransmissionWindow"))
      objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FB48]);
    v21 = objc_retainAutorelease(v14);
    *a4 = v21;

  }
  return v10;
}

- (id)_decodeIncomingRequestData:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int16 *v9;
  uint64_t v10;
  uint64_t v11;
  NMSIncomingRequest *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (unsigned __int16 *)objc_msgSend(v8, "bytes");
  v10 = *v9;
  v11 = *((unsigned __int8 *)v9 + 2);
  v12 = objc_alloc_init(NMSIncomingRequest);
  -[NMSIncomingRequest setMessageCenter:](v12, "setMessageCenter:", self);
  -[NMSIncomingRequest setMessageID:](v12, "setMessageID:", v10);
  if (objc_msgSend(v7, "expectsPeerResponse"))
  {
    objc_msgSend(v7, "outgoingResponseIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      -[NMSMessageCenter _decodeIncomingRequestData:context:].cold.1();

  }
  objc_msgSend(v7, "outgoingResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingRequest setIdsIdentifier:](v12, "setIdsIdentifier:", v14);

  -[NMSIncomingRequest setPriority:](v12, "setPriority:", v11);
  -[NMSIncomingRequest setExpectsResponse:](v12, "setExpectsResponse:", objc_msgSend(v7, "expectsPeerResponse"));
  objc_msgSend(v8, "subdataWithRange:", 3, objc_msgSend(v8, "length") - 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSIncomingRequest setData:](v12, "setData:", v15);

  -[NMSIncomingRequest setIdsContext:](v12, "setIdsContext:", v7);
  return v12;
}

- (void)sendRequest:(id)a3
{
  id v5;
  char resumed;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDSService *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _BOOL4 v19;
  const char *v20;
  _NMSDispatchQueue *windowQueue;
  _QWORD v22[4];
  id v23;
  IDSService *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  resumed = self->_resumed;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(resumed, a2, CFSTR("Cannot use %@ until after -resume is sent"), v8, v9, v10, v11, v12, (uint64_t)v7);

  v13 = self->_service;
  if (v13)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v5, "pbRequest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_NMSDispatchQueue isSuspended](self->_windowQueue, "isSuspended");
      v20 = "not ";
      if (v19)
        v20 = "";
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2080;
      v29 = v20;
      _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_INFO, "Sending %{public}@, NMS window queue is %ssuspended", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    windowQueue = self->_windowQueue;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __32__NMSMessageCenter_sendRequest___block_invoke;
    v22[3] = &unk_24CC65D50;
    objc_copyWeak(&v25, (id *)buf);
    v23 = v5;
    v24 = v13;
    -[_NMSDispatchQueue async:](windowQueue, "async:", v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[NMSMessageCenter sendRequest:].cold.1();
  }

}

void __32__NMSMessageCenter_sendRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  __int128 v44;
  void *v45;
  _QWORD block[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  _BYTE v53[24];
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (shouldLogTraffic())
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v3 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(a1 + 32);
        v5 = v3;
        objc_msgSend(v4, "CPObfuscatedDescriptionObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v53 = v7;
        _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Sending request: %{public}@", buf, 0xCu);

      }
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      __32__NMSMessageCenter_sendRequest___block_invoke_cold_2(a1, v8);
    objc_msgSend(*(id *)(a1 + 32), "targetDeviceIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FD60]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = *(_QWORD *)(a1 + 32);
    v51 = 0;
    objc_msgSend(WeakRetained, "_buildDataForRequest:options:", v10, &v51);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v51;
    v13 = (void *)*((_QWORD *)WeakRetained + 8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    *((_QWORD *)&v44 + 1) = objc_claimAutoreleasedReturnValue();

    v15 = (void *)*((_QWORD *)WeakRetained + 7);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    *(_QWORD *)&v44 = objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(*(id *)(a1 + 32), "priority");
    v18 = 200;
    if (v17 == 1)
      v18 = 100;
    if (v17 == 2)
      v19 = 300;
    else
      v19 = v18;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      __32__NMSMessageCenter_sendRequest___block_invoke_cold_1();
    v20 = *(void **)(a1 + 40);
    v49 = 0;
    v50 = 0;
    v21 = objc_msgSend(v20, "sendData:toDestinations:priority:options:identifier:error:", v11, v9, v19, v12, &v50, &v49);
    v22 = v50;
    v23 = v49;
    if (v21 && objc_msgSend(WeakRetained, "enableTransmissionWindow"))
    {
      v24 = (void *)*((_QWORD *)WeakRetained + 14);
      v25 = objc_msgSend(v11, "length");
      objc_msgSend(WeakRetained, "windowResponseTimeout");
      objc_msgSend(v24, "addMessageWithID:ofLength:timeoutTime:", v22, v25);
      v26 = *((_QWORD *)WeakRetained + 13) + objc_msgSend(v11, "length");
      *((_QWORD *)WeakRetained + 13) = v26;
      if (v26 >= objc_msgSend(WeakRetained, "maxBytesInFlight"))
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v27 = (void *)qword_253D84AC0;
        if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *((_QWORD *)WeakRetained + 13);
          v29 = v27;
          v30 = objc_msgSend(WeakRetained, "maxBytesInFlight");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v53 = v28;
          *(_WORD *)&v53[8] = 2048;
          *(_QWORD *)&v53[10] = v30;
          _os_log_impl(&dword_211704000, v29, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);

        }
        objc_msgSend(*((id *)WeakRetained + 16), "suspend");
      }
      objc_msgSend(WeakRetained, "_setNextWindowTimeoutFireDate");
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v31 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(void **)(a1 + 32);
      v33 = v31;
      LODWORD(v32) = objc_msgSend(v32, "messageID");
      v34 = objc_msgSend(v11, "length");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v53 = (_DWORD)v32;
      *(_WORD *)&v53[4] = 2048;
      *(_QWORD *)&v53[6] = v34;
      *(_WORD *)&v53[14] = 2114;
      *(_QWORD *)&v53[16] = v22;
      v54 = 2112;
      v55 = v23;
      _os_log_impl(&dword_211704000, v33, OS_LOG_TYPE_DEFAULT, "For message: %{companionsync:SYMessageID}hu sending data of length: %tu. Got identifier %{public}@, error %@", buf, 0x26u);

    }
    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "setMessageID:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    objc_msgSend(v35, "setIdsIdentifier:", v22);
    objc_msgSend(*(id *)(a1 + 32), "persistentUserInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setUserInfo:", v36);

    v37 = (void *)objc_opt_new();
    objc_msgSend(v35, "setDate:", v37);

    objc_msgSend(v35, "setFromRequest:", 1);
    objc_msgSend(v35, "setIdsOptions:", v12);
    objc_msgSend(v35, "setTargetDeviceIDs:", v9);
    if (v23)
    {
      objc_msgSend(WeakRetained, "_handleError:context:", v23, v35);
    }
    else if (v22 && (v44 != 0 || objc_msgSend(WeakRetained, "delegateRequiresACKs")))
    {
      objc_msgSend(*(id *)(a1 + 32), "responseTimeout");
      v38 = (void *)MEMORY[0x24BDBCE60];
      if (v39 > 0.0)
        objc_msgSend(*(id *)(a1 + 32), "responseTimeout");
      else
        v40 = 86400.0;
      objc_msgSend(v38, "dateWithTimeIntervalSinceNow:", v40);
      v41 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setMessageCenter:", WeakRetained);
      objc_msgSend(*(id *)(a1 + 32), "setIdsIdentifier:", v22);
      objc_msgSend(*((id *)WeakRetained + 10), "lock");
      objc_msgSend(*((id *)WeakRetained + 10), "setObject:forKey:expires:", v35, v22, v41);
      objc_msgSend(*((id *)WeakRetained + 10), "unlock");
      v45 = (void *)v41;
      objc_msgSend(WeakRetained, "_updateExpireTimerWithDate:", v41);
      objc_msgSend(WeakRetained, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v41) = objc_opt_respondsToSelector();

      if ((v41 & 1) != 0)
      {
        v43 = *((_QWORD *)WeakRetained + 19);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __32__NMSMessageCenter_sendRequest___block_invoke_70;
        block[3] = &unk_24CC652B8;
        v47 = WeakRetained;
        v48 = *(id *)(a1 + 32);
        dispatch_sync(v43, block);

      }
    }

  }
}

void __32__NMSMessageCenter_sendRequest___block_invoke_70(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageCenter:didResolveIDSIdentifierForRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)sendFile:(id)a3
{
  id v5;
  char resumed;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDSService *v13;
  void *v14;
  _NMSDispatchQueue *windowQueue;
  _QWORD v16[4];
  id v17;
  NMSMessageCenter *v18;
  IDSService *v19;
  id v20;
  id location;

  v5 = a3;
  resumed = self->_resumed;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(resumed, a2, CFSTR("Cannot use %@ until after -resume is sent"), v8, v9, v10, v11, v12, (uint64_t)v7);

  v13 = self->_service;
  if (v13)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      -[NMSMessageCenter sendFile:].cold.2(v14, v5, (uint64_t)self);
    objc_initWeak(&location, self);
    windowQueue = self->_windowQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __29__NMSMessageCenter_sendFile___block_invoke;
    v16[3] = &unk_24CC66B88;
    objc_copyWeak(&v20, &location);
    v17 = v5;
    v18 = self;
    v19 = v13;
    -[_NMSDispatchQueue async:](windowQueue, "async:", v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[NMSMessageCenter sendFile:].cold.1();
  }

}

void __29__NMSMessageCenter_sendFile___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  id v75;
  _QWORD v76[2];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (shouldLogTraffic())
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v3 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(void **)(a1 + 32);
        v5 = v3;
        objc_msgSend(v4, "CPObfuscatedDescriptionObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        _SYObfuscate(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v71 = v7;
        _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Sending file: %{public}@", buf, 0xCu);

      }
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v8 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      __29__NMSMessageCenter_sendFile___block_invoke_cold_3(a1, v8);
    v9 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "targetDeviceIDs");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FD60]);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    objc_msgSend(*v9, "sendTimeout");
    if (v12 > 0.0)
    {
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*v9, "sendTimeout");
      objc_msgSend(v13, "numberWithDouble:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE4FB30]);

    }
    objc_msgSend(*v9, "extraIDSOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*v9, "extraIDSOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addEntriesFromDictionary:", v16);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "enableTransmissionWindow"))
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FB48]);
    v17 = objc_msgSend(*v9, "priority");
    v18 = 200;
    if (v17 == 1)
      v18 = 100;
    if (v17 == 2)
      v19 = 300;
    else
      v19 = v18;
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      __29__NMSMessageCenter_sendFile___block_invoke_cold_2();
    objc_msgSend(*(id *)(a1 + 32), "pbHeaderInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "data");
    v21 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v21;
    v76[0] = CFSTR("HeaderData");
    v76[1] = CFSTR("UserMetadata");
    v77[0] = v21;
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "fileURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    v69 = 0;
    v58 = (void *)v23;
    LODWORD(v24) = objc_msgSend(v24, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", v25, v23, v10, v19, v11, &v69, &v68);
    v26 = v69;
    v27 = v68;

    v60 = (void *)v10;
    v61 = v11;
    if ((_DWORD)v24 && objc_msgSend(WeakRetained, "enableTransmissionWindow"))
    {
      objc_msgSend(*v9, "fileURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      objc_msgSend(v28, "getResourceValue:forKey:error:", &v67, *MEMORY[0x24BDBCC48], 0);
      v29 = v67;

      v30 = objc_msgSend(v29, "unsignedIntegerValue");
      if (v30)
      {
        v31 = v30;
        v32 = (void *)*((_QWORD *)WeakRetained + 14);
        objc_msgSend(WeakRetained, "windowResponseTimeout");
        objc_msgSend(v32, "addMessageWithID:ofLength:timeoutTime:", v26, v31);
        v33 = *((_QWORD *)WeakRetained + 13) + v31;
        *((_QWORD *)WeakRetained + 13) = v33;
        if (v33 >= objc_msgSend(WeakRetained, "maxBytesInFlight"))
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v34 = (void *)qword_253D84AC0;
          if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
          {
            v35 = (void *)*((_QWORD *)WeakRetained + 13);
            v36 = v34;
            v37 = objc_msgSend(WeakRetained, "maxBytesInFlight");
            *(_DWORD *)buf = 134218240;
            v71 = v35;
            v72 = 2048;
            v73 = v37;
            _os_log_impl(&dword_211704000, v36, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);

          }
          objc_msgSend(*((id *)WeakRetained + 16), "suspend");
        }
        objc_msgSend(WeakRetained, "_setNextWindowTimeoutFireDate");
      }

      v10 = (uint64_t)v60;
    }
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v38 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *v9;
      v40 = v38;
      objc_msgSend(v39, "fileURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v71 = v41;
      v72 = 2114;
      v73 = (uint64_t)v26;
      v74 = 2112;
      v75 = v27;
      _os_log_impl(&dword_211704000, v40, OS_LOG_TYPE_DEFAULT, "Sending resource data from file: %@. Got identifier %{public}@, error %@", buf, 0x20u);

    }
    v42 = (void *)objc_opt_new();
    objc_msgSend(v42, "setMessageID:", 0xFFFFLL);
    objc_msgSend(v42, "setIdsIdentifier:", v26);
    objc_msgSend(*v9, "persistentUserInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setUserInfo:", v43);

    v44 = (void *)objc_opt_new();
    objc_msgSend(v42, "setDate:", v44);

    objc_msgSend(v42, "setFromRequest:", 1);
    objc_msgSend(v42, "setIdsOptions:", v61);
    objc_msgSend(v42, "setTargetDeviceIDs:", v10);
    objc_msgSend(*v9, "setMessageCenter:", WeakRetained);
    objc_msgSend(*v9, "setIdsIdentifier:", v26);
    objc_msgSend(WeakRetained, "delegate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_opt_respondsToSelector();

    if ((v46 & 1) != 0)
    {
      v47 = *((_QWORD *)WeakRetained + 19);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __29__NMSMessageCenter_sendFile___block_invoke_75;
      block[3] = &unk_24CC65560;
      v64 = WeakRetained;
      v65 = v26;
      v66 = *v9;
      dispatch_sync(v47, block);

    }
    if (v27)
    {
      objc_msgSend(WeakRetained, "_handleError:context:", v27, v42);
    }
    else if (v26 && objc_msgSend(WeakRetained, "delegateRequiresACKs"))
    {
      objc_msgSend(*v9, "sendTimeout");
      v53 = (void *)MEMORY[0x24BDBCE60];
      if (v54 > 0.0)
      {
        objc_msgSend(*v9, "sendTimeout");
        v55 = v56 + 5.0;
      }
      else
      {
        v55 = 86405.0;
      }
      objc_msgSend(v53, "dateWithTimeIntervalSinceNow:", v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)WeakRetained + 10), "lock");
      objc_msgSend(*((id *)WeakRetained + 10), "setObject:forKey:expires:", v42, v26, v57);
      objc_msgSend(*((id *)WeakRetained + 10), "unlock");
      objc_msgSend(WeakRetained, "_updateExpireTimerWithDate:", v57);

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v9, "fileURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    v50 = objc_msgSend(v48, "removeItemAtURL:error:", v49, &v62);
    v51 = v62;

    if ((v50 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v52 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
        __29__NMSMessageCenter_sendFile___block_invoke_cold_1(v9, v52);
    }

  }
}

void __29__NMSMessageCenter_sendFile___block_invoke_75(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageCenter:didResolveIDSIdentifier:forFileTransfer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_sendResponse:(id)a3
{
  id v5;
  char resumed;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  IDSService *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _BOOL4 v20;
  const char *v21;
  _NMSDispatchQueue *windowQueue;
  _QWORD v23[4];
  id v24;
  id v25;
  IDSService *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  resumed = self->_resumed;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AssertState(resumed, a2, CFSTR("Cannot use %@ until after -resume is sent"), v8, v9, v10, v11, v12, (uint64_t)v7);

  v13 = self->_service;
  objc_msgSend(v5, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v5, "setSent:", 1);
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v15 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      objc_msgSend(v5, "pbResponse");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[_NMSDispatchQueue isSuspended](self->_windowQueue, "isSuspended");
      v21 = "not ";
      if (v20)
        v21 = "";
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2080;
      v31 = v21;
      _os_log_impl(&dword_211704000, v16, OS_LOG_TYPE_INFO, "Sending %{public}@, NMS window queue is %ssuspended", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    windowQueue = self->_windowQueue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __34__NMSMessageCenter__sendResponse___block_invoke;
    v23[3] = &unk_24CC66B88;
    objc_copyWeak(&v27, (id *)buf);
    v24 = v5;
    v25 = v14;
    v26 = v13;
    -[_NMSDispatchQueue async:](windowQueue, "async:", v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[NMSMessageCenter _sendResponse:].cold.1();
  }

}

void __34__NMSMessageCenter__sendResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _QWORD block[4];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  _BYTE v57[24];
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_49;
  if (shouldLogTraffic())
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v3 = (void *)qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "CPObfuscatedDescriptionObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _SYObfuscate(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v57 = v7;
      _os_log_impl(&dword_211704000, v5, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);

    }
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v8 = (void *)qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
    __34__NMSMessageCenter__sendResponse___block_invoke_cold_2(a1, v8);
  v9 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "targetDeviceIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceDeviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(a1 + 40), "sourceDeviceID");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  else
  {
    if (objc_msgSend(v10, "count"))
      goto LABEL_15;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4FD60]);
    v14 = objc_claimAutoreleasedReturnValue();
  }

  v10 = (void *)v14;
LABEL_15:
  v15 = *v9;
  v55 = 0;
  objc_msgSend(WeakRetained, "_buildDataForResponse:options:", v15, &v55);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v55;
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v18 = (void *)qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
    __34__NMSMessageCenter__sendResponse___block_invoke_cold_1(a1 + 32, v18);
  v19 = objc_msgSend(*(id *)(a1 + 32), "priority");
  v20 = 200;
  if (v19 == 1)
    v20 = 100;
  if (v19 == 2)
    v21 = 300;
  else
    v21 = v20;
  v22 = (void *)*((_QWORD *)WeakRetained + 7);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *(void **)(a1 + 48);
  v53 = 0;
  v54 = 0;
  LODWORD(v23) = objc_msgSend(v24, "sendData:toDestinations:priority:options:identifier:error:", v16, v10, v21, v17, &v54, &v53);
  v25 = v54;
  v26 = v53;
  if ((_DWORD)v23 && objc_msgSend(WeakRetained, "enableTransmissionWindow"))
  {
    v27 = (void *)*((_QWORD *)WeakRetained + 14);
    v28 = objc_msgSend(v16, "length");
    objc_msgSend(WeakRetained, "windowResponseTimeout");
    objc_msgSend(v27, "addMessageWithID:ofLength:timeoutTime:", v25, v28);
    v29 = *((_QWORD *)WeakRetained + 13) + objc_msgSend(v16, "length");
    *((_QWORD *)WeakRetained + 13) = v29;
    if (v29 >= objc_msgSend(WeakRetained, "maxBytesInFlight"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v30 = (void *)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
      {
        v47 = *((_QWORD *)WeakRetained + 13);
        v31 = v30;
        v32 = objc_msgSend(WeakRetained, "maxBytesInFlight");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v57 = v47;
        *(_WORD *)&v57[8] = 2048;
        *(_QWORD *)&v57[10] = v32;
        _os_log_impl(&dword_211704000, v31, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);

      }
      objc_msgSend(*((id *)WeakRetained + 16), "suspend", v47);
    }
    objc_msgSend(WeakRetained, "_setNextWindowTimeoutFireDate");
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v33 = (void *)qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    v34 = *(void **)(a1 + 40);
    v35 = v33;
    LODWORD(v34) = objc_msgSend(v34, "messageID");
    v36 = objc_msgSend(v16, "length");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = (_DWORD)v34;
    *(_WORD *)&v57[4] = 2048;
    *(_QWORD *)&v57[6] = v36;
    *(_WORD *)&v57[14] = 2114;
    *(_QWORD *)&v57[16] = v25;
    v58 = 2112;
    v59 = v26;
    _os_log_impl(&dword_211704000, v35, OS_LOG_TYPE_DEFAULT, "For response to: %{companionsync:SYMessageID}hu sending data of length: %tu. Got identifier %{public}@, error %@", buf, 0x26u);

  }
  objc_msgSend(*v9, "setIdsIdentifier:", v25);
  objc_msgSend(WeakRetained, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_respondsToSelector();

  if ((v38 & 1) != 0)
  {
    v39 = *((_QWORD *)WeakRetained + 19);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__NMSMessageCenter__sendResponse___block_invoke_79;
    block[3] = &unk_24CC65560;
    v50 = WeakRetained;
    v51 = v25;
    v52 = *v9;
    dispatch_sync(v39, block);

  }
  v40 = (void *)objc_opt_new();
  objc_msgSend(v40, "setMessageID:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  objc_msgSend(v40, "setIdsIdentifier:", v25);
  objc_msgSend(*(id *)(a1 + 32), "persistentUserInfo");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setUserInfo:", v41);

  v42 = (void *)objc_opt_new();
  objc_msgSend(v40, "setDate:", v42);

  objc_msgSend(v40, "setFromRequest:", 0);
  objc_msgSend(v40, "setIdsOptions:", v17);
  if (v26)
  {
    objc_msgSend(WeakRetained, "_handleError:context:", v26, v40);
  }
  else if (v25 && v48)
  {
    objc_msgSend(*v9, "sendTimeout");
    v43 = (void *)MEMORY[0x24BDBCE60];
    if (v44 > 0.0)
      objc_msgSend(*v9, "sendTimeout");
    else
      v45 = 86400.0;
    objc_msgSend(v43, "dateWithTimeIntervalSinceNow:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)WeakRetained + 10), "lock");
    objc_msgSend(*((id *)WeakRetained + 10), "setObject:forKey:expires:", v40, v25, v46);
    objc_msgSend(*((id *)WeakRetained + 10), "unlock");
    objc_msgSend(WeakRetained, "_updateExpireTimerWithDate:", v46);

  }
LABEL_49:

}

void __34__NMSMessageCenter__sendResponse___block_invoke_79(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageCenter:didResolveIDSIdentifier:forResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_handleError:(id)a3 context:(id)a4 locked:(BOOL)a5
{
  id v8;
  void *v9;
  NMSPersistentDictionary *persistentContextStore;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *errorHandlers;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  id WeakRetained;
  char v21;
  NSObject *delegateQueue;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;

  v23 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v8, "idsIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!a5)
      -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
    persistentContextStore = self->_persistentContextStore;
    objc_msgSend(v8, "idsIdentifier", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSPersistentDictionary removeObjectForKey:](persistentContextStore, "removeObjectForKey:", v11);

    if (!a5)
      -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
  }
  objc_msgSend(v23, "userInfo", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
    v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("NMSContext"));
  v14 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v24, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(v24, "code"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  errorHandlers = self->_errorHandlers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v8, "messageID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](errorHandlers, "objectForKeyedSubscript:", v18);
  v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    ((void (**)(_QWORD, void *))v19)[2](v19, v16);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__NMSMessageCenter__handleError_context_locked___block_invoke;
      block[3] = &unk_24CC65560;
      block[4] = self;
      v26 = v8;
      v27 = v16;
      dispatch_sync(delegateQueue, block);

    }
  }

}

void __48__NMSMessageCenter__handleError_context_locked___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "messageCenter:failedToSendMessageWithIdentifier:error:userInfo:", v2, v3, v4, v5);

}

- (void)_handleError:(id)a3 context:(id)a4
{
  -[NMSMessageCenter _handleError:context:locked:](self, "_handleError:context:locked:", a3, a4, 0);
}

- (void)_obliterate
{
  NSObject *v3;
  _NMSDispatchQueue *windowQueue;
  IDSService *service;
  OS_dispatch_source *expireTimer;
  _QWORD v7[5];
  uint8_t buf[16];

  if (_sync_log_facilities_pred != -1)
    _os_once();
  v3 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211704000, v3, OS_LOG_TYPE_DEFAULT, "NMSMessageCenter stopping", buf, 2u);
  }
  dispatch_source_cancel((dispatch_source_t)self->_expireTimer);
  windowQueue = self->_windowQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__NMSMessageCenter__obliterate__block_invoke;
  v7[3] = &unk_24CC65418;
  v7[4] = self;
  -[_NMSDispatchQueue sync:](windowQueue, "sync:", v7);
  service = self->_service;
  self->_service = 0;

  expireTimer = self->_expireTimer;
  self->_expireTimer = 0;

  self->_resumed = 0;
  -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
  -[NMSPersistentDictionary removeAllObjects](self->_persistentContextStore, "removeAllObjects");
  -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
  -[NMSWindowData removeAllMessages](self->_windowData, "removeAllMessages");
}

uint64_t __31__NMSMessageCenter__obliterate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "suspend");
}

- (BOOL)cancelMessageWithID:(id)a3 error:(id *)a4
{
  IDSService *service;

  service = self->_service;
  if (service)
    LOBYTE(service) = -[IDSService cancelIdentifier:error:](service, "cancelIdentifier:error:", a3, a4);
  return (char)service;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id WeakRetained;
  char v18;
  NSObject *delegateQueue;
  NSMutableDictionary *responseHandlers;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  unint64_t currentBytesInFlight;
  _BOOL4 v27;
  NSObject *v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD block[5];
  id v32;
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
  -[NMSPersistentDictionary objectForKey:](self->_persistentContextStore, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
  if (!v16)
  {
    if (a6)
      goto LABEL_31;
    goto LABEL_16;
  }
  objc_msgSend(v16, "setSendAcked:", 1);
  if (!a6)
  {
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSErrorDomain"), 3, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NMSMessageCenter _handleError:context:](self, "_handleError:context:", v15, v16);
LABEL_16:
    if (-[NMSMessageCenter enableTransmissionWindow](self, "enableTransmissionWindow"))
    {
      currentBytesInFlight = self->_currentBytesInFlight;
      v27 = currentBytesInFlight >= -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight")
         || -[_NMSDispatchQueue isSuspended](self->_windowQueue, "isSuspended");
      -[NMSWindowData removeAndReturnLengthOfMessageWithID:](self->_windowData, "removeAndReturnLengthOfMessageWithID:", v14);
      self->_currentBytesInFlight = 0;
      if (v27 && -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight"))
      {
        if (_sync_log_facilities_pred != -1)
          _os_once();
        v28 = (id)qword_253D84AC0;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = self->_currentBytesInFlight;
          v30 = -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight");
          *(_DWORD *)buf = 134218240;
          v36 = v29;
          v37 = 2048;
          v38 = v30;
          _os_log_impl(&dword_211704000, v28, OS_LOG_TYPE_DEFAULT, "Opening window: %lu bytes in flight, %lu max", buf, 0x16u);
        }

        -[_NMSDispatchQueue resume](self->_windowQueue, "resume");
      }
      -[NMSMessageCenter _setNextWindowTimeoutFireDate](self, "_setNextWindowTimeoutFireDate");
    }
    goto LABEL_31;
  }
  if (objc_msgSend(v16, "isFromRequest"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__NMSMessageCenter_service_account_identifier_didSendWithSuccess_error___block_invoke;
      block[3] = &unk_24CC65560;
      block[4] = self;
      v32 = v14;
      v33 = v16;
      dispatch_sync(delegateQueue, block);

    }
  }
  if (!objc_msgSend(v16, "isFromRequest"))
    goto LABEL_8;
  responseHandlers = self->_responseHandlers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v16, "messageID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](responseHandlers, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(responseHandlers) = v22 == 0;

  if ((_DWORD)responseHandlers)
  {
LABEL_8:
    -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
    objc_msgSend(v16, "idsOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BE4FB48]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "BOOLValue"))
    {
      v25 = objc_msgSend(v16, "processAcked");

      if ((v25 & 1) == 0)
      {
        -[NMSPersistentDictionary resetObject:forKey:](self->_persistentContextStore, "resetObject:forKey:", v16, v14);
LABEL_30:
        -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
        goto LABEL_31;
      }
    }
    else
    {

    }
    -[NMSPersistentDictionary removeObjectForKey:](self->_persistentContextStore, "removeObjectForKey:", v14);
    goto LABEL_30;
  }
LABEL_31:

  os_activity_scope_leave(&state);
}

void __72__NMSMessageCenter_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "messageCenter:didSuccessfullySendRequestWithIdentifier:userInfo:", v2, v3, v4);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  char v16;
  NSObject *delegateQueue;
  NSMutableDictionary *responseHandlers;
  void *v19;
  void *v20;
  int v21;
  NMSPersistentDictionary *persistentContextStore;
  unint64_t currentBytesInFlight;
  _BOOL4 v24;
  NSObject *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD block[5];
  id v29;
  id v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
  -[NMSPersistentDictionary objectForKey:](self->_persistentContextStore, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
  objc_msgSend(v14, "setProcessAcked:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__NMSMessageCenter_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
    block[3] = &unk_24CC65560;
    block[4] = self;
    v29 = v12;
    v30 = v14;
    dispatch_sync(delegateQueue, block);

  }
  if (v14)
  {
    if (!objc_msgSend(v14, "isFromRequest"))
      goto LABEL_6;
    responseHandlers = self->_responseHandlers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v14, "messageID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](responseHandlers, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(responseHandlers) = v20 == 0;

    if ((_DWORD)responseHandlers)
    {
LABEL_6:
      -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
      v21 = objc_msgSend(v14, "sendAcked");
      persistentContextStore = self->_persistentContextStore;
      if (v21)
        -[NMSPersistentDictionary removeObjectForKey:](persistentContextStore, "removeObjectForKey:", v12);
      else
        -[NMSPersistentDictionary resetObject:forKey:](persistentContextStore, "resetObject:forKey:", v14, v12);
      -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
    }
  }
  if (-[NMSMessageCenter enableTransmissionWindow](self, "enableTransmissionWindow"))
  {
    currentBytesInFlight = self->_currentBytesInFlight;
    v24 = currentBytesInFlight >= -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight")
       || -[_NMSDispatchQueue isSuspended](self->_windowQueue, "isSuspended");
    -[NMSWindowData removeAndReturnLengthOfMessageWithID:](self->_windowData, "removeAndReturnLengthOfMessageWithID:", v12);
    self->_currentBytesInFlight = 0;
    if (v24 && -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight"))
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v25 = (id)qword_253D84AC0;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_currentBytesInFlight;
        v27 = -[NMSMessageCenter maxBytesInFlight](self, "maxBytesInFlight");
        *(_DWORD *)buf = 134218240;
        v33 = v26;
        v34 = 2048;
        v35 = v27;
        _os_log_impl(&dword_211704000, v25, OS_LOG_TYPE_DEFAULT, "Opening window: %lu bytes in flight, %lu max", buf, 0x16u);
      }

      -[_NMSDispatchQueue resume](self->_windowQueue, "resume");
    }
    -[NMSMessageCenter _setNextWindowTimeoutFireDate](self, "_setNextWindowTimeoutFireDate");
  }

  os_activity_scope_leave(&state);
}

void __75__NMSMessageCenter_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "messageCenter:didSuccessfullyDeliverRequestWithIdentifier:userInfo:", v2, v3, v4);

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  IDSService *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  id v30;
  int v31;
  NMSPersistentDictionary *persistentContextStore;
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  NMSPersistentDictionary *v35;
  void *v36;
  NSMutableDictionary *responseHandlers;
  void *v38;
  void (**v39)(id, void *);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *requestHandlers;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  id WeakRetained;
  char v67;
  NSObject *delegateQueue;
  NSObject *v69;
  const char *v70;
  int v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  _QWORD block[5];
  id v77;
  os_activity_scope_state_s state;
  char v79[16];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v12 = (IDSService *)a3;
  v74 = a4;
  v13 = a5;
  v75 = a6;
  v14 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v15 = (id)qword_253D84AC0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v13, "length");
    _SYObfuscate(v12);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outgoingResponseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "incomingResponseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v81 = v16;
    v82 = 2114;
    v83 = v17;
    v84 = 2114;
    v85 = v18;
    v86 = 2114;
    v87 = v19;
    _os_log_impl(&dword_211704000, v15, OS_LOG_TYPE_DEFAULT, "Receiving %zu bytes of incoming data from service %{public}@. Identifier (in/out) = %{public}@ / %{public}@", buf, 0x2Au);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_service == v12)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v20 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.7(v20, v21, v22, v23, v24, v25, v26, v27);
    v72 = (void *)os_transaction_create();
    objc_msgSend(v14, "incomingResponseIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28 == 0;

    if (v29)
    {
      if ((unint64_t)objc_msgSend(v13, "length") >= 3)
      {
        -[NMSMessageCenter _decodeIncomingRequestData:context:](self, "_decodeIncomingRequestData:context:", v13, v14);
        v73 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setSourceDeviceID:", v75);
        if (objc_msgSend(v73, "messageID") == 0x7FFF)
        {
          objc_msgSend(v73, "pbRequest");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "inReplyTo");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
          -[NMSPersistentDictionary removeObjectForKey:](self->_persistentContextStore, "removeObjectForKey:", v51);
          -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v52 = qword_253D84AC0;
          if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v81 = (uint64_t)v51;
            _os_log_impl(&dword_211704000, v52, OS_LOG_TYPE_DEFAULT, "Releasing timer for outgoing request %{public}@ due to incoming Version Rejection message triggered by that message ID.", buf, 0xCu);
          }

        }
        if (shouldLogTraffic())
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v53 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v73, "CPObfuscatedDescriptionObject");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            _SYObfuscate(v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v81 = (uint64_t)v55;
            _os_log_impl(&dword_211704000, v53, OS_LOG_TYPE_DEFAULT, "Received request: %{public}@", buf, 0xCu);

          }
        }
        if (objc_msgSend(v73, "expectsResponse"))
          objc_msgSend(v73, "configureResponse");
        requestHandlers = self->_requestHandlers;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v73, "messageID"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](requestHandlers, "objectForKeyedSubscript:", v57);
        v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          ((void (**)(_QWORD, id))v34)[2](v34, v73);
        }
        else
        {
          if (_sync_log_facilities_pred != -1)
            _os_once();
          v61 = (id)qword_253D84AC0;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.4(objc_msgSend(v73, "messageID"), (uint64_t)v79, v61);

          if (_sync_log_facilities_pred != -1)
            _os_once();
          if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
          {
            if ((unint64_t)objc_msgSend(v13, "length") > 0x64)
            {
              v63 = (void *)MEMORY[0x212BE0D64]();
              objc_msgSend(v13, "subdataWithRange:", 0, 100);
              v62 = (id)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v63);
            }
            else
            {
              v62 = v13;
            }
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v64 = (id)qword_253D84AC0;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "subdataWithRange:", 0, 3);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.3(v65, (uint64_t)buf, v64);
            }

            if (_sync_log_facilities_pred != -1)
              _os_once();
            if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
              -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.2();

          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          v67 = objc_opt_respondsToSelector();

          if ((v67 & 1) != 0)
          {
            delegateQueue = self->_delegateQueue;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __64__NMSMessageCenter_service_account_incomingData_fromID_context___block_invoke;
            block[3] = &unk_24CC652B8;
            block[4] = self;
            v73 = v73;
            v77 = v73;
            dispatch_sync(delegateQueue, block);

          }
          else
          {
            objc_msgSend(v73, "setExpectsResponse:", 0);
            if (_sync_log_facilities_pred != -1)
              _os_once();
            v69 = qword_253D84AC0;
            if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
              -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.1(v69);
          }
        }
        goto LABEL_55;
      }
    }
    else if ((unint64_t)objc_msgSend(v13, "length") >= 2)
    {
      v30 = objc_retainAutorelease(v13);
      v31 = *(unsigned __int16 *)objc_msgSend(v30, "bytes");
      objc_msgSend(v30, "subdataWithRange:", 2, objc_msgSend(v30, "length") - 2);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
      persistentContextStore = self->_persistentContextStore;
      objc_msgSend(v14, "incomingResponseIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NMSPersistentDictionary objectForKey:](persistentContextStore, "objectForKey:", v33);
      v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
      if (v34)
      {
        -[NMSPersistentDictionary lock](self->_persistentContextStore, "lock");
        v35 = self->_persistentContextStore;
        objc_msgSend(v14, "incomingResponseIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NMSPersistentDictionary removeObjectForKey:](v35, "removeObjectForKey:", v36);

        -[NMSPersistentDictionary unlock](self->_persistentContextStore, "unlock");
        if (objc_msgSend(v34, "messageID") == v31)
        {
          if ((objc_msgSend(v34, "isFromRequest") & 1) != 0)
          {
            responseHandlers = self->_responseHandlers;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v34, "messageID"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](responseHandlers, "objectForKeyedSubscript:", v38);
            v39 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              v40 = (void *)objc_opt_new();
              objc_msgSend(v40, "setMessageID:", objc_msgSend(v34, "messageID"));
              objc_msgSend(v40, "setData:", v73);
              objc_msgSend(v14, "outgoingResponseIdentifier");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setIdsIdentifier:", v41);

              objc_msgSend(v14, "incomingResponseIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setRequestIDSIdentifier:", v42);

              objc_msgSend(v34, "date");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setRequestSent:", v43);

              objc_msgSend(v34, "userInfo");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setRequestPersistentUserInfo:", v44);

              objc_msgSend(v40, "setSourceDeviceID:", v75);
              objc_msgSend(v40, "setIdsContext:", v14);
              if (shouldLogTraffic())
              {
                if (_sync_log_facilities_pred != -1)
                  _os_once();
                v45 = (id)qword_253D84AC0;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v40, "CPObfuscatedDescriptionObject");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  _SYObfuscate(v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v81 = (uint64_t)v47;
                  _os_log_impl(&dword_211704000, v45, OS_LOG_TYPE_DEFAULT, "Received response: %{public}@", buf, 0xCu);

                }
              }
              -[NMSMessageCenter _pbMappingForMessageID:](self, "_pbMappingForMessageID:", objc_msgSend(v34, "messageID"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v48, "responseClass"))
              {
                v49 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v48, "responseClass")), "initWithData:", v73);
                objc_msgSend(v40, "setPbResponse:", v49);

              }
              v39[2](v39, v40);

            }
            else
            {
              if (_sync_log_facilities_pred != -1)
                _os_once();
              v59 = qword_253D84AC0;
              if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
                -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.6(v31, v59, v60);
            }
LABEL_54:

LABEL_55:
            goto LABEL_56;
          }
          v70 = "context.fromRequest == YES";
          v71 = 1268;
        }
        else
        {
          v70 = "context.messageID == header.messageID";
          v71 = 1267;
        }
        __assert_rtn("-[NMSMessageCenter service:account:incomingData:fromID:context:]", "NanoMessagingService.m", v71, v70);
      }
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v39 = (void (**)(id, void *))(id)qword_253D84AC0;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "incomingResponseIdentifier");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.5(v58, v31, buf, (os_log_t)v39);
      }
      goto LABEL_54;
    }
LABEL_56:

    goto LABEL_57;
  }
  if (_sync_log_facilities_pred != -1)
    _os_once();
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
    -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.8();
LABEL_57:
  os_activity_scope_leave(&state);

}

void __64__NMSMessageCenter_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(WeakRetained, "messageCenter:didReceiveUnknownRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id WeakRetained;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  SYFileTransferInfo *v33;
  NSObject *delegateQueue;
  id v35;
  void *v36;
  _QWORD block[5];
  id v38;
  os_activity_scope_state_s state;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v22 = qword_253D84AC0;
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEBUG))
      -[NMSMessageCenter service:account:incomingResourceAtURL:metadata:fromID:context:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    v36 = (void *)os_transaction_create();
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "setMessageCenter:", self);
    objc_msgSend(v30, "setIdsIdentifier:", v18);
    objc_msgSend(v30, "setFileURL:", v16);
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UserMetadata"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setMetadata:", v31);

    objc_msgSend(v30, "setSourceDeviceID:", v18);
    objc_msgSend(v30, "setIdsContext:", v19);
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HeaderData"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = -[SYFileTransferInfo initWithData:]([SYFileTransferInfo alloc], "initWithData:", v32);
      objc_msgSend(v30, "setPbHeaderInfo:", v33);

    }
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__NMSMessageCenter_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke;
    block[3] = &unk_24CC652B8;
    block[4] = self;
    v38 = v30;
    v35 = v30;
    dispatch_sync(delegateQueue, block);

  }
  else
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_ERROR))
      -[NMSMessageCenter service:account:incomingResourceAtURL:metadata:fromID:context:].cold.2();
  }
  os_activity_scope_leave(&state);

}

void __82__NMSMessageCenter_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 168));
  objc_msgSend(WeakRetained, "messageCenter:didReceiveIncomingFileTransfer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  id WeakRetained;
  char v13;
  NSObject *delegateQueue;
  _QWORD block[5];
  id v16;
  void (**v17)(_QWORD);
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  if (_sync_log_facilities_pred != -1)
    _os_once();
  v11 = qword_253D84AC0;
  if (os_log_type_enabled((os_log_t)qword_253D84AC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v9;
    _os_log_impl(&dword_211704000, v11, OS_LOG_TYPE_DEFAULT, "IDS active device changed: %@", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__NMSMessageCenter_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke;
    block[3] = &unk_24CC66858;
    block[4] = self;
    v16 = v9;
    v17 = v10;
    dispatch_async(delegateQueue, block);

  }
  else
  {
    v10[2](v10);
  }
  os_activity_scope_leave(&state);

}

void __77__NMSMessageCenter_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke(_QWORD *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  objc_msgSend(WeakRetained, "messageCenter:activeDeviceChanged:acknowledgement:", a1[4], a1[5], a1[6]);

}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v11;
  NMSMessageCenter *v12;
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__NMSMessageCenter_service_nearbyDevicesChanged___block_invoke;
    block[3] = &unk_24CC65560;
    v11 = WeakRetained;
    v12 = self;
    v13 = v7;
    dispatch_async(delegateQueue, block);

  }
  os_activity_scope_leave(&state);

}

uint64_t __49__NMSMessageCenter_service_nearbyDevicesChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageCenter:nearbyDevicesChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *delegateQueue;
  _QWORD block[4];
  id v11;
  NMSMessageCenter *v12;
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__NMSMessageCenter_service_connectedDevicesChanged___block_invoke;
    block[3] = &unk_24CC65560;
    v11 = WeakRetained;
    v12 = self;
    v13 = v7;
    dispatch_async(delegateQueue, block);

  }
  os_activity_scope_leave(&state);

}

uint64_t __52__NMSMessageCenter_service_connectedDevicesChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "messageCenter:connectedDevicesChanged:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NMSMessageCenterDelegate)delegate
{
  return (NMSMessageCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_os_activity)transportActivity
{
  return self->_transportActivity;
}

- (void)setTransportActivity:(id)a3
{
  objc_storeStrong((id *)&self->_transportActivity, a3);
}

- (BOOL)enableTransmissionWindow
{
  return self->_enableTransmissionWindow;
}

- (unint64_t)maxMessagesInFlight
{
  return self->_maxMessagesInFlight;
}

- (void)setMaxMessagesInFlight:(unint64_t)a3
{
  self->_maxMessagesInFlight = a3;
}

- (unint64_t)minMessagesInFlight
{
  return self->_minMessagesInFlight;
}

- (void)setMinMessagesInFlight:(unint64_t)a3
{
  self->_minMessagesInFlight = a3;
}

- (unint64_t)maxBytesInFlight
{
  return self->_maxBytesInFlight;
}

- (void)setMaxBytesInFlight:(unint64_t)a3
{
  self->_maxBytesInFlight = a3;
}

- (double)windowResponseTimeout
{
  return self->_windowResponseTimeout;
}

- (void)setWindowResponseTimeout:(double)a3
{
  self->_windowResponseTimeout = a3;
}

- (BOOL)delegateRequiresACKs
{
  return self->_delegateRequiresACKs;
}

- (void)setDelegateRequiresACKs:(BOOL)a3
{
  self->_delegateRequiresACKs = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_idsIncomingQueue, 0);
  objc_storeStrong((id *)&self->_windowQueue, 0);
  objc_storeStrong((id *)&self->_windowTimeout, 0);
  objc_storeStrong((id *)&self->_windowData, 0);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_nextExpireTimerFireDate, 0);
  objc_storeStrong((id *)&self->_persistentContextStore, 0);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_launchNotification, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (id)deviceIDFromDevice:(id)a3
{
  id v3;

  if (a3)
    v3 = (id)IDSCopyIDForDevice();
  else
    v3 = (id)*MEMORY[0x24BE4FD60];
  return v3;
}

- (void)_decodeIncomingRequestData:context:.cold.1()
{
  __assert_rtn("-[NMSMessageCenter _decodeIncomingRequestData:context:]", "NanoMessagingService.m", 719, "!idsContext.expectsPeerResponse || idsContext.outgoingResponseIdentifier");
}

- (void)sendRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "IDS service is nil on entry to sendRequest. Dropping message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__NMSMessageCenter_sendRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v0, v1, "Request resolved IDS options: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __32__NMSMessageCenter_sendRequest___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_9_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "extraIDSOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v2, v4, "Request extra IDS options: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)sendFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "IDS service is nil on entry to sendFile. Dropping message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)sendFile:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a3 + 128), "isSuspended");
  v8 = "not ";
  if (v7)
    v8 = "";
  v9 = 138543618;
  v10 = v6;
  v11 = 2080;
  v12 = v8;
  _os_log_debug_impl(&dword_211704000, v5, OS_LOG_TYPE_DEBUG, "Sending %{public}@, NMS window queue is %ssuspended", (uint8_t *)&v9, 0x16u);

  OUTLINED_FUNCTION_12();
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "fileURL");
  objc_claimAutoreleasedReturnValue();
  v4 = (void *)OUTLINED_FUNCTION_13();
  _SYObfuscate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v2;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_24(&dword_211704000, v3, v6, "Failed to delete file-transfer file '%@' : %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_12();
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v0, v1, "File resolved IDS options: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_3(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_9_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "extraIDSOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v2, v4, "File extra IDS options: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)_sendResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "IDS service is nil on entry to _sendResponse. Dropping message: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __34__NMSMessageCenter__sendResponse___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "extraIDSOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v2, v5, "Response resolved IDS options: %@", v6);

  OUTLINED_FUNCTION_4_0();
}

void __34__NMSMessageCenter__sendResponse___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_9_0(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_13(), "extraIDSOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v2, v4, "Response extra IDS options: %@", v5);

  OUTLINED_FUNCTION_4_0();
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Unable to inform delegate about incoming request", v1, 2u);
  OUTLINED_FUNCTION_3_1();
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_211704000, v0, v1, "First 100 bytes of incoming unrecognized message data: %{private}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)service:(NSObject *)a3 account:incomingData:fromID:context:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_7(&dword_211704000, a3, (uint64_t)a3, "Header bytes from message (8 bytes): %{public}@", (uint8_t *)a2);

}

- (void)service:(NSObject *)a3 account:incomingData:fromID:context:.cold.4(unsigned __int16 a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_23(&dword_211704000, a3, (uint64_t)a3, "No request handler for message ID %{companionsync:SYMessageID}hu", (uint8_t *)a2);
}

- (void)service:(uint8_t *)buf account:(os_log_t)log incomingData:fromID:context:.cold.5(void *a1, unsigned __int16 a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_211704000, log, OS_LOG_TYPE_ERROR, "Could not find context for message %{public}@, type %{companionsync:SYMessageID}hu", buf, 0x12u);

}

- (void)service:(uint64_t)a3 account:incomingData:fromID:context:.cold.6(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_23(&dword_211704000, a2, a3, "No registered response handler for message: %{companionsync:SYMessageID}hu", (uint8_t *)v3);
  OUTLINED_FUNCTION_3_1();
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingData:(uint64_t)a5 fromID:(uint64_t)a6 context:(uint64_t)a7 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "Incoming data: wrapping it with an XPC transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (void)service:account:incomingData:fromID:context:.cold.8()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_10();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_24(&dword_211704000, v1, (uint64_t)v1, "Err, *whose* message? Got data for service %{public}@, but I'm listening for service %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingResourceAtURL:(uint64_t)a5 metadata:(uint64_t)a6 fromID:(uint64_t)a7 context:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_211704000, a1, a3, "Incoming file transfer: wrapping it with an XPC transaction", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_1();
}

- (void)service:account:incomingResourceAtURL:metadata:fromID:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_211704000, v0, v1, "IDS gave us a file at URL %{public}@, but our delegate doesn't respond to file transfer callbacks.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
