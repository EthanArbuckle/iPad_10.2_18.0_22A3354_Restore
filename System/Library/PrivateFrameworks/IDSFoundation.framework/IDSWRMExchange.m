@implementation IDSWRMExchange

+ (id)sharedInstance
{
  if (qword_1ECDD47D0 != -1)
    dispatch_once(&qword_1ECDD47D0, &unk_1E3C1B930);
  return (id)qword_1ECDD4820;
}

- (IDSWRMExchange)init
{
  char *v2;
  IDSWRMExchange *v3;
  void *v4;
  id delegateBlock;
  IDSWRMMetricContainer *v6;
  IDSWRMMetricContainer *metrics;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v26;
  char *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)IDSWRMExchange;
  v2 = -[IDSWRMExchange init](&v28, sel_init);
  v3 = (IDSWRMExchange *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 24) = vdupq_n_s64(2uLL);
    *((_WORD *)v2 + 24) = 0;
    v4 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = 0;

    delegateBlock = v3->_delegateBlock;
    v3->_delegateBlock = 0;

    v3->_reportInterval = 0;
    v3->_shouldSendReport = 0;
    v3->_connectCount = 0;
    v3->_activeRecommendationType = 2;
    *(_WORD *)&v3->_isPaired = 0;
    v3->_isConnected = 0;
    v6 = objc_alloc_init(IDSWRMMetricContainer);
    metrics = v3->_metrics;
    v3->_metrics = v6;

    objc_msgSend__resetLocalMetric(v3, v8, v9, v10);
    objc_msgSend_UTF8String(CFSTR("kIDSPairingStateChangedNotification"), v11, v12, v13);
    IMUserScopedNotification();
    im_primary_queue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = v3;
    im_notify_register_dispatch();

    v3->_isPaired = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2("com.apple.ids.connection.queue", v15, v16);
    v18 = (void *)*((_QWORD *)v27 + 1);
    *((_QWORD *)v27 + 1) = v17;

    objc_msgSend__startXPCConnection(v27, v19, v20, v21, v26, 3221225472, sub_19BA984C4, &unk_1E3C21CF8);
    objc_msgSend__registerWithWRM(v27, v22, v23, v24);

  }
  return v3;
}

- (void)dealloc
{
  uint64_t v2;
  double v3;
  objc_super v5;

  objc_msgSend__stopXPCConnection(self, a2, v2, v3);
  notify_cancel(self->_isPairedNotifyToken);
  v5.receiver = self;
  v5.super_class = (Class)IDSWRMExchange;
  -[IDSWRMExchange dealloc](&v5, sel_dealloc);
}

- (void)_submitBlockAsync:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    if (queue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_19BA985A8;
      block[3] = &unk_1E3C1FC70;
      v8 = v4;
      dispatch_async(queue, block);

    }
  }

}

- (void)_dispatchAfter:(double)a3 block:(id)a4
{
  id v6;
  dispatch_time_t v7;
  dispatch_block_t block;

  v6 = a4;
  if (v6 && self->_queue)
  {
    block = v6;
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    dispatch_after(v7, (dispatch_queue_t)self->_queue, block);
    v6 = block;
  }

}

- (void)_startXPCConnection
{
  NSObject *queue;
  OS_xpc_object *mach_service;
  OS_xpc_object *connection;
  OS_xpc_object *v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[16];

  queue = self->_queue;
  if (queue)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", queue, 0);
    connection = self->_connection;
    self->_connection = mach_service;

    v6 = self->_connection;
    if (v6)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_19BA9885C;
      handler[3] = &unk_1E3C21CD0;
      handler[4] = self;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_resume(self->_connection);
      return;
    }
    OSLogHandleForTransportCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v9, OS_LOG_TYPE_DEFAULT, "Failed to create a XPC connection to WirelessRadioManagerd", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("Failed to create a XPC connection to WirelessRadioManagerd"));
        if (_IDSShouldLog())
        {
          v8 = CFSTR("Failed to create a XPC connection to WirelessRadioManagerd");
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    OSLogHandleForTransportCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "Failed to start XPC connection due to nil _queue", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("Failed to start XPC connection due to nil _queue"));
        if (_IDSShouldLog())
        {
          v8 = CFSTR("Failed to start XPC connection due to nil _queue");
LABEL_16:
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), v8);
        }
      }
    }
  }
}

