@implementation GEOPairedDeviceConnection

- (BOOL)isConnected
{
  GEOPairedDeviceConnection *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_isolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_connected;
  _geo_isolate_unlock();

  return (char)v2;
}

- (BOOL)isNearbyAndUsable
{
  GEOPairedDeviceConnection *v2;
  geo_isolater *v4;

  v2 = self;
  v4 = self->_isolation;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_nearby;
  _geo_isolate_unlock();

  return (char)v2;
}

+ (GEOPairedDeviceConnection)sharedInstance
{
  if (qword_1ECDBC460 != -1)
    dispatch_once(&qword_1ECDBC460, &__block_literal_global_141);
  return (GEOPairedDeviceConnection *)(id)_MergedGlobals_279;
}

void __43__GEOPairedDeviceConnection_sharedInstance__block_invoke()
{
  GEOPairedDeviceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(GEOPairedDeviceConnection);
  v1 = (void *)_MergedGlobals_279;
  _MergedGlobals_279 = (uint64_t)v0;

}

- (GEOPairedDeviceConnection)init
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  geo_isolater *v7;
  geo_isolater *isolation;
  int v9;
  IDSService *v10;
  IDSService *idsService;
  GEOPairedDeviceConnection *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *replyCallbackBlocks;
  NSLock *v15;
  NSLock *replyCallbackBlocksLock;
  NSMutableDictionary *v17;
  NSMutableDictionary *replyExpectingMessageMetadata;
  NSMutableDictionary *v19;
  NSMutableDictionary *inFlightMessageMetadata;
  objc_super v22;

  if (IDSLibraryCore()
    && (v22.receiver = self,
        v22.super_class = (Class)GEOPairedDeviceConnection,
        (self = -[GEOPairedDeviceConnection init](&v22, sel_init)) != 0))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GeoServices.PairedDeviceConnection", v4);
    queue = self->_queue;
    self->_queue = v5;

    v7 = (geo_isolater *)geo_isolater_create();
    isolation = self->_isolation;
    self->_isolation = v7;

    if (PairedDeviceRegistryLibraryCore())
    {
      v9 = objc_msgSend(getPDRRegistryClass(), "supportsPairedDevice");
      self->_supported = v9;
      if (v9)
      {
        v10 = (IDSService *)objc_msgSend(objc_alloc((Class)getIDSServiceClass()), "initWithService:", CFSTR("com.apple.private.alloy.geoservices"));
        idsService = self->_idsService;
        self->_idsService = v10;

        -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_queue);
      }
    }
    else
    {
      self->_supported = 0;
    }
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    replyCallbackBlocks = self->_replyCallbackBlocks;
    self->_replyCallbackBlocks = v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    replyCallbackBlocksLock = self->_replyCallbackBlocksLock;
    self->_replyCallbackBlocksLock = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    replyExpectingMessageMetadata = self->_replyExpectingMessageMetadata;
    self->_replyExpectingMessageMetadata = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inFlightMessageMetadata = self->_inFlightMessageMetadata;
    self->_inFlightMessageMetadata = v19;

    -[GEOPairedDeviceConnection updateConnectionStatus](self, "updateConnectionStatus");
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)start
{
  dispatch_activate((dispatch_object_t)self->_queue);
}

- (void)_updateReceiverProcessUUID:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *receiverProcessUUID;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 && !-[NSString isEqualToString:](self->_receiverProcessUUID, "isEqualToString:", v4))
  {
    GEOGetDeviceConnectionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      receiverProcessUUID = self->_receiverProcessUUID;
      *(_DWORD *)buf = 138478083;
      v14 = receiverProcessUUID;
      v15 = 2113;
      v16 = v4;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_INFO, "Receiver process UUID changed (%{private}@ -> %{private}@). Requesting clients re-sync state if necessary.", buf, 0x16u);
    }

    v7 = (NSString *)objc_msgSend(v4, "copy");
    v8 = self->_receiverProcessUUID;
    self->_receiverProcessUUID = v7;

    -[GEOPairedDeviceConnection delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[GEOPairedDeviceConnection delegateQueue](self, "delegateQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[GEOPairedDeviceConnection delegateQueue](self, "delegateQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__GEOPairedDeviceConnection__updateReceiverProcessUUID___block_invoke;
        block[3] = &unk_1E1BFF6F8;
        block[4] = self;
        dispatch_async(v11, block);

      }
    }
  }

}

void __56__GEOPairedDeviceConnection__updateReceiverProcessUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedDeviceConnectionNeedsStateSynchronization:", *(_QWORD *)(a1 + 32));

}

- (id)_nearbyConnectedDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[IDSService devices](self->_idsService, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice") && (objc_msgSend(v6, "isConnected") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_12;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldSendMessage
{
  self->_canSendMessages = 1;
  return 1;
}

- (id)_idsOptionsForMessage:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  getIDSSendMessageOptionEnforceRemoteTimeoutsKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v7 = MEMORY[0x1E0C9AAB0];
  v15[0] = MEMORY[0x1E0C9AAB0];
  getIDSSendMessageOptionBypassDuetKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = -[GEOPairedDeviceConnection _priorityForMessage:](self, "_priorityForMessage:", v5);
  if (v11 == 100)
  {
    getIDSSendMessageOptionBypassDuetKey();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v12);

  }
  return v10;
}

- (int64_t)_priorityForMessage:(id)a3
{
  int v3;
  int64_t result;

  v3 = objc_msgSend(a3, "type");
  result = 300;
  if (v3 <= 100)
  {
    if (v3 == 1)
      return result;
    return 200;
  }
  if ((v3 - 102) < 4 || v3 != 101)
    return 200;
  return result;
}

- (void)sendMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__GEOPairedDeviceConnection_sendMessage___block_invoke;
  v7[3] = &unk_1E1C00738;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __41__GEOPairedDeviceConnection_sendMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:options:withReply:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)sendMessage:(id)a3 options:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __59__GEOPairedDeviceConnection_sendMessage_options_withReply___block_invoke;
  v15[3] = &unk_1E1C01268;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __59__GEOPairedDeviceConnection_sendMessage_options_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:options:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_sendMessage:(id)a3 options:(id)a4 withReply:(id)a5
{
  __CFString *v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  GEOPairedDeviceMessageMetadata *v25;
  void *v26;
  void *v27;
  double Current;
  void *v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  NSObject *v37;
  IDSService *idsService;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _GEOPairedDeviceSentMessageMetadata *v45;
  NSObject *v46;
  uint64_t v47;
  __CFString *v48;
  NSObject *v49;
  void *v50;
  __CFString *v51;
  NSObject *v52;
  id v53;
  __CFString *v54;
  uint64_t v55;
  __CFString *v56;
  NSObject *v57;
  void *v58;
  NSMutableDictionary *replyCallbackBlocks;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  dispatch_time_t v64;
  _GEOPairedDeviceSentMessageMetadata *v65;
  NSObject *v66;
  id v67;
  id v68;
  void *v69;
  _QWORD handler[4];
  __CFString *v71;
  id v72;
  GEOPairedDeviceConnection *v73;
  _GEOPairedDeviceSentMessageMetadata *v74;
  id v75;
  id v76;
  uint8_t buf[4];
  __CFString *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  __CFString *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    GEOGetDeviceConnectionLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_FAULT, "Attempt to send message from invalid process", buf, 2u);
    }

    if (v10)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      GEOErrorDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v12, -13, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v16);

LABEL_84:
      goto LABEL_85;
    }
    goto LABEL_85;
  }
  if (!self->_supported)
  {
    GEOGetDeviceConnectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Not sending message because device does not supported paired device communication", buf, 2u);
    }

    if (!v10)
      goto LABEL_85;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 7;
LABEL_24:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("GEOPairedDeviceConnectionErrorDomain"), v19, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);
    goto LABEL_84;
  }
  if (!self->_connected)
  {
    GEOGetDeviceConnectionLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Not sending message because device is not connected", buf, 2u);
    }

    if (!v10)
      goto LABEL_85;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 3;
    goto LABEL_24;
  }
  if (-[GEOPairedDeviceConnection shouldSendMessage](self, "shouldSendMessage"))
  {
    -[GEOPairedDeviceConnection _idsOptionsForMessage:withOptions:](self, "_idsOptionsForMessage:withOptions:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (v11)
      {
        v13 = objc_msgSend(v11, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v23 = (void *)v13;
      getIDSSendMessageOptionExpectsPeerResponseKey();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v24);

      v12 = v23;
    }
    v25 = objc_alloc_init(GEOPairedDeviceMessageMetadata);
    -[__CFString setMetadata:](v8, "setMetadata:", v25);

    _processUUID();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString metadata](v8, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSenderUUID:", v26);

    Current = CFAbsoluteTimeGetCurrent();
    -[__CFString metadata](v8, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSentTimestamp:", Current);

    -[__CFString data](v8, "data");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v69, "length");
    v31 = -[GEOPairedDeviceConnection _priorityForMessage:](self, "_priorityForMessage:", v8);
    v32 = v31;
    v68 = v9;
    if (v31 == 300 && v30 > 0x100000)
    {
      GEOGetDeviceConnectionLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v78 = (__CFString *)v30;
        v79 = 2048;
        v80 = 0x100000;
        _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_INFO, "Degrading message from Urgent to Default priority due to size (%luB / %luB)", buf, 0x16u);
      }

      v32 = 200;
      v34 = 200;
    }
    else
    {
      if (v31 == 300)
        v35 = 300;
      else
        v35 = 200;
      if (v31 == 100)
        v34 = 100;
      else
        v34 = v35;
    }
    -[__CFString metadata](v8, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setPriority:", v34);

    if (v30 > 0x500000)
    {
      GEOGetDeviceConnectionLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v78 = (__CFString *)v30;
        v79 = 2048;
        v80 = 5242880;
        _os_log_impl(&dword_1885A9000, v37, OS_LOG_TYPE_ERROR, "Message exceeds maximum permitted and will likely fail (%luB / %luB)", buf, 0x16u);
      }

    }
    idsService = self->_idsService;
    -[IDSService accounts](idsService, "accounts");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "anyObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)MEMORY[0x1E0C99E60];
    getIDSDefaultPairedDevice();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setWithObject:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v76 = 0;
    LODWORD(idsService) = -[IDSService sendData:fromAccount:toDestinations:priority:options:identifier:error:](idsService, "sendData:fromAccount:toDestinations:priority:options:identifier:error:", v69, v40, v43, v32, v12, &v76, &v75);
    v44 = v76;
    v67 = v75;

    if ((_DWORD)idsService)
    {
      v45 = objc_alloc_init(_GEOPairedDeviceSentMessageMetadata);
      GEOGetDeviceConnectionLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = -[__CFString type](v8, "type");
        if ((int)v47 <= 99)
        {
          if ((_DWORD)v47)
          {
            if ((_DWORD)v47 == 1)
            {
              v48 = CFSTR("PING");
            }
            else if ((_DWORD)v47 == 2)
            {
              v48 = CFSTR("GET_STORAGE_INFO");
            }
            else
            {
LABEL_64:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v47);
              v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v48 = CFSTR("INVALID");
          }
        }
        else
        {
          switch((int)v47)
          {
            case 'd':
              v48 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
              break;
            case 'e':
              v48 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
              break;
            case 'f':
              v48 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'g':
              v48 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'h':
              v48 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
              break;
            case 'i':
              v48 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
              break;
            default:
              goto LABEL_64;
          }
        }
        v53 = v44;
        v54 = v48;
        v55 = objc_msgSend(v69, "length");
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", options: %@"), v12);
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = &stru_1E1C241D0;
        }
        *(_DWORD *)buf = 138478595;
        v78 = v54;
        v79 = 2048;
        v80 = v55;
        v81 = 2113;
        v82 = v56;
        v83 = 2113;
        v84 = v53;
        _os_log_impl(&dword_1885A9000, v46, OS_LOG_TYPE_INFO, "Sending message: %{private}@ (size = %lu%{private}@, GUID = %{private}@)", buf, 0x2Au);
        if (v12)

        v44 = v53;
      }

      GEOGetDeviceConnectionLog();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v78 = v8;
        _os_log_impl(&dword_1885A9000, v57, OS_LOG_TYPE_DEBUG, "Message contents to be sent: %{private}@", buf, 0xCu);
      }

      -[_GEOPairedDeviceSentMessageMetadata setType:](v45, "setType:", -[__CFString type](v8, "type"));
      -[__CFString metadata](v8, "metadata");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "sentTimestamp");
      -[_GEOPairedDeviceSentMessageMetadata setTimestamp:](v45, "setTimestamp:");

      -[_GEOPairedDeviceSentMessageMetadata setPayloadSize:](v45, "setPayloadSize:", objc_msgSend(v69, "length"));
      -[_GEOPairedDeviceSentMessageMetadata setReply:](v45, "setReply:", 0);
      if (v44)
      {
        if (v10)
        {
          -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
          replyCallbackBlocks = self->_replyCallbackBlocks;
          v60 = (void *)objc_msgSend(v10, "copy");
          v61 = v44;
          v62 = (void *)MEMORY[0x18D765024]();
          -[NSMutableDictionary setObject:forKey:](replyCallbackBlocks, "setObject:forKey:", v62, v61);

          v44 = v61;
          v63 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
          if (v63)
          {
            v64 = dispatch_time(0, 120000000000);
            dispatch_source_set_timer(v63, v64, 0xFFFFFFFFFFFFFFFFLL, 0);
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = __60__GEOPairedDeviceConnection__sendMessage_options_withReply___block_invoke;
            handler[3] = &unk_1E1C00898;
            v71 = v8;
            v72 = v61;
            v73 = self;
            v65 = v45;
            v74 = v65;
            dispatch_source_set_event_handler(v63, handler);
            -[_GEOPairedDeviceSentMessageMetadata setTimeoutTimer:](v65, "setTimeoutTimer:", v63);
            dispatch_resume(v63);

          }
          -[NSMutableDictionary setObject:forKey:](self->_replyExpectingMessageMetadata, "setObject:forKey:", v45, v61);
          -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");

        }
        -[NSMutableDictionary setObject:forKey:](self->_inFlightMessageMetadata, "setObject:forKey:", v45, v44);
      }
      else
      {
        GEOGetDeviceConnectionLog();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v66, OS_LOG_TYPE_ERROR, "ERROR: Did not receive an identifier for sent message", buf, 2u);
        }

      }
      v50 = v67;
      v9 = v68;
    }
    else
    {
      GEOGetDeviceConnectionLog();
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = v67;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        -[__CFString typeAsString:](v8, "typeAsString:", -[__CFString type](v8, "type"));
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v78 = v51;
        v79 = 2113;
        v80 = (uint64_t)v67;
        _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "Error sending message: messageType=%{private}@ -- %{private}@", buf, 0x16u);

      }
      GEOGetDeviceConnectionLog();
      v52 = objc_claimAutoreleasedReturnValue();
      v9 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v78 = v8;
        _os_log_impl(&dword_1885A9000, v52, OS_LOG_TYPE_DEBUG, "Message contents which failed: %{private}@", buf, 0xCu);
      }

      if (v10)
        v10[2](v10, 0, v67);
    }

    goto LABEL_84;
  }
  GEOGetDeviceConnectionLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[__CFString typeAsString:](v8, "typeAsString:", -[__CFString type](v8, "type"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v78 = v22;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "Not sending message because connection was short circuited: %{private}@", buf, 0xCu);

  }
  if (v10)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = 4;
    goto LABEL_24;
  }