- (void)_stopXPCConnection
{
  OS_xpc_object *connection;
  OS_xpc_object *v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_set_event_handler(connection, &unk_1E3C1C270);
    xpc_connection_cancel(self->_connection);
    v4 = self->_connection;
    self->_connection = 0;

  }
  self->_registered = 0;
}

- (void)_restartClient
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_19BA98904;
  v2[3] = &unk_1E3C1F898;
  v2[4] = self;
  objc_msgSend__submitBlockAsync_(self, a2, (uint64_t)v2, COERCE_DOUBLE(3221225472));
}

- (void)_processXPCEvent:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  const char *v11;
  char *v12;
  NSObject *v13;
  const char *v14;
  const char *string;
  NSObject *v16;
  const char *v17;
  char *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1A1AC8B08]();
  v8 = MEMORY[0x1E0C812F8];
  if (v5 == MEMORY[0x1E0C812F8])
  {
    if ((objc_msgSend__processXPCMessage_(self, v6, (uint64_t)v4, v7) & 1) == 0)
    {
      v12 = (char *)MEMORY[0x1A1AC8A78](v4);
      OSLogHandleForIDSCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "<unknown";
        if (v12)
          v14 = v12;
        *(_DWORD *)buf = 136315138;
        v29 = v14;
        _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Failed to process this event: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Failed to process this event: %s"));
      free(v12);
    }
    if (v8 != MEMORY[0x1E0C81310])
      goto LABEL_21;
  }
  else
  {
    if (v5 != MEMORY[0x1E0C81310])
    {
      v9 = (char *)MEMORY[0x1A1AC8A78](v4);
      OSLogHandleForIDSCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = "<unknown>";
        if (v9)
          v11 = v9;
        *(_DWORD *)buf = 136315138;
        v29 = v11;
        _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "Received an unexpected message from WRM: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Received an unexpected message from WRM: %s"));
      free(v9);
LABEL_21:
      self->_connectCount = 0;
      goto LABEL_64;
    }
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    OSLogHandleForTransportCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = "<unknown>";
      if (string)
        v17 = string;
      *(_DWORD *)buf = 136315138;
      v29 = v17;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Received error message from WRM: %s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v18 = string ? (char *)string : "<unknown>";
      v27 = v18;
      _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("Received error message from WRM: %s"));
      if (_IDSShouldLog())
      {
        v27 = v18;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Received error message from WRM: %s"));
      }
    }
    if (v4 == (id)MEMORY[0x1E0C81260])
    {
      OSLogHandleForTransportCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "WirelessRadioManagerd is not running", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("WirelessRadioManagerd is not running"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("WirelessRadioManagerd is not running"));
        }
      }
    }
    else if (v4 == (id)MEMORY[0x1E0C81258])
    {
      OSLogHandleForTransportCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "WirelessRadioManagerd daemon has crashed", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("WirelessRadioManagerd daemon has crashed"));
          if (_IDSShouldLog())
            _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("WirelessRadioManagerd daemon has crashed"));
        }
      }
    }
    else
    {
      OSLogHandleForTransportCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = "<unknown>";
        if (string)
          v20 = string;
        *(_DWORD *)buf = 136315138;
        v29 = v20;
        _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Received unknown error message from WirelessRadioManagerd: %s", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        if (!string)
          string = "<unknown>";
        v27 = (void *)string;
        _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("Received unknown error message from WirelessRadioManagerd: %s"));
        if (_IDSShouldLog())
        {
          v27 = (void *)string;
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Received unknown error message from WirelessRadioManagerd: %s"));
        }
      }
    }
    OSLogHandleForTransportCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "Trying to reconnect to WirelessRadioManagerd daemon", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSWRMExchange"), CFSTR("IDS"), CFSTR("Trying to reconnect to WirelessRadioManagerd daemon"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Trying to reconnect to WirelessRadioManagerd daemon"));
      }
    }
    objc_msgSend__reconnectUntilTimeout(self, v24, v25, v26, v27);
  }