LABEL_85:

}

void __60__GEOPairedDeviceConnection__sendMessage_options_withReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  GEOGetDeviceConnectionLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "typeAsString:", objc_msgSend(*(id *)(a1 + 32), "type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v13 = v3;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1885A9000, v2, OS_LOG_TYPE_ERROR, "ERROR: Timed out waiting for reply to message: messageType=%{public}@. GUID = %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v5, "copy");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "setTimeoutTimer:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "unlock");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0C9AFB0];
    v11 = CFSTR("Timed out.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("GEOPairedDeviceConnectionErrorDomain"), 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v6)[2](v6, 0, v9);

  }
}

- (void)_sendReply:(id)a3 forMessage:(id)a4 forMessageIdentifier:(id)a5 messageReceivedTimestamp:(double)a6
{
  __CFString *v10;
  id v11;
  id v12;
  double Current;
  GEOPairedDeviceReplyMetadata *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  IDSService *idsService;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  _GEOPairedDeviceSentMessageMetadata *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  __CFString *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v52 = MEMORY[0x1E0C81028];
    v53 = "Assertion failed: reply != ((void *)0)";
LABEL_56:
    _os_log_fault_impl(&dword_1885A9000, v52, OS_LOG_TYPE_FAULT, v53, buf, 2u);
    goto LABEL_51;
  }
  if (!v12)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    v52 = MEMORY[0x1E0C81028];
    v53 = "Assertion failed: originalMessageIdentifier != ((void *)0)";
    goto LABEL_56;
  }
  if (self->_connected)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if ((-[__CFString hasMetadata](v10, "hasMetadata") & 1) == 0)
    {
      v14 = objc_alloc_init(GEOPairedDeviceReplyMetadata);
      -[__CFString setMetadata:](v10, "setMetadata:", v14);

    }
    _processUUID();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString metadata](v10, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSenderUUID:", v15);

    -[__CFString metadata](v10, "metadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setResponseTime:", Current - a6);

    -[__CFString metadata](v10, "metadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRequestReceivedTimestamp:", a6);

    -[__CFString metadata](v10, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSentTimestamp:", Current);

    -[__CFString data](v10, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0C99E08];
    getIDSSendMessageOptionPeerResponseIdentifierKey();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v12;
    objc_msgSend(v21, "dictionaryWithObject:forKey:", v12, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[GEOPairedDeviceConnection _idsOptionsForMessage:withOptions:](self, "_idsOptionsForMessage:withOptions:", v11, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v23, "addEntriesFromDictionary:", v24);
    v55 = (void *)v24;
    v58 = v11;
    v25 = -[GEOPairedDeviceConnection _priorityForMessage:](self, "_priorityForMessage:", v11);
    idsService = self->_idsService;
    -[IDSService accounts](idsService, "accounts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "anyObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v23;
    v30 = (void *)MEMORY[0x1E0C99E60];
    getIDSDefaultPairedDevice();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setWithObject:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    v60 = 0;
    v56 = v29;
    LODWORD(idsService) = -[IDSService sendData:fromAccount:toDestinations:priority:options:identifier:error:](idsService, "sendData:fromAccount:toDestinations:priority:options:identifier:error:", v20, v28, v32, v25, v29, &v60, &v59);
    v33 = v60;
    v54 = v59;

    GEOGetDeviceConnectionLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (_GEOPairedDeviceSentMessageMetadata *)v34;
    if ((_DWORD)idsService)
    {
      v36 = v20;
      v37 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v38 = objc_msgSend(v58, "type");
        if ((int)v38 <= 99)
        {
          if ((_DWORD)v38)
          {
            if ((_DWORD)v38 == 1)
            {
              v39 = CFSTR("PING");
            }
            else if ((_DWORD)v38 == 2)
            {
              v39 = CFSTR("GET_STORAGE_INFO");
            }
            else
            {
LABEL_41:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v38);
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v39 = CFSTR("INVALID");
          }
        }
        else
        {
          switch((int)v38)
          {
            case 'd':
              v39 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
              break;
            case 'e':
              v39 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
              break;
            case 'f':
              v39 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'g':
              v39 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'h':
              v39 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
              break;
            case 'i':
              v39 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
              break;
            default:
              goto LABEL_41;
          }
        }
        v46 = v39;
        v47 = objc_msgSend(v20, "length");
        -[__CFString metadata](v10, "metadata");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "responseTime");
        v50 = v49;

        *(_DWORD *)buf = 138478595;
        v62 = v39;
        v63 = 2048;
        v64 = v47;
        v65 = 2048;
        v66 = v50;
        v67 = 2113;
        v37 = v33;
        v68 = v33;
        _os_log_impl(&dword_1885A9000, &v35->super, OS_LOG_TYPE_INFO, "Sending reply for original message: %{private}@ (size = %lu, response time = %f, GUID = %{private}@)", buf, 0x2Au);

      }
      GEOGetDeviceConnectionLog();
      v51 = objc_claimAutoreleasedReturnValue();
      v43 = v55;
      v42 = v56;
      v11 = v58;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v62 = v10;
        v63 = 2113;
        v64 = (uint64_t)v58;
        _os_log_impl(&dword_1885A9000, v51, OS_LOG_TYPE_DEBUG, "Reply contents to be sent: %{private}@\n Original message contents: %{private}@", buf, 0x16u);
      }

      v35 = objc_alloc_init(_GEOPairedDeviceSentMessageMetadata);
      -[_GEOPairedDeviceSentMessageMetadata setType:](v35, "setType:", objc_msgSend(v58, "type"));
      -[_GEOPairedDeviceSentMessageMetadata setTimestamp:](v35, "setTimestamp:", Current);
      -[_GEOPairedDeviceSentMessageMetadata setPayloadSize:](v35, "setPayloadSize:", objc_msgSend(v36, "length"));
      -[_GEOPairedDeviceSentMessageMetadata setReply:](v35, "setReply:", 1);
      -[NSMutableDictionary setObject:forKey:](self->_inFlightMessageMetadata, "setObject:forKey:", v35, v37);
      v12 = v57;
      v44 = v54;
    }
    else if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v11 = v58;
      v41 = objc_msgSend(v58, "type");
      v36 = v20;
      v42 = v56;
      v12 = v57;
      v43 = v55;
      v37 = v33;
      if ((int)v41 <= 99)
      {
        v44 = v54;
        if ((_DWORD)v41)
        {
          if ((_DWORD)v41 == 1)
          {
            v45 = CFSTR("PING");
          }
          else if ((_DWORD)v41 == 2)
          {
            v45 = CFSTR("GET_STORAGE_INFO");
          }
          else
          {
LABEL_48:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v41);
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v45 = CFSTR("INVALID");
        }
      }
      else
      {
        v44 = v54;
        switch((int)v41)
        {
          case 'd':
            v45 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
            break;
          case 'e':
            v45 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
            break;
          case 'f':
            v45 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'g':
            v45 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
            break;
          case 'h':
            v45 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
            break;
          case 'i':
            v45 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
            break;
          default:
            goto LABEL_48;
        }
      }
      *(_DWORD *)buf = 138543618;
      v62 = v45;
      v63 = 2114;
      v64 = (uint64_t)v44;
      _os_log_impl(&dword_1885A9000, &v35->super, OS_LOG_TYPE_ERROR, "Error sending reply to message: messageType=%{public}@ -- %{public}@", buf, 0x16u);

    }
    else
    {
      v36 = v20;
      v42 = v56;
      v12 = v57;
      v11 = v58;
      v37 = v33;
      v44 = v54;
      v43 = v55;
    }

  }
  else
  {
    GEOGetDeviceConnectionLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v40, OS_LOG_TYPE_INFO, "Not sending reply because device is not connected", buf, 2u);
    }

  }
LABEL_51:

}

- (void)updateConnectionStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  int connected;
  BOOL v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  NSObject *delegateQueue;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD block[10];
  char v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (self->_supported)
  {
    GEOGetDeviceConnectionLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IDSService devices](self->_idsService, "devices");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v57 = (uint64_t)v4;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Updating connection status with devices: %{private}@", buf, 0xCu);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[IDSService devices](self->_idsService, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v50 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v9, "isDefaultPairedDevice") && objc_msgSend(v9, "isConnected"))
          {
            LODWORD(v6) = objc_msgSend(v9, "isNearby");
            v10 = 1;
            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 0;
LABEL_15:

    connected = self->_connected;
    v12 = self->_nearby == (_DWORD)v6 && connected == v10;
    v13 = !v12;
    if (!v12)
    {
      block[5] = MEMORY[0x1E0C809B0];
      block[6] = 3221225472;
      block[7] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke;
      block[8] = &unk_1E1C11C20;
      block[9] = self;
      v47 = v6;
      v48 = v10;
      geo_isolate_sync_data();
    }
    if (connected != v10)
    {
      if (self->_connected)
      {
        -[GEOPairedDeviceConnection delegateQueue](self, "delegateQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_2;
          block[3] = &unk_1E1BFF6F8;
          block[4] = self;
          dispatch_async(v14, block);
        }

LABEL_50:
        delegateQueue = self->_delegateQueue;
        if (delegateQueue)
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_25;
          v37[3] = &unk_1E1BFF6F8;
          v37[4] = self;
          dispatch_async(delegateQueue, v37);
        }
        return;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("GEOPairedDeviceConnectionErrorDomain"), 1, 0);
      -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
      -[NSMutableDictionary allValues](self->_replyCallbackBlocks, "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "copy");

      -[NSMutableDictionary allValues](self->_replyExpectingMessageMetadata, "allValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      -[NSMutableDictionary removeAllObjects](self->_replyCallbackBlocks, "removeAllObjects");
      -[NSMutableDictionary removeAllObjects](self->_replyExpectingMessageMetadata, "removeAllObjects");
      -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
      if (objc_msgSend(v18, "count"))
      {
        GEOGetDeviceConnectionLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend(v18, "count");
          *(_DWORD *)buf = 134217984;
          v57 = v22;
          _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, "Canceling %lu requests due to lost connection to paired device", buf, 0xCu);
        }

      }
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v23 = v20;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v43;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v43 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
            objc_msgSend(v28, "timeoutTimer");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              objc_msgSend(v28, "timeoutTimer");
              v30 = objc_claimAutoreleasedReturnValue();
              dispatch_source_cancel(v30);

              objc_msgSend(v28, "setTimeoutTimer:", 0);
            }
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        }
        while (v25);
      }

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = v18;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v39;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v39 != v34)
              objc_enumerationMutation(v31);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * k) + 16))();
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
        }
        while (v33);
      }

    }
    if (!v13)
      return;
    goto LABEL_50;
  }
}