LABEL_64:

}

- (void)_reconnectUntilTimeout
{
  _QWORD v2[5];

  if (self->_connectCount <= 9u)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = sub_19BA990B8;
    v2[3] = &unk_1E3C1F898;
    v2[4] = self;
    objc_msgSend__dispatchAfter_block_(self, a2, (uint64_t)v2, 1000.0);
  }
}

- (void)_sendXPCMessage:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19BA99178;
    v9[3] = &unk_1E3C1FDD8;
    v9[4] = self;
    v10 = v4;
    objc_msgSend__submitBlockAsync_(self, v7, (uint64_t)v9, v8);

  }
}

- (BOOL)_isXPCDictionary:(id)a3
{
  return a3 && MEMORY[0x1A1AC8B08](a3, a2) == MEMORY[0x1E0C812F8];
}

- (id)_newRegisterMessage
{
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "kMessageId", 1uLL);
    v5 = xpc_dictionary_create(0, 0, 0);
    v8 = v5;
    if (v5)
    {
      xpc_dictionary_set_uint64(v5, "kWCMRegisterProcess_ProcessId", 0xBuLL);
      xpc_dictionary_set_value(v4, "kMessageArgs", v8);
    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v7))
      v9 = v4;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_newSubscribeMessage
{
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel__newPrefSubscribeMessage_, 0);
}

- (id)_newSubscribeStatusUpdateMessage
{
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel__newPrefSubscribeMessage_, 1);
}

- (id)_newSubscribeStatusUpdateMessage:(BOOL)a3 nearby:(BOOL)a4
{
  self->_isNearby = a4;
  self->_isConnected = a3;
  return (id)((uint64_t (*)(IDSWRMExchange *, char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel__newPrefSubscribeMessage_, 1);
}

- (id)_newPrefSubscribeMessage:(BOOL)a3
{
  _BOOL4 v3;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t activeRecommendationType;
  const char *v9;
  xpc_object_t v10;
  double v11;
  xpc_object_t v12;
  void *v13;
  uint64_t nearbyOverWiFi;
  const char *v15;
  id v16;
  xpc_object_t v17;
  void *v18;

  v3 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (!v5)
  {
    v16 = 0;
    goto LABEL_23;
  }
  if (v3)
    v7 = 403;
  else
    v7 = 402;
  xpc_dictionary_set_uint64(v5, "kMessageId", v7);
  activeRecommendationType = self->_activeRecommendationType;
  if (activeRecommendationType != 2)
    xpc_dictionary_set_uint64(v6, "kWRMSubscriptionType", activeRecommendationType);
  v10 = xpc_array_create(0, 0);
  if (v10)
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    v13 = v12;
    if (!v12)
    {
LABEL_16:
      v17 = xpc_dictionary_create(0, 0, 0);
      v18 = v17;
      if (v17)
      {
        xpc_dictionary_set_value(v17, "kWRMApplicationTypeList", v10);
        xpc_dictionary_set_value(v6, "kMessageArgs", v18);
      }

      goto LABEL_19;
    }
    xpc_dictionary_set_uint64(v12, "kWRMApplicationType", 0);
    xpc_dictionary_set_uint64(v13, "kWRMLinkDirection", 2uLL);
    if (v3)
    {
      xpc_dictionary_set_uint64(v13, "kWRMLinkType", self->_activeLinkType);
      xpc_dictionary_set_uint64(v13, "kWRMCompPairedWithGizmo", self->_isPaired);
      xpc_dictionary_set_uint64(v13, "kWRMNearByOverBT", self->_isNearby);
      xpc_dictionary_set_uint64(v13, "kWRMConnected", self->_isConnected);
      nearbyOverWiFi = self->_nearbyOverWiFi;
      v15 = "kWRMNearByOverWiFi";
    }
    else
    {
      nearbyOverWiFi = self->_recommendedLinkType;
      if (nearbyOverWiFi == 2)
      {
LABEL_15:
        xpc_array_append_value(v10, v13);
        goto LABEL_16;
      }
      v15 = "kWRMLinkType";
    }
    xpc_dictionary_set_uint64(v13, v15, nearbyOverWiFi);
    goto LABEL_15;
  }
LABEL_19:
  if (objc_msgSend__isXPCDictionary_(self, v9, (uint64_t)v6, v11))
    v16 = v6;
  else
    v16 = 0;

LABEL_23:
  return v16;
}

- (id)_newUnsubscribeMessage
{
  xpc_object_t v3;
  void *v4;
  uint64_t activeRecommendationType;
  const char *v6;
  xpc_object_t v7;
  double v8;
  xpc_object_t v9;
  void *v10;
  id v11;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_uint64(v3, "kMessageId", 0x192uLL);
    activeRecommendationType = self->_activeRecommendationType;
    if (activeRecommendationType != 2)
      xpc_dictionary_set_uint64(v4, "kWRMSubscriptionType", activeRecommendationType);
    v7 = xpc_array_create(0, 0);
    if (v7)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      v10 = v9;
      if (v9)
      {
        xpc_dictionary_set_value(v9, "kWRMApplicationTypeList", v7);
        xpc_dictionary_set_value(v4, "kMessageArgs", v10);
      }

    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v8))
      v11 = v4;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_registerWithWRM
{
  uint64_t v2;
  double v3;
  const char *v5;
  double v6;
  id v7;

  self->_registered = 1;
  v7 = (id)objc_msgSend__newRegisterMessage(self, a2, v2, v3);
  objc_msgSend__sendXPCMessage_(self, v5, (uint64_t)v7, v6);

}