uint64_t __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 81) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 41);
  return result;
}

void __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "pairedDeviceConnectionNeedsStateSynchronization:", *(_QWORD *)(a1 + 32));

}

void __51__GEOPairedDeviceConnection_updateConnectionStatus__block_invoke_25(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GEOPairedDeviceConnectionConnectivityDidChange"), *(_QWORD *)(a1 + 32));

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  double Current;
  void *v12;
  void *v13;
  NSMutableDictionary *replyCallbackBlocks;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  GEOPairedDeviceMessage *v19;
  NSObject *v20;
  GEOPairedDeviceReplyEnvelope *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  double v27;
  double v28;
  NSObject *v29;
  double v30;
  uint64_t v31;
  const __CFString *v32;
  const char *v33;
  NSObject *v34;
  uint64_t v35;
  __CFString *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  double v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  __CFString *v67;
  NSObject *v68;
  const char *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[4];
  NSObject *v74;
  GEOPairedDeviceConnection *v75;
  GEOPairedDeviceMessage *v76;
  _QWORD block[4];
  NSObject *v78;
  GEOPairedDeviceConnection *v79;
  GEOPairedDeviceMessage *v80;
  id v81;
  double v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a7;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v10, "incomingResponseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "incomingResponseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
    replyCallbackBlocks = self->_replyCallbackBlocks;
    objc_msgSend(v10, "incomingResponseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](replyCallbackBlocks, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 != 0;

    -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
  }
  else
  {
    v17 = 0;
  }
  GEOGetDeviceConnectionLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (GEOPairedDeviceMessage *)v18;
  if (v9)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      v84 = v12;
      _os_log_impl(&dword_1885A9000, &v19->super.super, OS_LOG_TYPE_DEBUG, "Received data with incomingResponseIdentifier: %{private}@", buf, 0xCu);
    }

    if (v17)
    {
      GEOGetDeviceConnectionLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "incomingResponseIdentifier matches message awaiting reply", buf, 2u);
      }

      v21 = -[GEOPairedDeviceReplyEnvelope initWithData:]([GEOPairedDeviceReplyEnvelope alloc], "initWithData:", v9);
      v19 = (GEOPairedDeviceMessage *)v21;
      if (v21)
      {
        -[GEOPairedDeviceReplyEnvelope metadata](v21, "metadata");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "senderUUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPairedDeviceConnection _updateReceiverProcessUUID:](self, "_updateReceiverProcessUUID:", v23);

        -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
        -[NSMutableDictionary objectForKey:](self->_replyExpectingMessageMetadata, "objectForKey:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](self->_replyExpectingMessageMetadata, "removeObjectForKey:", v12);
        -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
        -[NSObject timeoutTimer](v24, "timeoutTimer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[NSObject timeoutTimer](v24, "timeoutTimer");
          v26 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v26);

          -[NSObject setTimeoutTimer:](v24, "setTimeoutTimer:", 0);
        }
        -[NSObject timestamp](v24, "timestamp");
        v28 = v27;
        GEOGetDeviceConnectionLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
LABEL_54:

          GEOGetDeviceConnectionLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138477827;
            v84 = v19;
            _os_log_impl(&dword_1885A9000, v44, OS_LOG_TYPE_DEBUG, "Received reply contents: %{private}@", buf, 0xCu);
          }

          -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
          -[NSMutableDictionary objectForKey:](self->_replyCallbackBlocks, "objectForKey:", v12);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "copy");

          if (!v46)
          {
            -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
LABEL_101:

            goto LABEL_102;
          }
          -[NSMutableDictionary removeObjectForKey:](self->_replyCallbackBlocks, "removeObjectForKey:", v12);
          -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
          GEOGetDeviceConnectionLog();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1885A9000, v47, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
          }

          v48 = -[GEOPairedDeviceMessage whichResult](v19, "whichResult");
          if (v48 != 2)
          {
            if (v48 == 1)
            {
              -[GEOPairedDeviceMessage success](v19, "success");
              v49 = (id)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, id, _QWORD))(v46 + 16))(v46, v49, 0);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("No reply payload or error"));
              v49 = (id)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, id))(v46 + 16))(v46, 0, v49);
            }
LABEL_81:

            goto LABEL_101;
          }
          -[GEOPairedDeviceMessage error](v19, "error");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v50, "hasSerializedError") & 1) != 0)
          {
            v51 = (void *)MEMORY[0x1E0CB3710];
            v52 = objc_opt_class();
            -[GEOPairedDeviceMessage error](v19, "error");
            v72 = v12;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "serializedError");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "unarchivedObjectOfClass:fromData:error:", v52, v54, 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            v12 = v72;
            if (v55)
            {
LABEL_69:
              (*(void (**)(uint64_t, _QWORD, void *))(v46 + 16))(v46, 0, v55);

              goto LABEL_101;
            }
          }
          else
          {

          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Failed to deserialize error"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_69;
        }
        v30 = Current - v28;
        v31 = -[NSObject type](v24, "type");
        v71 = v12;
        if ((int)v31 > 99)
        {
          switch((int)v31)
          {
            case 'd':
              v32 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
              goto LABEL_52;
            case 'e':
              v32 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
              goto LABEL_52;
            case 'f':
              v32 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
              goto LABEL_52;
            case 'g':
              v32 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
              goto LABEL_52;
            case 'h':
              v32 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
              goto LABEL_52;
            case 'i':
              v32 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
              goto LABEL_52;
            default:
              goto LABEL_71;
          }
        }
        if ((_DWORD)v31)
        {
          if ((_DWORD)v31 == 1)
          {
            v32 = CFSTR("PING");
          }
          else
          {
            if ((_DWORD)v31 != 2)
            {
LABEL_71:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_53;
            }
            v32 = CFSTR("GET_STORAGE_INFO");
          }
        }
        else
        {
          v32 = CFSTR("INVALID");
        }
LABEL_52:
        v70 = (void *)v32;
LABEL_53:
        v38 = objc_msgSend(v9, "length");
        -[GEOPairedDeviceMessage metadata](v19, "metadata");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "responseTime");
        v41 = v40;
        objc_msgSend(v10, "incomingResponseIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "outgoingResponseIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138479107;
        v84 = v70;
        v85 = 2048;
        v86 = v38;
        v87 = 2048;
        v88 = v30;
        v89 = 2048;
        v90 = v41;
        v91 = 2113;
        v92 = v42;
        v93 = 2113;
        v94 = v43;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_INFO, "Received reply for original message type: %{private}@ (size = %lu, elapsed time = %f, remote processing time = %f, incoming guid = %{private}@, outgoing guid = %{private}@)", buf, 0x3Eu);

        v12 = v71;
        goto LABEL_54;
      }
      GEOGetDeviceConnectionLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v37 = "Invalid reply data";
LABEL_30:
        _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      }
    }
    else
    {
      v19 = -[GEOPairedDeviceMessage initWithData:]([GEOPairedDeviceMessage alloc], "initWithData:", v9);
      GEOGetDeviceConnectionLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v24 = v34;
      if (v19)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v35 = -[GEOPairedDeviceMessage type](v19, "type");
          if ((int)v35 <= 99)
          {
            if ((_DWORD)v35)
            {
              if ((_DWORD)v35 == 1)
              {
                v36 = CFSTR("PING");
              }
              else if ((_DWORD)v35 == 2)
              {
                v36 = CFSTR("GET_STORAGE_INFO");
              }
              else
              {
LABEL_72:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v35);
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v36 = CFSTR("INVALID");
            }
          }
          else
          {
            switch((int)v35)
            {
              case 'd':
                v36 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
                break;
              case 'e':
                v36 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
                break;
              case 'f':
                v36 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
                break;
              case 'g':
                v36 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
                break;
              case 'h':
                v36 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
                break;
              case 'i':
                v36 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
                break;
              default:
                goto LABEL_72;
            }
          }
          v56 = objc_msgSend(v9, "length");
          -[GEOPairedDeviceMessage metadata](v19, "metadata");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "sentTimestamp");
          *(_DWORD *)buf = 138478339;
          v84 = v36;
          v85 = 2048;
          v86 = v56;
          v87 = 2048;
          v88 = Current - v58;
          _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_INFO, "Received message type: %{private}@ (size = %lu, sent %f seconds ago)", buf, 0x20u);

        }
        GEOGetDeviceConnectionLog();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138477827;
          v84 = v19;
          _os_log_impl(&dword_1885A9000, v59, OS_LOG_TYPE_DEBUG, "Received message contents: %{private}@", buf, 0xCu);
        }

        -[GEOPairedDeviceMessage metadata](v19, "metadata");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "senderUUID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPairedDeviceConnection _updateReceiverProcessUUID:](self, "_updateReceiverProcessUUID:", v61);

        -[GEOPairedDeviceConnection delegate](self, "delegate");
        v24 = objc_claimAutoreleasedReturnValue();
        -[GEOPairedDeviceConnection delegateQueue](self, "delegateQueue");
        v62 = objc_claimAutoreleasedReturnValue();
        v46 = v62;
        if (v24)
        {
          if (v62)
          {
            if (!objc_msgSend(v10, "expectsPeerResponse"))
            {
              v73[0] = MEMORY[0x1E0C809B0];
              v73[1] = 3221225472;
              v73[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_4;
              v73[3] = &unk_1E1C01790;
              v74 = v24;
              v75 = self;
              v76 = v19;
              dispatch_async((dispatch_queue_t)v46, v73);

              goto LABEL_101;
            }
            objc_msgSend(v10, "outgoingResponseIdentifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v63)
            {
              GEOGetDeviceConnectionLog();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                v66 = -[GEOPairedDeviceMessage type](v19, "type");
                if ((int)v66 <= 99)
                {
                  if ((_DWORD)v66)
                  {
                    if ((_DWORD)v66 == 1)
                    {
                      v67 = CFSTR("PING");
                    }
                    else if ((_DWORD)v66 == 2)
                    {
                      v67 = CFSTR("GET_STORAGE_INFO");
                    }
                    else
                    {
LABEL_98:
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v66);
                      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                  }
                  else
                  {
                    v67 = CFSTR("INVALID");
                  }
                }
                else
                {
                  switch((int)v66)
                  {
                    case 'd':
                      v67 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
                      break;
                    case 'e':
                      v67 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
                      break;
                    case 'f':
                      v67 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
                      break;
                    case 'g':
                      v67 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
                      break;
                    case 'h':
                      v67 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
                      break;
                    case 'i':
                      v67 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
                      break;
                    default:
                      goto LABEL_98;
                  }
                }
                *(_DWORD *)buf = 138543362;
                v84 = v67;
                _os_log_impl(&dword_1885A9000, v65, OS_LOG_TYPE_ERROR, "Message wants reply, but didn't receive a message identifier! Message: %{public}@", buf, 0xCu);

              }
              goto LABEL_101;
            }
            objc_msgSend(v10, "outgoingResponseIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke;
            block[3] = &unk_1E1C017E0;
            v78 = v24;
            v79 = self;
            v80 = v19;
            v81 = v64;
            v82 = Current;
            v49 = v64;
            dispatch_async((dispatch_queue_t)v46, block);

            goto LABEL_81;
          }
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_101;
          *(_WORD *)buf = 0;
          v68 = MEMORY[0x1E0C81028];
          v69 = "Assertion failed: delegateQueue != ((void *)0)";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_101;
          *(_WORD *)buf = 0;
          v68 = MEMORY[0x1E0C81028];
          v69 = "Assertion failed: delegate != ((void *)0)";
        }
        _os_log_fault_impl(&dword_1885A9000, v68, OS_LOG_TYPE_FAULT, v69, buf, 2u);
        goto LABEL_101;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v37 = "Invalid message data";
        goto LABEL_30;
      }
    }