- (void)subscribeForRecommendation:(id)a3 recommendationType:(unint64_t)a4 block:(id)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  double v13;
  unint64_t activeRecommendationType;
  IDSWRMExchange *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  id delegateBlock;
  const char *v22;
  _QWORD v23[6];

  v9 = a3;
  v12 = a5;
  activeRecommendationType = self->_activeRecommendationType;
  if (activeRecommendationType != 2 && activeRecommendationType != a4)
    objc_msgSend_unsubscribeForRecommendation(self, v10, v11, v13);
  v16 = self;
  objc_sync_enter(v16);
  objc_storeStrong((id *)&v16->_delegateQueue, a3);
  if (v12)
  {
    v20 = objc_msgSend_copy(v12, v17, v18, v19);
    delegateBlock = v16->_delegateBlock;
    v16->_delegateBlock = (id)v20;

  }
  objc_sync_exit(v16);

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = sub_19BA99840;
  v23[3] = &unk_1E3C21428;
  v23[4] = v16;
  v23[5] = a4;
  objc_msgSend__submitBlockAsync_(v16, v22, (uint64_t)v23, COERCE_DOUBLE(3221225472));

}

- (void)_restartSubscriptionIfNeeded
{
  NSObject *v3;
  unint64_t activeRecommendationType;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  unint64_t v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_subscribed && (self->_activeLinkType == 1 || self->_recommendedLinkType != 3))
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      activeRecommendationType = self->_activeRecommendationType;
      *(_DWORD *)buf = 67109120;
      v13 = activeRecommendationType;
      _os_log_impl(&dword_19B949000, v3, OS_LOG_TYPE_DEFAULT, "Re-subscribe to WRM for link recommendations of type: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
        v11 = self->_activeRecommendationType;
        _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Re-subscribe to WRM for link recommendations of type: %d"));
      }
    }
    v8 = (void *)objc_msgSend__newSubscribeMessage(self, v5, v6, v7, v11);
    objc_msgSend__sendXPCMessage_(self, v9, (uint64_t)v8, v10);

  }
}

- (void)unsubscribeForRecommendation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_19BA99B18;
  v2[3] = &unk_1E3C1F898;
  v2[4] = self;
  objc_msgSend__submitBlockAsync_(self, a2, (uint64_t)v2, COERCE_DOUBLE(3221225472));
}