LABEL_102:

    goto LABEL_103;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v33 = "NO";
    if (v17)
      v33 = "YES";
    *(_DWORD *)buf = 138478083;
    v84 = v12;
    v85 = 2080;
    v86 = (uint64_t)v33;
    _os_log_impl(&dword_1885A9000, &v19->super.super, OS_LOG_TYPE_ERROR, "Missing data with incomingResponseIdentifier: %{private}@ (Reply: %s) ", buf, 0x16u);
  }
LABEL_103:

}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_2;
  v5[3] = &unk_1E1C11C70;
  v5[4] = v3;
  v6 = v4;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v2, "pairedDeviceConnection:handleIncomingMessage:completionHandler:", v3, v6, v5);

}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_3;
  v12[3] = &unk_1E1C11C48;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 96);
  v12[1] = 3221225472;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = *(id *)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

void __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_3(uint64_t a1)
{
  GEOPairedDeviceReplyEnvelope *v2;
  uint64_t v3;
  void *v4;
  GEOPairedDeviceReplyError *v5;
  GEOPairedDeviceReplyEnvelope *v6;

  v2 = objc_alloc_init(GEOPairedDeviceReplyEnvelope);
  v6 = v2;
  if (*(_QWORD *)(a1 + 32))
  {
    -[GEOPairedDeviceReplyEnvelope setSuccess:](v2, "setSuccess:");
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = objc_alloc_init(GEOPairedDeviceReplyError);
        -[GEOPairedDeviceReplyError setSerializedError:](v5, "setSerializedError:", v4);
        -[GEOPairedDeviceReplyEnvelope setError:](v6, "setError:", v5);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "_sendReply:forMessage:forMessageIdentifier:messageReceivedTimestamp:", v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __73__GEOPairedDeviceConnection_service_account_incomingData_fromID_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pairedDeviceConnection:handleIncomingMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  __CFString *v10;
  __CFString *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  NSObject *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a5;
  v11 = (__CFString *)a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_inFlightMessageMetadata, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_inFlightMessageMetadata, "removeObjectForKey:", v10);
    GEOGetDeviceConnectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (objc_msgSend(v12, "isReply"))
          v15 = CFSTR("reply");
        else
          v15 = CFSTR("message");
        v16 = objc_msgSend(v12, "type");
        if ((int)v16 <= 99)
        {
          if ((_DWORD)v16)
          {
            if ((_DWORD)v16 == 1)
            {
              v17 = CFSTR("PING");
            }
            else if ((_DWORD)v16 == 2)
            {
              v17 = CFSTR("GET_STORAGE_INFO");
            }
            else
            {
LABEL_23:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
              v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v17 = CFSTR("INVALID");
          }
        }
        else
        {
          switch((int)v16)
          {
            case 'd':
              v17 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
              break;
            case 'e':
              v17 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
              break;
            case 'f':
              v17 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'g':
              v17 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'h':
              v17 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
              break;
            case 'i':
              v17 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
              break;
            default:
              goto LABEL_23;
          }
        }
        *(_DWORD *)buf = 138543875;
        v29 = v15;
        v30 = 2113;
        v31 = v17;
        v32 = 2113;
        v33 = v10;
        _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_DEBUG, "Finished sending %{public}@ for type: %{private}@ (GUID = %{private}@)", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v10;
      _os_log_impl(&dword_1885A9000, v14, OS_LOG_TYPE_FAULT, "Unable to find metadata for message GUID = %{public}@. This could throw off the in-flight message bookkeeping", buf, 0xCu);
    }

    if (!a6)
    {
      -[NSLock lock](self->_replyCallbackBlocksLock, "lock");
      -[NSMutableDictionary objectForKey:](self->_replyCallbackBlocks, "objectForKey:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v18, "copy");

      -[NSMutableDictionary removeObjectForKey:](self->_replyCallbackBlocks, "removeObjectForKey:", v10);
      -[NSMutableDictionary removeObjectForKey:](self->_replyExpectingMessageMetadata, "removeObjectForKey:", v10);
      -[NSLock unlock](self->_replyCallbackBlocksLock, "unlock");
      GEOGetDeviceConnectionLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v12, "type");
        if ((int)v21 <= 99)
        {
          if ((_DWORD)v21)
          {
            if ((_DWORD)v21 == 1)
            {
              v22 = CFSTR("PING");
            }
            else if ((_DWORD)v21 == 2)
            {
              v22 = CFSTR("GET_STORAGE_INFO");
            }
            else
            {
LABEL_41:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            v22 = CFSTR("INVALID");
          }
        }
        else
        {
          switch((int)v21)
          {
            case 'd':
              v22 = CFSTR("CONFIGURE_SUBSCRIPTION_SHOULD_SYNC");
              break;
            case 'e':
              v22 = CFSTR("START_STOP_SUBSCRIPTION_DOWNLOAD");
              break;
            case 'f':
              v22 = CFSTR("CHECKIN_WITH_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'g':
              v22 = CFSTR("SET_SUBSCRIPTION_STATE_SUMMARY");
              break;
            case 'h':
              v22 = CFSTR("SET_OBSERVED_SUBSCRIPTION_IDENTIFIERS");
              break;
            case 'i':
              v22 = CFSTR("UPDATE_SUBSCRIPTION_STATE");
              break;
            default:
              goto LABEL_41;
          }
        }
        *(_DWORD *)buf = 138478339;
        v29 = v22;
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v10;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Error sending message: messageType=%{private}@ -- %{public}@ (GUID = %{public}@)", buf, 0x20u);

      }
      if (v19)
      {
        objc_msgSend(v12, "timeoutTimer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v12, "timeoutTimer");
          v24 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v24);

          objc_msgSend(v12, "setTimeoutTimer:", 0);
        }
        GEOGetDeviceConnectionLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_DEBUG, "Sending reply to callback block", buf, 2u);
        }

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v11, *MEMORY[0x1E0CB3388]);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GEOPairedDeviceConnectionErrorDomain"), 5, v26);
        v27 = objc_claimAutoreleasedReturnValue();

        v19[2](v19, 0, v27);
        v11 = (__CFString *)v27;
      }

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: identifier != ((void *)0)", buf, 2u);
  }

}