- (BOOL)_processXPCMessage:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  NSObject *v8;
  uint64_t uint64;
  const char *v10;
  double v11;
  char v12;
  BOOL v13;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6))
  {
    v7 = (void *)MEMORY[0x1A1AC8A78](v4);
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = v7;
      _os_log_impl(&dword_19B949000, v8, OS_LOG_TYPE_DEFAULT, "Got an event = %s", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Got an event = %s"));
    free(v7);
    uint64 = xpc_dictionary_get_uint64(v4, "kMessageId");
    if (uint64 == 1103)
    {
      v12 = objc_msgSend__processMetricsConfigEvent_(self, v10, (uint64_t)v4, v11);
      goto LABEL_12;
    }
    if (uint64 == 1301)
    {
      v12 = objc_msgSend__processLinkPreferenceNotificationEvent_(self, v10, (uint64_t)v4, v11);
LABEL_12:
      v13 = v12;
      goto LABEL_13;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_processLinkPreferenceNotificationEvent:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  const char *v14;
  void *v15;
  double v16;
  uint64_t uint64;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;

  v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6)
    && xpc_dictionary_get_uint64(v4, "kMessageId") == 1301)
  {
    xpc_dictionary_get_value(v4, "kMessageArgs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__isXPCDictionary_(self, v8, (uint64_t)v7, v9))
    {
      xpc_dictionary_get_value(v7, "kWRMApplicationTypeList");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10 && MEMORY[0x1A1AC8B08](v10) == MEMORY[0x1E0C812C8] && xpc_array_get_count(v11))
      {
        xpc_array_get_value(v11, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          && objc_msgSend__isXPCDictionary_(self, v14, (uint64_t)v15, v16)
          && !xpc_dictionary_get_uint64(v15, "kWRMApplicationType")
          && (uint64 = xpc_dictionary_get_uint64(v15, "kWRMLinkType"), (uint64 & 0xFFFFFFFFFFFFFFFDLL) == 1))
        {
          if (objc_msgSend__setRecommendedLinkType_(self, v18, uint64, v19))
            objc_msgSend__notifyDelegate(self, v20, v21, v22);
          v12 = 1;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isWiFiRecommended
{
  return self->_recommendedLinkType == 1;
}

- (BOOL)isBTRecommended
{
  return self->_recommendedLinkType == 3;
}

- (unint64_t)recommendedLinkType
{
  return self->_recommendedLinkType;
}

- (BOOL)_setRecommendedLinkType:(unint64_t)a3
{
  unint64_t recommendedLinkType;
  NSObject *v6;
  unint64_t v7;
  const char *v8;
  const char *v9;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  recommendedLinkType = self->_recommendedLinkType;
  if (recommendedLinkType != a3)
  {
    self->_recommendedLinkType = a3;
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_recommendedLinkType;
      v8 = "Unknown";
      if (v7 == 3)
        v8 = "BT";
      if (v7 == 1)
        v9 = "WiFi";
      else
        v9 = v8;
      *(_DWORD *)buf = 136315138;
      v12 = v9;
      _os_log_impl(&dword_19B949000, v6, OS_LOG_TYPE_DEFAULT, "Recommended link changed to '%s'", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Recommended link changed to '%s'"));
  }
  return recommendedLinkType != a3;
}

- (void)_notifyDelegate
{
  void (**delegateBlock)(id, unint64_t);

  delegateBlock = (void (**)(id, unint64_t))self->_delegateBlock;
  if (delegateBlock)
    delegateBlock[2](delegateBlock, self->_recommendedLinkType);
}

- (void)_setReportInterval:(unint64_t)a3
{
  unint64_t v3;
  _QWORD block[5];

  if (a3 && !self->_reportInterval)
  {
    v3 = 5000;
    if (a3 > 0x1388)
      v3 = a3;
    self->_reportInterval = v3;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19BA9A1C8;
    block[3] = &unk_1E3C1F898;
    block[4] = self;
    if (qword_1EE40B4D0 != -1)
      dispatch_once(&qword_1EE40B4D0, block);
  }
}

- (BOOL)_processMetricsConfigEvent:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  uint64_t uint64;
  const char *v11;
  double v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend__isXPCDictionary_(self, v5, (uint64_t)v4, v6)
    && xpc_dictionary_get_uint64(v4, "kMessageId") == 1103)
  {
    xpc_dictionary_get_value(v4, "kMessageArgs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend__isXPCDictionary_(self, v8, (uint64_t)v7, v9)
      && (uint64 = xpc_dictionary_get_uint64(v7, "PeriodRptInval")) != 0)
    {
      objc_msgSend__setReportInterval_(self, v11, uint64, v12);
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_newMetricReportMessage
{
  xpc_object_t v3;
  void *v4;
  uint64_t activeRecommendationType;
  const char *v6;
  uint64_t v7;
  xpc_object_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  id v58;

  if (self->_metrics)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    v4 = v3;
    if (!v3)
    {
      v58 = 0;
LABEL_38:

      return v58;
    }
    activeRecommendationType = self->_activeRecommendationType;
    if (activeRecommendationType != 2)
      xpc_dictionary_set_uint64(v3, "kWRMSubscriptionType", activeRecommendationType);
    xpc_dictionary_set_uint64(v4, "kMessageId", 0x258uLL);
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      if (objc_msgSend_StreamBytesSent(self->_metrics, v6, v7, v9) != -1)
      {
        v13 = objc_msgSend_StreamBytesSent(self->_metrics, v10, v11, v12);
        xpc_dictionary_set_uint64(v8, "StrmBytesSnt", v13);
      }
      if (objc_msgSend_StreamBytesReceived(self->_metrics, v10, v11, v12) != -1)
      {
        v17 = objc_msgSend_StreamBytesReceived(self->_metrics, v14, v15, v16);
        xpc_dictionary_set_uint64(v8, "StrmBytesRcvd", v17);
      }
      if (objc_msgSend_StreamPacketsSent(self->_metrics, v14, v15, v16) != -1)
      {
        v21 = objc_msgSend_StreamPacketsSent(self->_metrics, v18, v19, v20);
        xpc_dictionary_set_uint64(v8, "StrmPktsSnt", v21);
      }
      if (objc_msgSend_StreamPacketsReceived(self->_metrics, v18, v19, v20) != -1)
      {
        v25 = objc_msgSend_StreamPacketsReceived(self->_metrics, v22, v23, v24);
        xpc_dictionary_set_uint64(v8, "StrmPktRcvd", v25);
      }
      if (objc_msgSend_MessageSentSize(self->_metrics, v22, v23, v24) != -1)
      {
        v29 = objc_msgSend_MessageSentSize(self->_metrics, v26, v27, v28);
        xpc_dictionary_set_uint64(v8, "LocMsgSntSz", v29);
      }
      if (objc_msgSend_MessageReceivedSize(self->_metrics, v26, v27, v28) != -1)
      {
        v33 = objc_msgSend_MessageReceivedSize(self->_metrics, v30, v31, v32);
        xpc_dictionary_set_uint64(v8, "LocMsgRcvdMgSz", v33);
      }
      if (objc_msgSend_MessageDeliveredSize(self->_metrics, v30, v31, v32) != -1)
      {
        v37 = objc_msgSend_MessageDeliveredSize(self->_metrics, v34, v35, v36);
        xpc_dictionary_set_uint64(v8, "DeliveredMsgSz", v37);
      }
      if (objc_msgSend_MessageDeliveredDeliveryError(self->_metrics, v34, v35, v36) != -1)
      {
        v41 = objc_msgSend_MessageDeliveredDeliveryError(self->_metrics, v38, v39, v40);
        xpc_dictionary_set_uint64(v8, "LocMsgDeliveryEr", v41);
      }
      if (objc_msgSend_MessageDeliveredRTT(self->_metrics, v38, v39, v40) != -1)
      {
        v45 = objc_msgSend_MessageDeliveredRTT(self->_metrics, v42, v43, v44);
        xpc_dictionary_set_uint64(v8, "LocMsgDeliveredRTT", v45);
      }
      if (objc_msgSend_numMessageReceivedSize(self->_metrics, v42, v43, v44))
      {
        v49 = objc_msgSend_numMessageReceivedSize(self->_metrics, v46, v47, v48);
        xpc_dictionary_set_uint64(v8, "LocMsgRcvd", v49);
      }
      if (objc_msgSend_numMessageSentSize(self->_metrics, v46, v47, v48))
      {
        v53 = objc_msgSend_numMessageSentSize(self->_metrics, v50, v51, v52);
        xpc_dictionary_set_uint64(v8, "LocMsgSnt", v53);
      }
      if (objc_msgSend_numMessageDeliveredSize(self->_metrics, v50, v51, v52))
      {
        v57 = objc_msgSend_numMessageDeliveredSize(self->_metrics, v54, v55, v56);
        xpc_dictionary_set_uint64(v8, "LocMsgDelivered", v57);
      }
      if (!xpc_dictionary_get_count(v8))
        goto LABEL_36;
      xpc_dictionary_set_value(v4, "kMessageArgs", v8);
    }
    if (objc_msgSend__isXPCDictionary_(self, v6, (uint64_t)v4, v9))
    {
      v58 = v4;
LABEL_37:

      goto LABEL_38;
    }
LABEL_36:
    v58 = 0;
    goto LABEL_37;
  }
  return 0;
}

- (void)_sendMetricReport
{
  uint64_t v2;
  double v3;
  const char *v5;
  uint64_t v6;
  double v7;
  id v8;

  if (self->_shouldSendReport)
  {
    v8 = (id)objc_msgSend__newMetricReportMessage(self, a2, v2, v3);
    if (v8)
      objc_msgSend__sendXPCMessage_(self, v5, (uint64_t)v8, v7);
    self->_shouldSendReport = 0;
    objc_msgSend__resetLocalMetric(self, v5, v6, v7);

  }
}

- (void)_sendMetricReportPeriodically
{
  uint64_t v2;
  double v3;
  double reportInterval;
  const char *v6;
  _QWORD v7[5];

  objc_msgSend__sendMetricReport(self, a2, v2, v3);
  reportInterval = (double)self->_reportInterval;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19BA9A648;
  v7[3] = &unk_1E3C1F898;
  v7[4] = self;
  objc_msgSend__dispatchAfter_block_(self, v6, (uint64_t)v7, reportInterval);
}

- (void)submitMetric:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_19BA9A6D0;
    v8[3] = &unk_1E3C1FDD8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend__submitBlockAsync_(self, v6, (uint64_t)v8, v7);

  }
}

- (void)_updateLocalMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  IDSWRMMetricContainer *metrics;
  uint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  IDSWRMMetricContainer *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  IDSWRMMetricContainer *v25;
  uint64_t v26;
  const char *v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  IDSWRMMetricContainer *v32;
  uint64_t v33;
  const char *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  IDSWRMMetricContainer *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  const char *v43;
  uint64_t v44;
  double v45;
  IDSWRMMetricContainer *v46;
  uint64_t v47;
  const char *v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  IDSWRMMetricContainer *v53;
  uint64_t v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  double v59;
  IDSWRMMetricContainer *v60;
  uint64_t v61;
  const char *v62;
  double v63;
  const char *v64;
  uint64_t v65;
  double v66;
  IDSWRMMetricContainer *v67;
  uint64_t v68;
  const char *v69;
  double v70;
  id v71;

  v4 = a3;
  if (v4 && self->_metrics)
  {
    v71 = v4;
    if (objc_msgSend_StreamBytesSent(v4, v5, v6, v7) != -1)
    {
      metrics = self->_metrics;
      v12 = objc_msgSend_StreamBytesSent(v71, v8, v9, v10);
      objc_msgSend_setStreamBytesSent_(metrics, v13, v12, v14);
    }
    if (objc_msgSend_StreamBytesReceived(v71, v8, v9, v10) != -1)
    {
      v18 = self->_metrics;
      v19 = objc_msgSend_StreamBytesReceived(v71, v15, v16, v17);
      objc_msgSend_setStreamBytesReceived_(v18, v20, v19, v21);
    }
    if (objc_msgSend_StreamPacketsSent(v71, v15, v16, v17) != -1)
    {
      v25 = self->_metrics;
      v26 = objc_msgSend_StreamPacketsSent(v71, v22, v23, v24);
      objc_msgSend_setStreamPacketsSent_(v25, v27, v26, v28);
    }
    if (objc_msgSend_StreamPacketsReceived(v71, v22, v23, v24) != -1)
    {
      v32 = self->_metrics;
      v33 = objc_msgSend_StreamPacketsReceived(v71, v29, v30, v31);
      objc_msgSend_setStreamPacketsReceived_(v32, v34, v33, v35);
    }
    if (objc_msgSend_MessageSentSize(v71, v29, v30, v31) != -1)
    {
      v39 = self->_metrics;
      v40 = objc_msgSend_MessageSentSize(v71, v36, v37, v38);
      objc_msgSend_setMessageSentSize_(v39, v41, v40, v42);
    }
    if (objc_msgSend_MessageReceivedSize(v71, v36, v37, v38) != -1)
    {
      v46 = self->_metrics;
      v47 = objc_msgSend_MessageReceivedSize(v71, v43, v44, v45);
      objc_msgSend_setMessageReceivedSize_(v46, v48, v47, v49);
    }
    if (objc_msgSend_MessageDeliveredSize(v71, v43, v44, v45) != -1)
    {
      v53 = self->_metrics;
      v54 = objc_msgSend_MessageDeliveredSize(v71, v50, v51, v52);
      objc_msgSend_setMessageDeliveredSize_(v53, v55, v54, v56);
    }
    if (objc_msgSend_MessageDeliveredDeliveryError(v71, v50, v51, v52) != -1)
    {
      v60 = self->_metrics;
      v61 = objc_msgSend_MessageDeliveredDeliveryError(v71, v57, v58, v59);
      objc_msgSend_setMessageDeliveredDeliveryError_(v60, v62, v61, v63);
    }
    if (objc_msgSend_MessageDeliveredRTT(v71, v57, v58, v59) != -1)
    {
      v67 = self->_metrics;
      v68 = objc_msgSend_MessageDeliveredRTT(v71, v64, v65, v66);
      objc_msgSend_setMessageDeliveredRTT_(v67, v69, v68, v70);
    }
    self->_shouldSendReport = 1;
    v4 = v71;
  }

}

- (void)_resetLocalMetric
{
  uint64_t v2;
  double v3;
  IDSWRMMetricContainer *metrics;

  metrics = self->_metrics;
  if (metrics)
    objc_msgSend_resetMetric(metrics, a2, v2, v3);
}

- (void)handleActiveLinkChange:(unint64_t)a3
{
  NSObject *v5;
  const char *v6;
  unint64_t activeLinkType;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *updated;
  id v18;
  const char *v19;
  double v20;
  const char *v21;
  const char *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a3 == 2 || self->_activeLinkType != a3)
  {
    OSLogHandleForIDSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "Unknown";
      activeLinkType = self->_activeLinkType;
      if (activeLinkType == 3)
        v8 = "BT";
      else
        v8 = "Unknown";
      if (activeLinkType == 1)
        v9 = "WiFi";
      else
        v9 = v8;
      if (a3 == 3)
        v6 = "BT";
      if (a3 == 1)
        v6 = "WiFi";
      *(_DWORD *)buf = 136315394;
      v26 = v9;
      v27 = 2080;
      v28 = v6;
      _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Active link changed from '%s' to '%s'", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v13 = self->_activeLinkType;
      v14 = "Unknown";
      if (v13 == 3)
        v15 = "BT";
      else
        v15 = "Unknown";
      if (v13 == 1)
        v16 = "WiFi";
      else
        v16 = v15;
      if (a3 == 3)
        v14 = "BT";
      if (a3 == 1)
        v14 = "WiFi";
      v21 = v16;
      v22 = v14;
      _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSWRMExchange"), CFSTR("Active link changed from '%s' to '%s'"));
    }
    self->_activeLinkType = a3;
    updated = (void *)objc_msgSend__newSubscribeStatusUpdateMessage(self, v10, v11, v12, v21, v22);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19BA9AA9C;
    v23[3] = &unk_1E3C1FDD8;
    v23[4] = self;
    v24 = updated;
    v18 = updated;
    objc_msgSend__submitBlockAsync_(self, v19, (uint64_t)v23, v20);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegateBlock, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