- (GEOPairedDeviceConnectionDelegate)delegate
{
  return (GEOPairedDeviceConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverProcessUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_inFlightMessageMetadata, 0);
  objc_storeStrong((id *)&self->_replyExpectingMessageMetadata, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocksLock, 0);
  objc_storeStrong((id *)&self->_replyCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsService, 0);
}

- (void)sendStartStopSubscriptionDownload:(id)a3
{
  id v4;
  GEOPairedDeviceMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v5, "setType:", 101);
  -[GEOPairedDeviceMessage setStartStopSubscriptionDownload:](v5, "setStartStopSubscriptionDownload:", v4);

  -[GEOPairedDeviceConnection sendMessage:](self, "sendMessage:", v5);
}

- (void)sendCheckinWithSubscriptionStateSummary:(id)a3
{
  id v4;
  GEOPairedDeviceMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v5, "setType:", 102);
  -[GEOPairedDeviceMessage setCheckinWithSubscriptionStateSummary:](v5, "setCheckinWithSubscriptionStateSummary:", v4);

  -[GEOPairedDeviceConnection sendMessage:](self, "sendMessage:", v5);
}

- (void)sendSetSubscriptionStateSummary:(id)a3
{
  id v4;
  GEOPairedDeviceMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v5, "setType:", 103);
  -[GEOPairedDeviceMessage setSetSubscriptionStateSummary:](v5, "setSetSubscriptionStateSummary:", v4);

  -[GEOPairedDeviceConnection sendMessage:](self, "sendMessage:", v5);
}

- (void)sendSetObservedSubscriptionIdentifiers:(id)a3
{
  id v4;
  GEOPairedDeviceMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v5, "setType:", 104);
  -[GEOPairedDeviceMessage setSetObservedSubscriptionIdentifiers:](v5, "setSetObservedSubscriptionIdentifiers:", v4);

  -[GEOPairedDeviceConnection sendMessage:](self, "sendMessage:", v5);
}

- (void)sendUpdateSubscriptionState:(id)a3
{
  id v4;
  GEOPairedDeviceMessage *v5;

  v4 = a3;
  v5 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v5, "setType:", 105);
  -[GEOPairedDeviceMessage setUpdateSubscriptionState:](v5, "setUpdateSubscriptionState:", v4);

  -[GEOPairedDeviceConnection sendMessage:](self, "sendMessage:", v5);
}

- (void)sendPing:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  GEOPairedDeviceMessage *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v8, "setType:", 1);
  -[GEOPairedDeviceMessage setPing:](v8, "setPing:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__GEOPairedDeviceConnection_TypedMessageConveniences__sendPing_withReply___block_invoke;
  v10[3] = &unk_1E1C220A0;
  v11 = v6;
  v9 = v6;
  -[GEOPairedDeviceConnection sendMessage:options:withReply:](self, "sendMessage:options:withReply:", v8, 0, v10);

}

void __74__GEOPairedDeviceConnection_TypedMessageConveniences__sendPing_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = objc_msgSend(v9, "whichPayload");
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == 1)
    {
      objc_msgSend(v9, "ping");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)sendGetStorageInfo:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  GEOPairedDeviceMessage *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v8, "setType:", 2);
  -[GEOPairedDeviceMessage setGetStorageInfo:](v8, "setGetStorageInfo:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__GEOPairedDeviceConnection_TypedMessageConveniences__sendGetStorageInfo_withReply___block_invoke;
  v10[3] = &unk_1E1C220A0;
  v11 = v6;
  v9 = v6;
  -[GEOPairedDeviceConnection sendMessage:options:withReply:](self, "sendMessage:options:withReply:", v8, 0, v10);

}

void __84__GEOPairedDeviceConnection_TypedMessageConveniences__sendGetStorageInfo_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = objc_msgSend(v9, "whichPayload");
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == 2)
    {
      objc_msgSend(v9, "getStorageInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)sendConfigureSubscriptionShouldSync:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  GEOPairedDeviceMessage *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(GEOPairedDeviceMessage);
  -[GEOPairedDeviceMessage setType:](v8, "setType:", 100);
  -[GEOPairedDeviceMessage setConfigureSubscriptionShouldSync:](v8, "setConfigureSubscriptionShouldSync:", v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__GEOPairedDeviceConnection_TypedMessageConveniences__sendConfigureSubscriptionShouldSync_withReply___block_invoke;
  v10[3] = &unk_1E1C220A0;
  v11 = v6;
  v9 = v6;
  -[GEOPairedDeviceConnection sendMessage:options:withReply:](self, "sendMessage:options:withReply:", v8, 0, v10);

}

void __101__GEOPairedDeviceConnection_TypedMessageConveniences__sendConfigureSubscriptionShouldSync_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
  {
    v6 = objc_msgSend(v9, "whichPayload");
    v7 = *(_QWORD *)(a1 + 32);
    if (v6 == 3)
    {
      objc_msgSend(v9, "configureSubscriptionShouldSync");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
