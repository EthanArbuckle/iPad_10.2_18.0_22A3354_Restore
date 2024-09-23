@implementation IDSDirectMessageConnection

- (IDSDirectMessageConnection)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSDirectMessageConnection *v12;
  IDSDirectMessageConnection *v13;
  unint64_t v14;
  void *v15;
  char *v16;
  id v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *queueOneToMessageIDDictionary;
  NSMutableDictionary *v20;
  NSMutableDictionary *messageIDToMessageDictionary;
  uint64_t v22;
  IDSServiceProperties *serviceProperties;
  IDSServiceProperties *v24;
  IMPowerAssertion *assertion;
  NSDictionary *powerAssertionOptions;
  NSObject *v27;
  IDSDirectMessageConnection *v28;
  objc_super v30;
  uint8_t buf[4];
  IDSDirectMessageConnection *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)IDSDirectMessageConnection;
  v12 = -[IDSDirectMessageConnection init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    do
      v14 = __ldaxr(&qword_1EE1E07E8);
    while (__stlxr(v14 + 1, &qword_1EE1E07E8));
    v12->_identifier = v14;
    objc_storeStrong((id *)&v12->_serviceName, a3);
    -[NSString stringByReplacingOccurrencesOfString:withString:](v13->_serviceName, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple.private.alloy."), &stru_1E2C65AE8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v16 = (char *)malloc_type_calloc(1uLL, objc_msgSend(v15, "length") + 1, 0xD8F7420AuLL);
      v13->_shortServiceNameCString = v16;
      v17 = objc_retainAutorelease(v15);
      strlcpy(v16, (const char *)objc_msgSend(v17, "UTF8String"), objc_msgSend(v17, "length") + 1);
    }
    objc_storeStrong((id *)&v13->_connectionQueue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queueOneToMessageIDDictionary = v13->_queueOneToMessageIDDictionary;
    v13->_queueOneToMessageIDDictionary = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    messageIDToMessageDictionary = v13->_messageIDToMessageDictionary;
    v13->_messageIDToMessageDictionary = v20;

    v13->_notifyToken = -1;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34E80]), "initWithServiceIdentifier:", v13->_serviceName);
    serviceProperties = v13->_serviceProperties;
    v13->_serviceProperties = (IDSServiceProperties *)v22;

    v24 = v13->_serviceProperties;
    if (!v24)
    {
      -[IDSDirectMessageConnection cancel](v13, "cancel");

      v28 = 0;
      goto LABEL_11;
    }
    v13->_dataProtectionClass = -[IDSServiceProperties dataProtectionClass](v24, "dataProtectionClass");
    assertion = v13->_assertion;
    v13->_assertion = 0;

    powerAssertionOptions = v13->_powerAssertionOptions;
    v13->_powerAssertionOptions = 0;

    *(_QWORD *)&v13->_directMessagingTimeOutMSEC = 21474836500000;
    v13->_directMessagingReportStatsMSEC = 60;
    +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "%@ Created", buf, 0xCu);
    }

  }
  v28 = v13;
LABEL_11:

  return v28;
}

- (void)parseDirectMessagingState
{
  NSObject *v3;
  unint64_t directMessagingState;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 directMessagingSupported;
  int v8;
  IDSDirectMessageConnection *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    directMessagingState = self->_directMessagingState;
    v8 = 138412546;
    v9 = self;
    v10 = 2048;
    v11 = directMessagingState;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "%@ parsing direct messaging state: %llu", (uint8_t *)&v8, 0x16u);
  }

  self->_directMessagingSupported = 0;
  *(_WORD *)&self->_peerSupportsDeviceConnection = 0;
  v5 = self->_directMessagingState;
  if ((v5 & 2) == 0)
  {
    if ((v5 & 1) == 0)
      goto LABEL_12;
    self->_directMessagingSupported = 1;
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  -[IDSDirectMessageConnection invalidate](self, "invalidate");
  -[IDSDirectMessageConnection setDestinationDevice:](self, "setDestinationDevice:", 0);
  if (!self->_directMessagingSupported)
    goto LABEL_12;
  v5 = self->_directMessagingState;
  if ((v5 & 4) != 0)
LABEL_9:
    self->_peerSupportsDeviceConnection = 1;
LABEL_10:
  if ((v5 & 8) != 0)
    self->_conciseACKSupported = 1;
LABEL_12:
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    directMessagingSupported = self->_directMessagingSupported;
    v8 = 138412546;
    v9 = self;
    v10 = 1024;
    LODWORD(v11) = directMessagingSupported;
    _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "%@ direct messaging supported: %d", (uint8_t *)&v8, 0x12u);
  }

}

- (void)dealloc
{
  NSObject *v3;
  unint64_t identifier;
  char *shortServiceNameCString;
  char *v6;
  objc_super v7;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    shortServiceNameCString = self->_shortServiceNameCString;
    if (!shortServiceNameCString)
      shortServiceNameCString = "<unknown>";
    *(_DWORD *)buf = 134218242;
    v9 = identifier;
    v10 = 2080;
    v11 = shortServiceNameCString;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "[%llu %s] Dealloc", buf, 0x16u);
  }

  -[IDSDirectMessageConnection cancel](self, "cancel");
  v6 = self->_shortServiceNameCString;
  if (v6)
  {
    free(v6);
    self->_shortServiceNameCString = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IDSDirectMessageConnection;
  -[IDSDirectMessageConnection dealloc](&v7, sel_dealloc);
}

- (id)description
{
  id v3;
  char *shortServiceNameCString;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("[%llu "), self->_identifier);
  shortServiceNameCString = self->_shortServiceNameCString;
  if (!shortServiceNameCString)
    shortServiceNameCString = "<unknown>";
  objc_msgSend(v3, "appendFormat:", CFSTR("%s "), shortServiceNameCString);
  objc_msgSend(v3, "appendFormat:", CFSTR("%s]"), nw_connection_state_to_string());
  return v3;
}

- (void)cancel
{
  NSObject *v3;
  int notifyToken;
  int v5;
  IDSDirectMessageConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "%@ Cancel", (uint8_t *)&v5, 0xCu);
  }

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
  }
  -[IDSDirectMessageConnection invalidate](self, "invalidate");
}

- (void)invalidate
{
  NSObject *v3;
  int v4;
  IDSDirectMessageConnection *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "%@ Invalidate", (uint8_t *)&v4, 0xCu);
  }

  -[IDSDirectMessageConnection resetConnection](self, "resetConnection");
  -[IDSDirectMessageConnection updateMetadata:](self, "updateMetadata:", 0);
  -[IDSDirectMessageConnection cancelPendingAckTimer](self, "cancelPendingAckTimer");
  -[NSMutableDictionary removeAllObjects](self->_messageIDToMessageDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_queueOneToMessageIDDictionary, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_connectionMessageSendQueue, "removeAllObjects");
}

- (void)setDestinationDevice:(id)a3
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  IDSDevice *device;
  int v11;
  IDSDirectMessageConnection *v12;
  __int16 v13;
  IDSDevice *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "assertQueueIsCurrent");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1907E7220();

  }
  objc_storeStrong((id *)&self->_device, a3);
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = device;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%@ Updated destination device: %@", (uint8_t *)&v11, 0x16u);
  }

  if (self->_connectionIsIncoming)
  {
    self->_connectionIsIncoming = 0;
    -[IDSDirectMessageConnection setupIDSDeviceConnection](self, "setupIDSDeviceConnection");
  }

}

- (BOOL)canUseDirectMessaging
{
  return self->_directMessagingSupported && self->_directMessagingAllowed;
}

+ (BOOL)isDirectMessagingRequested:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  BOOL v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("IDSSendMessageOptionDirectMessaging"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "objectForKey:", CFSTR("IDSSendMessageOptionFireAndForget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "BOOLValue"))
  {

    goto LABEL_6;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)isMessageEligible:(id)a3 options:(id)a4 destinationDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  int64_t trafficClassApplied;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "assertQueueIsCurrent");

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1907E72AC();

  }
  if (!-[IDSDirectMessageConnection canUseDirectMessaging](self, "canUseDirectMessaging"))
    goto LABEL_14;
  if (!self->_trafficClassInitialized)
  {
    if (v10)
      goto LABEL_11;
LABEL_14:
    LOBYTE(v16) = 0;
    goto LABEL_22;
  }
  trafficClassApplied = self->_trafficClassApplied;
  v15 = objc_msgSend(v8, "priority");
  LOBYTE(v16) = 0;
  if (v10 && trafficClassApplied == v15)
  {
LABEL_11:
    v17 = (void *)IDSCopyIDForDevice(v10);
    if (v17)
    {
      objc_msgSend(v8, "destinations");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "destinationURIs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "containsObject:", *MEMORY[0x1E0D345D0]))
      {

      }
      else
      {
        objc_msgSend(v8, "destinations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "destinationURIs");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", v17);

        if (!v22)
          goto LABEL_20;
      }
      if ((objc_msgSend(v8, "allowCloudDelivery") & 1) == 0)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("IDSSendMessageOptionAllowCloudDeliveryKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "BOOLValue");

        if ((v24 & 1) == 0 && (objc_msgSend(v8, "nonWaking") & 1) == 0)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("IDSSendMessageOptionNonWaking"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if ((v26 & 1) == 0)
          {
            objc_msgSend(v8, "data");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28 || (objc_msgSend(v8, "message"), (v28 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
            {

            }
            else
            {
              objc_msgSend(v8, "protobuf");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v16)
                goto LABEL_21;
            }
            LOBYTE(v16) = objc_msgSend((id)objc_opt_class(), "isDirectMessagingRequested:", v9);
LABEL_21:

            goto LABEL_22;
          }
        }
      }
    }
LABEL_20:
    LOBYTE(v16) = 0;
    goto LABEL_21;
  }
LABEL_22:

  return (char)v16;
}

- (void)updateConnectedDevices:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 peerIsNearby;
  _BOOL4 peerIsConnected;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  IDSDirectMessageConnection *v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  _BOOL4 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E7338();

  }
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = self;
    v32 = 2112;
    *(_QWORD *)v33 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "%@ connected devices changed %@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v14, "_internal", (_QWORD)v26);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isDefaultPairedDevice");

          if (v16)
          {
            if (!self->_device)
              -[IDSDirectMessageConnection setDestinationDevice:](self, "setDestinationDevice:", v14);
            objc_msgSend(v14, "_internal");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isConnected");

            if (self->_peerIsConnected == v19)
            {
              v20 = 0;
            }
            else
            {
              self->_peerIsConnected = v19;
              v20 = 1;
            }
            objc_msgSend(v14, "_internal");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isNearby");

            if (self->_peerIsNearby != v22)
            {
              self->_peerIsNearby = v22;
              v20 = 1;
            }

            v17 = v20 != 0;
            goto LABEL_26;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v17 = 0;
  *(_WORD *)&self->_peerIsConnected = 0;
LABEL_26:
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection", (_QWORD)v26);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    peerIsNearby = self->_peerIsNearby;
    peerIsConnected = self->_peerIsConnected;
    *(_DWORD *)buf = 138413058;
    v31 = self;
    v32 = 1024;
    *(_DWORD *)v33 = peerIsNearby;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = peerIsConnected;
    v34 = 1024;
    v35 = v17;
    _os_log_impl(&dword_1906E0000, v23, OS_LOG_TYPE_DEFAULT, "%@ peerIsNearby %d peerIsConnected %d changed %d", buf, 0x1Eu);
  }

  if (v17)
    -[IDSDirectMessageConnection dequeueMessages](self, "dequeueMessages");

}

- (void)updateMetadata:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 directMessagingAllowed;
  NSString *v13;
  NSString *peerID;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDictionary *v18;
  NSDictionary *powerAssertionOptions;
  NSString *v20;
  id v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _BYTE buf[12];
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E73C4();

  }
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "%@ received direct-messaging metadata %@", buf, 0x16u);
  }

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directMsgAllowedForServices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      self->_directMessagingAllowed = objc_msgSend(v9, "containsObject:", self->_serviceName);
    +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      directMessagingAllowed = self->_directMessagingAllowed;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      v25 = 1024;
      LODWORD(v26) = directMessagingAllowed;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "%@ direct messaging allowed: %d", buf, 0x12u);
    }

    if (self->_directMessagingAllowed)
    {
      if (self->_notifyToken == -1)
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        objc_copyWeak(&v21, (id *)buf);
        im_notify_register_dispatch();
        -[IDSDirectMessageConnection parseDirectMessagingState](self, "parseDirectMessagingState");
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("peerIDForDirectMsg"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      peerID = self->_peerID;
      self->_peerID = v13;

      v22[0] = *MEMORY[0x1E0D36740];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v15;
      v22[1] = *MEMORY[0x1E0D36730];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pidForIDSD"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v16;
      v17 = *MEMORY[0x1E0D36728];
      v22[2] = *MEMORY[0x1E0D36738];
      v22[3] = v17;
      v23[2] = CFSTR("IDSDirectMessaging");
      v23[3] = CFSTR("com.apple.ids");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
      v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      powerAssertionOptions = self->_powerAssertionOptions;
      self->_powerAssertionOptions = v18;

      -[IDSDirectMessageConnection startPowerLogReportTimer](self, "startPowerLogReportTimer");
    }

  }
  else
  {
    self->_peerSupportsDeviceConnection = 0;
    self->_directMessagingAllowed = 0;
    v20 = self->_peerID;
    self->_peerID = 0;

    self->_conciseACKSupported = 0;
  }

}

- (void)resetConnection
{
  NSString *currentStreamName;
  _IDSDeviceConnection *deviceConnection;
  _IDSDeviceConnection *v5;
  NSObject *connection;
  OS_nw_connection *v7;
  NSObject *pendingAckTimer;
  OS_dispatch_source *v9;
  NSObject *reporterTimer;
  OS_dispatch_source *v11;

  self->_connectionSetupInProgress = 0;
  self->_connectionIsIncoming = 0;
  *(_WORD *)&self->_trafficClassInitialized = 0;
  self->_trafficClassApplied = 0;
  currentStreamName = self->_currentStreamName;
  self->_currentStreamName = 0;

  deviceConnection = self->_deviceConnection;
  if (deviceConnection)
  {
    -[_IDSDeviceConnection close](deviceConnection, "close");
    v5 = self->_deviceConnection;
    self->_deviceConnection = 0;

  }
  connection = self->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
    v7 = self->_connection;
  }
  else
  {
    v7 = 0;
  }
  self->_connection = 0;

  self->_connectionState = 0;
  self->_upgradedTrafficClass = 0;
  -[IDSDirectMessageConnection resumePendingAckTimer](self, "resumePendingAckTimer");
  pendingAckTimer = self->_pendingAckTimer;
  if (pendingAckTimer)
  {
    dispatch_source_cancel(pendingAckTimer);
    v9 = self->_pendingAckTimer;
    self->_pendingAckTimer = 0;

    -[IDSDirectMessageConnection logConnectionStatisticsInPowerDictionary](self, "logConnectionStatisticsInPowerDictionary");
  }
  reporterTimer = self->_reporterTimer;
  if (reporterTimer)
  {
    dispatch_source_cancel(reporterTimer);
    v11 = self->_reporterTimer;
    self->_reporterTimer = 0;

  }
  -[IDSDirectMessageConnection clearPowerAssertion](self, "clearPowerAssertion");
}

- (void)updateConnection:(id)a3
{
  id v5;
  OS_nw_connection **p_connection;
  NSObject *connection;
  _QWORD handler[4];
  id v9;
  id v10;
  id location;

  v5 = a3;
  p_connection = &self->_connection;
  if (self->_connection)
    -[IDSDirectMessageConnection resetConnection](self, "resetConnection");
  objc_storeStrong((id *)&self->_connection, a3);
  if (*p_connection)
  {
    nw_connection_set_queue((nw_connection_t)*p_connection, (dispatch_queue_t)self->_connectionQueue);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    connection = self->_connection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1906F78A0;
    handler[3] = &unk_1E2C60A20;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    nw_connection_set_state_changed_handler(connection, handler);
    nw_connection_start((nw_connection_t)*p_connection);
    self->_connectionSetupInProgress = 1;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

- (void)updateTrafficClass:(unsigned __int16)a3
{
  if (self->_connection)
    nw_connection_reset_traffic_class();
}

- (void)setupIDSDeviceConnection
{
  NSString *v3;
  NSString *currentStreamName;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _IDSDeviceConnection *v12;
  IDSDevice *device;
  _IDSDeviceConnection *v14;
  _IDSDeviceConnection *deviceConnection;
  _QWORD v16[4];
  id v17;
  _BYTE location[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_device)
  {
    if (!self->_currentStreamName)
    {
      v3 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("dmsg-%s"), -[NSString UTF8String](self->_serviceName, "UTF8String"));
      currentStreamName = self->_currentStreamName;
      self->_currentStreamName = v3;

    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34A08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dataProtectionClass);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D349E8]);

    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", self->_serviceName, *MEMORY[0x1E0D34A18]);
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", self->_currentStreamName, *MEMORY[0x1E0D34A28]);
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &unk_1E2CAE0F0, *MEMORY[0x1E0D34A00]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_idsPriorityToUse);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D34A10]);

    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &unk_1E2CAE108, *MEMORY[0x1E0D349D8]);
    v8 = -[IDSDirectMessageConnection getMessageTypeForFirstMessage](self, "getMessageTypeForFirstMessage");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D349F8]);

    v10 = (void *)MEMORY[0x1E0CB37E8];
    ids_monotonic_time();
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D349A0]);

    self->_connectionSetupInProgress = 1;
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v12 = [_IDSDeviceConnection alloc];
    device = self->_device;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1906F7D1C;
    v16[3] = &unk_1E2C60A48;
    objc_copyWeak(&v17, (id *)location);
    v14 = -[_IDSDeviceConnection initWithDevice:options:completionHandler:queue:](v12, "initWithDevice:options:completionHandler:queue:", device, v5, v16, self->_connectionQueue);
    deviceConnection = self->_deviceConnection;
    self->_deviceConnection = v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = self;
      _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "%@ Invalid device", location, 0xCu);
    }
  }

}

- (void)receivedDirectMessagingSocketWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  IDSDirectMessageConnection *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E74B4();

  }
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v4;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "%@ Received context %@", (uint8_t *)&v35, 0x16u);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamName"));
    v10 = objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (!v10)
    {
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1907E7484(v12, v28, v29, v30, v31, v32, v33, v34);
      goto LABEL_35;
    }
    -[NSObject substringFromIndex:](v10, "substringFromIndex:", -[NSObject rangeOfString:](v10, "rangeOfString:", CFSTR("dmsg-")));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (self->_currentStreamName
      && -[NSObject isEqualToString:](v11, "isEqualToString:")
      && self->_connectionSetupInProgress)
    {
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v35) = 0;
        v14 = "we are the originator";
        v15 = v13;
        v16 = OS_LOG_TYPE_INFO;
        v17 = 2;
LABEL_30:
        _os_log_impl(&dword_1906E0000, v15, v16, v14, (uint8_t *)&v35, v17);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    if (self->_connectionSetupInProgress && !self->_connection)
    {
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412290;
        v36 = self;
        v14 = "%@ Ignoring incoming request as existing request is in progress";
        v15 = v13;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 12;
        goto LABEL_30;
      }
LABEL_34:

LABEL_35:
      goto LABEL_36;
    }
    if (self->_deviceConnection)
      -[IDSDirectMessageConnection resetConnection](self, "resetConnection");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamFlags"));
    v25 = objc_claimAutoreleasedReturnValue();
    v13 = v25;
    if (v25)
    {
      v26 = -[NSObject unsignedLongLongValue](v25, "unsignedLongLongValue");
      if ((v26 & 4) != 0)
      {
        v27 = 200;
        goto LABEL_32;
      }
      if ((v26 & 8) != 0)
      {
        v27 = 300;
        goto LABEL_32;
      }
      if ((v26 & 0x10) != 0)
      {
        v27 = 100;
LABEL_32:
        self->_idsPriorityToUse = v27;
      }
    }
    objc_storeStrong((id *)&self->_currentStreamName, v12);
    self->_connectionIsIncoming = 1;
    -[IDSDirectMessageConnection setupIDSDeviceConnection](self, "setupIDSDeviceConnection");
    goto LABEL_34;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_1907E7454(v9, v18, v19, v20, v21, v22, v23, v24);
LABEL_36:

}

- (void)setupConnectionIfApplicable
{
  NSMutableArray *connectionMessageSendQueue;

  connectionMessageSendQueue = self->_connectionMessageSendQueue;
  if (connectionMessageSendQueue
    && -[NSMutableArray count](connectionMessageSendQueue, "count")
    && self->_peerIsConnected
    && !self->_connectionSetupInProgress
    && self->_connectionState != 3)
  {
    -[IDSDirectMessageConnection setupIDSDeviceConnection](self, "setupIDSDeviceConnection");
  }
}

- (void)receiveMessages
{
  OS_nw_connection *v3;
  NSObject *connection;
  OS_nw_connection *v5;
  _QWORD completion[4];
  OS_nw_connection *v7;
  id v8;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = self->_connection;
  connection = self->_connection;
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = sub_1906F8268;
  completion[3] = &unk_1E2C60A98;
  objc_copyWeak(&v8, &location);
  v5 = v3;
  v7 = v5;
  nw_connection_receive(connection, 0xCu, 0xCu, completion);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)processIncomingMessage:(id)a3 messageType:(unsigned __int8)a4 messageIdentifier:(unsigned int)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  id v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSString *v37;
  NSString *v38;
  void *v39;
  char v40;
  uint64_t v41;
  void *v42;
  NSString *v43;
  NSString *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  NSMutableDictionary *messageIDToMessageDictionary;
  void *v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  unint64_t identifier;
  char *shortServiceNameCString;
  NSMutableDictionary *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  NSObject *v60;
  unint64_t v61;
  char *v62;
  NSObject *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  void *v67;
  NSString *v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  NSMutableDictionary *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  char v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  BOOL v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  uint8_t buf[4];
  unint64_t v99;
  __int16 v100;
  char *v101;
  __int16 v102;
  _QWORD v103[3];

  v5 = *(_QWORD *)&a5;
  v85 = a4;
  v103[2] = *MEMORY[0x1E0C80C00];
  sub_1906F8F48(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-iri"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-ori"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "numberWithDouble:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  do
    v11 = __ldxr(&qword_1EE1E1F80);
  while (__stxr(v11 + 1, &qword_1EE1E1F80));
  objc_msgSend(v10, "numberWithLongLong:", v11 + 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = self->_serviceName;
  v83 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-spmf"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedCharValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("ids-dm-tc"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-cd"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-cm"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-cpb"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = v13;
  v21 = v13;
  v22 = (void *)v14;
  v82 = *MEMORY[0x1E0D34938];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D34930]);
  v95 = v18;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D34928]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v97, *MEMORY[0x1E0D34910]);
  v91 = (void *)v12;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D348F0]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v96, *MEMORY[0x1E0D348F8]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34918]);
  if ((v16 & 4) != 0)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34958]);
  if ((v16 & 1) != 0)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34908]);
  v23 = v20;
  v24 = v17;
  if (v17)
  {
    -[IDSDirectMessageConnection updateTrafficClass:](self, "updateTrafficClass:", objc_msgSend(v17, "unsignedShortValue"));
    self->_trafficClassTLVProcessed = 1;
  }
  v25 = self->_peerID;
  v26 = v25;
  v27 = v18;
  switch(v85)
  {
    case 1:
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_20;
      v29 = (void *)v28;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v86 = v17;
      v30 = v23;
      v31 = v26;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_opt_respondsToSelector();

      v26 = v31;
      v23 = v30;
      v24 = v86;

      if ((v33 & 1) == 0)
        goto LABEL_20;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "connection:incomingDataFromDirectConnection:withGUID:forTopic:toIdentifier:fromID:context:", self, v94, v95, v23, 0, v26, v19);
      goto LABEL_19;
    case 3:
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_20;
      v36 = (void *)v35;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v87 = v17;
      v37 = v23;
      v38 = v26;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_opt_respondsToSelector();

      v26 = v38;
      v23 = v37;
      v24 = v87;

      if ((v40 & 1) == 0)
        goto LABEL_20;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "connection:incomingMessageFromDirectConnection:withGUID:forTopic:toIdentifier:fromID:context:", self, v93, v95, v23, 0, v26, v19);
      goto LABEL_19;
    case 5:
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_20;
      v42 = (void *)v41;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v88 = v17;
      v43 = v23;
      v44 = v26;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_opt_respondsToSelector();

      v26 = v44;
      v23 = v43;
      v24 = v88;

      if ((v46 & 1) == 0)
        goto LABEL_20;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "connection:incomingProtobufFromDirectConnection:withGUID:forTopic:toIdentifier:fromID:context:", self, v92, v95, v23, 0, v26, v19);
LABEL_19:

LABEL_20:
      -[IDSDirectMessageConnection sendAckForMessageID:guidToAck:](self, "sendAckForMessageID:guidToAck:", v83, v95);
      break;
    case 7:
      v89 = v25;
      v47 = v83;
      if (self->_conciseACKSupported
        || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-afsqnm")),
            v48 = (void *)objc_claimAutoreleasedReturnValue(),
            v47 = bswap32(objc_msgSend(v48, "unsignedIntValue")),
            v48,
            self->_conciseACKSupported))
      {
        messageIDToMessageDictionary = self->_messageIDToMessageDictionary;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](messageIDToMessageDictionary, "objectForKeyedSubscript:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = v51 == 0;
        if (v51)
        {
          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-guid"));
          v52 = objc_claimAutoreleasedReturnValue();

          v97 = (void *)v52;
        }

      }
      else
      {
        v84 = 0;
      }
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        shortServiceNameCString = self->_shortServiceNameCString;
        if (!shortServiceNameCString)
          shortServiceNameCString = "<unknown>";
        *(_DWORD *)buf = 134218754;
        v99 = identifier;
        v100 = 2080;
        v101 = shortServiceNameCString;
        v102 = 1024;
        LODWORD(v103[0]) = v47;
        WORD2(v103[0]) = 2112;
        *(_QWORD *)((char *)v103 + 6) = v97;
        _os_log_impl(&dword_1906E0000, v53, OS_LOG_TYPE_DEFAULT, "[%llu %s] received ack for seq num %u guid: %@", buf, 0x26u);
      }

      if (v97)
      {
        v56 = self->_messageIDToMessageDictionary;
        v57 = v47;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v56, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v59)
        {
          +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v61 = self->_identifier;
            v62 = self->_shortServiceNameCString;
            if (!v62)
              v62 = "<unknown>";
            *(_DWORD *)buf = 134218498;
            v99 = v61;
            v100 = 2080;
            v101 = v62;
            v102 = 2112;
            v103[0] = v97;
            _os_log_impl(&dword_1906E0000, v60, OS_LOG_TYPE_DEFAULT, "[%llu %s] message for guid %@ already timed out", buf, 0x20u);
          }

          v84 = 1;
        }
      }
      else
      {
        v57 = v47;
      }
      v72 = v22;
      v73 = self->_messageIDToMessageDictionary;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73, "setObject:forKeyedSubscript:", 0, v74);

      if (!-[NSMutableDictionary count](self->_messageIDToMessageDictionary, "count"))
      {
        -[IDSDirectMessageConnection suspendPendingAckTimer](self, "suspendPendingAckTimer");
        -[IDSDirectMessageConnection clearPowerAssertion](self, "clearPowerAssertion");
      }
      v26 = v89;
      if (v84)
        goto LABEL_52;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v75 = objc_claimAutoreleasedReturnValue();
      if (!v75)
        goto LABEL_52;
      v76 = (void *)v75;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_opt_respondsToSelector();

      if ((v78 & 1) != 0)
      {
        v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);

        objc_msgSend(v79, "setObject:forKeyedSubscript:", &unk_1E2CAE0F0, *MEMORY[0x1E0D34900]);
        v26 = v89;
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v89, *MEMORY[0x1E0D34920]);
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v23, v82);
        -[IDSDirectMessageConnection delegate](self, "delegate");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v81) = 0;
        objc_msgSend(v80, "connection:incomingAckWithIdentifier:forTopic:toIdentifier:fromIdentifier:hasBeenDeliveredWithContext:isAppAck:", self, v97, v23, 0, v89, v79, v81);

        v19 = v79;
LABEL_52:
        v22 = v72;
        v27 = v95;
      }
      else
      {
        v22 = v72;
        v27 = v95;
        v26 = v89;
      }
      break;
    case 9:
      v90 = v22;
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = self->_identifier;
        v65 = self->_shortServiceNameCString;
        if (!v65)
          v65 = "<unknown>";
        *(_DWORD *)buf = 134218498;
        v99 = v64;
        v100 = 2080;
        v101 = v65;
        v102 = 2112;
        v103[0] = v97;
        _os_log_impl(&dword_1906E0000, v63, OS_LOG_TYPE_DEFAULT, "[%llu %s] received App-Level ack for: %@", buf, 0x20u);
      }

      -[IDSDirectMessageConnection delegate](self, "delegate");
      v66 = objc_claimAutoreleasedReturnValue();
      if (!v66)
        goto LABEL_44;
      v67 = (void *)v66;
      v68 = v26;
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_opt_respondsToSelector();

      if ((v70 & 1) != 0)
      {
        -[IDSDirectMessageConnection delegate](self, "delegate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v81) = 1;
        v26 = v68;
        objc_msgSend(v71, "connection:incomingAckWithIdentifier:forTopic:toIdentifier:fromIdentifier:hasBeenDeliveredWithContext:isAppAck:", self, v97, v23, 0, v68, v19, v81);

LABEL_44:
        v22 = v90;
      }
      else
      {
        v22 = v90;
        v26 = v68;
      }
      break;
    default:
      break;
  }

}

- (void)sendAckForMessageID:(unsigned int)a3 guidToAck:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *connection;
  NSObject *v12;
  id v13;
  _QWORD completion[4];
  id v15;
  id v16;
  int v17;
  id location;
  const __CFString *v19;
  _QWORD v20[2];

  v4 = *(_QWORD *)&a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D34E70]);
  v8 = v7;
  if (!self->_conciseACKSupported)
    objc_msgSend(v7, "setPeerResponseIdentifier:", v6);
  v19 = CFSTR("ids-dm-snd-params");
  v20[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDirectMessageConnection createDispatchDataForMessageSend:isAck:ackMessageId:](self, "createDispatchDataForMessageSend:isAck:ackMessageId:", v9, 1, v4);
  v10 = objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  connection = self->_connection;
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = sub_1906F93C4;
  completion[3] = &unk_1E2C60AC0;
  objc_copyWeak(&v16, &location);
  v12 = *MEMORY[0x1E0CCECE8];
  v13 = v6;
  v15 = v13;
  v17 = v4;
  nw_connection_send(connection, v10, v12, 0, completion);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)sendAppAckWithGUID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *connection;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "assertQueueIsCurrent");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1907E761C();

  }
  v8 = objc_alloc_init(MEMORY[0x1E0D34E70]);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMessage:", v9);

  objc_msgSend(v8, "setPeerResponseIdentifier:", v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 244);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommand:", v10);

  v20 = CFSTR("ids-dm-snd-params");
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDirectMessageConnection createDispatchDataForMessageSend:isAck:ackMessageId:](self, "createDispatchDataForMessageSend:isAck:ackMessageId:", v11, 0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1906F9708;
  v16[3] = &unk_1E2C60AE8;
  objc_copyWeak(&v18, &location);
  v14 = *MEMORY[0x1E0CCECE8];
  v15 = v4;
  v17 = v15;
  nw_connection_send(connection, v12, v14, 0, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (unsigned)getMessageTypeForFirstMessage
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!-[NSMutableArray count](self->_connectionMessageSendQueue, "count"))
    return 0;
  -[NSMutableArray firstObject](self->_connectionMessageSendQueue, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ids-dm-snd-params"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 3;
  }
  else
  {
    objc_msgSend(v4, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "protobuf");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v6 = 5;
      }
      else
      {
        objc_msgSend(v4, "command");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v4, "command");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (objc_msgSend(v10, "integerValue") == 244)
              v6 = 9;
            else
              v6 = 0;
          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }
      }
    }
  }

  return v6;
}

- (id)createDispatchDataForMessageSend:(id)a3 isAck:(BOOL)a4 ackMessageId:(unsigned int)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  id v28;
  unsigned int v29;
  uint64_t v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  unsigned int v43;
  void *v44;
  NSMutableDictionary *queueOneToMessageIDDictionary;
  void *v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  size_t v50;
  _BYTE *v51;
  _DWORD *v52;
  id v53;
  dispatch_data_t v54;
  char v56;
  void *v57;
  IDSDirectMessageConnection *v58;
  void *v59;
  void *v60;
  __int16 v61;
  char v62;
  char v63;
  _DWORD v64[3];
  _BYTE v65[2052];

  *(_QWORD *)&v65[2036] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (!a4)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = objc_msgSend(v10, "unsignedIntValue");

  }
  if (!a5)
  {
    do
      a5 = __ldaxr((unsigned int *)&unk_1EE1E0B50);
    while (__stlxr(a5 + 1, (unsigned int *)&unk_1EE1E0B50));
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ids-dm-snd-params"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "protobuf");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peerResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v56 = 7;
    goto LABEL_19;
  }
  objc_msgSend(v11, "command");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v15, "integerValue") == 244)
  {
    v16 = 9;
  }
  else if (v12)
  {
    v16 = 3;
  }
  else if (v60)
  {
    v16 = 1;
  }
  else
  {
    if (!v59)
    {
      v56 = 0;
      goto LABEL_18;
    }
    v16 = 5;
  }
  v56 = v16;
LABEL_18:

LABEL_19:
  v17 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v62 = 0;
  if (objc_msgSend(v11, "expectsPeerResponse"))
  {
    v62 = 1;
    if ((objc_msgSend(v11, "wantsAppAck") & 1) == 0)
    {
LABEL_25:
      LOBYTE(v61) = 3;
      v64[0] = 0x1000000;
      v19 = v17;
      objc_msgSend(v19, "appendBytes:length:", &v61, 1);
      objc_msgSend(v19, "appendBytes:length:", v64, 4);
      objc_msgSend(v19, "appendBytes:length:", &v62, 1);

      goto LABEL_26;
    }
    v18 = 5;
LABEL_24:
    v62 = v18;
    goto LABEL_25;
  }
  if (objc_msgSend(v11, "wantsAppAck"))
  {
    v18 = 4;
    goto LABEL_24;
  }
LABEL_26:
  v57 = v9;
  v58 = self;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");
      v22 = objc_retainAutorelease(v20);
      v23 = objc_msgSend(v22, "bytes");
      LOBYTE(v61) = 4;
      v64[0] = bswap32(v21);
      v24 = v17;
      objc_msgSend(v24, "appendBytes:length:", &v61, 1);
      objc_msgSend(v24, "appendBytes:length:", v64, 4);
      v25 = v23;
      self = v58;
      objc_msgSend(v24, "appendBytes:length:", v25, v21);

    }
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = objc_msgSend(v13, "length");
      v27 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
      LOBYTE(v61) = 5;
      v64[0] = bswap32(v26);
      v28 = v17;
      objc_msgSend(v28, "appendBytes:length:", &v61, 1);
      objc_msgSend(v28, "appendBytes:length:", v64, 4);
      objc_msgSend(v28, "appendBytes:length:", v27, v26);

    }
  }
  if (v60)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v60, "length");
      v30 = objc_msgSend(objc_retainAutorelease(v60), "bytes");
      LOBYTE(v61) = 6;
      v64[0] = bswap32(v29);
      v31 = v17;
      objc_msgSend(v31, "appendBytes:length:", &v61, 1);
      objc_msgSend(v31, "appendBytes:length:", v64, 4);
      objc_msgSend(v31, "appendBytes:length:", v30, v29);

    }
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "plistData");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "length");
      v34 = objc_retainAutorelease(v32);
      v35 = objc_msgSend(v34, "bytes");
      LOBYTE(v61) = 7;
      v64[0] = bswap32(v33);
      v36 = v17;
      objc_msgSend(v36, "appendBytes:length:", &v61, 1);
      objc_msgSend(v36, "appendBytes:length:", v64, 4);
      objc_msgSend(v36, "appendBytes:length:", v35, v33);

      self = v58;
    }
  }
  if (v59)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v59, "plistData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "length");
      v39 = objc_retainAutorelease(v37);
      v40 = objc_msgSend(v39, "bytes");
      LOBYTE(v61) = 8;
      v64[0] = bswap32(v38);
      v41 = v17;
      objc_msgSend(v41, "appendBytes:length:", &v61, 1);
      objc_msgSend(v41, "appendBytes:length:", v64, 4);
      objc_msgSend(v41, "appendBytes:length:", v40, v38);

      self = v58;
    }
  }
  if (!self->_trafficClassTLVProcessed && !self->_peerSupportsDeviceConnection)
  {
    v61 = bswap32(LOWORD(self->_trafficClassToUse)) >> 16;
    v63 = 10;
    v64[0] = 0x2000000;
    v42 = v17;
    objc_msgSend(v42, "appendBytes:length:", &v63, 1);
    objc_msgSend(v42, "appendBytes:length:", v64, 4);
    objc_msgSend(v42, "appendBytes:length:", &v61, 2);

    self->_trafficClassTLVProcessed = 1;
  }
  v43 = objc_msgSend(v17, "length");
  objc_msgSend(v11, "queueOneIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    queueOneToMessageIDDictionary = self->_queueOneToMessageIDDictionary;
    objc_msgSend(v11, "queueOneIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](queueOneToMessageIDDictionary, "setObject:forKeyedSubscript:", 0, v46);

  }
  v47 = bswap32(v43);
  v48 = bswap32(a5);
  bzero(v64, 0x800uLL);
  v49 = objc_msgSend(v17, "length");
  v50 = (v49 + 12);
  if (v50 >= 0x801)
  {
    v52 = malloc_type_malloc((v49 + 12), 0xDF43047CuLL);
    v51 = v52 + 3;
  }
  else
  {
    v51 = v65;
    v52 = v64;
  }
  *(_BYTE *)v52 = 1;
  *((_BYTE *)v52 + 1) = v56;
  *((_WORD *)v52 + 1) = 0;
  v52[1] = v48;
  v52[2] = v47;
  v53 = objc_retainAutorelease(v17);
  memcpy(v51, (const void *)objc_msgSend(v53, "bytes"), objc_msgSend(v53, "length"));
  v54 = dispatch_data_create(v52, v50, (dispatch_queue_t)v58->_connectionQueue, 0);
  if (v52 != v64)
    free(v52);

  return v54;
}

- (void)cancelPendingAckTimer
{
  NSObject *pendingAckTimer;
  OS_dispatch_source *v4;

  -[IDSDirectMessageConnection resumePendingAckTimer](self, "resumePendingAckTimer");
  pendingAckTimer = self->_pendingAckTimer;
  if (pendingAckTimer)
  {
    dispatch_source_cancel(pendingAckTimer);
    v4 = self->_pendingAckTimer;
    self->_pendingAckTimer = 0;

  }
  self->_pendingAckTimerSuspended = 0;
}

- (void)resumePendingAckTimer
{
  NSObject *pendingAckTimer;

  if (self->_pendingAckTimerSuspended)
  {
    pendingAckTimer = self->_pendingAckTimer;
    if (pendingAckTimer)
    {
      dispatch_resume(pendingAckTimer);
      self->_pendingAckTimerSuspended = 0;
    }
  }
}

- (void)suspendPendingAckTimer
{
  NSObject *pendingAckTimer;

  if (!self->_pendingAckTimerSuspended)
  {
    pendingAckTimer = self->_pendingAckTimer;
    if (pendingAckTimer)
    {
      dispatch_suspend(pendingAckTimer);
      self->_pendingAckTimerSuspended = 1;
    }
  }
}

- (void)failedToSendMessage:(id)a3 responseCode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-guid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 2048;
      v19 = a4;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Message %@ failed to send due to %ld", (uint8_t *)&v16, 0x16u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_messageIDToMessageDictionary, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[IDSDirectMessageConnection delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "connection:messageSendFailed:responseCode:", self, v8, a4);

      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIDToMessageDictionary, "setObject:forKeyedSubscript:", 0, v9);
    }
    -[NSMutableArray removeObject:](self->_connectionMessageSendQueue, "removeObject:", v7);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ids-dm-snd-params"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queueOneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueOneToMessageIDDictionary, "setObject:forKeyedSubscript:", 0, v15);
    -[IDSDirectMessageConnection clearPowerAssertion](self, "clearPowerAssertion");

  }
}

- (void)sendMessageWithParameters:(id)a3 options:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t identifier;
  char *shortServiceNameCString;
  void *v14;
  NSString *serviceName;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unint64_t v23;
  char *v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *connectionMessageSendQueue;
  void *v28;
  char v29;
  NSObject *v30;
  dispatch_time_t v31;
  NSObject *v32;
  OS_dispatch_source *pendingAckTimer;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  void *v45;
  NSString *v46;
  char *v47;
  unint64_t v48;
  void *v49;
  _QWORD handler[4];
  NSObject *v51;
  id v52;
  _BYTE buf[12];
  __int16 v54;
  char *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  NSString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSString *)a4;
  +[IDSInternalQueueController sharedInstance](IDSInternalQueueController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assertQueueIsCurrent");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D34D40], "utilities");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907E78C8();

  }
  if (objc_msgSend(v6, "priority") == 300
    && (-[IDSServiceProperties allowUrgentMessages](self->_serviceProperties, "allowUrgentMessages") & 1) == 0)
  {
    objc_msgSend(v6, "setPriority:", 200);
    +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      if (self->_shortServiceNameCString)
        shortServiceNameCString = self->_shortServiceNameCString;
      else
        shortServiceNameCString = "<unknown>";
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = identifier;
      v54 = 2080;
      v55 = shortServiceNameCString;
      v56 = 2112;
      v57 = v14;
      v58 = 2112;
      v59 = serviceName;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "[%llu %s] Downgrading priority of message with guid %@ to Default from Urgent, client %@ is not configured to send urgent messages", buf, 0x2Au);

    }
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, CFSTR("ids-dm-snd-params"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("ids-dm-options"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_continuous_time());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("ids-dm-snd-time"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  do
    v19 = __ldaxr((unsigned int *)&unk_1EE1E0B50);
  while (__stlxr(v19 + 1, (unsigned int *)&unk_1EE1E0B50));
  objc_msgSend(v18, "numberWithUnsignedInt:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("ids-dm-msg-id"));
  objc_msgSend(v6, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("ids-dm-msg-guid"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIDToMessageDictionary, "setObject:forKeyedSubscript:", v16, v20);
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_identifier;
    if (self->_shortServiceNameCString)
      v24 = self->_shortServiceNameCString;
    else
      v24 = "<unknown>";
    objc_msgSend(v6, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v23;
    v54 = 2080;
    v55 = v24;
    v56 = 2112;
    v57 = v25;
    v58 = 2112;
    v59 = v7;
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "[%llu %s] Client requesting to send message with guid %@ options %@", buf, 0x2Au);

  }
  if (!self->_connectionMessageSendQueue)
  {
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connectionMessageSendQueue = self->_connectionMessageSendQueue;
    self->_connectionMessageSendQueue = v26;

  }
  -[IDSDevice _internal](self->_device, "_internal");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v28, "relationship") & 2) == 0)
  {

    goto LABEL_25;
  }
  v29 = -[IDSServiceProperties wantsTinkerDevices](self->_serviceProperties, "wantsTinkerDevices");

  if ((v29 & 1) != 0)
  {
LABEL_25:
    if (!self->_trafficClassInitialized)
    {
      *(int64x2_t *)&self->_idsPriorityToUse = vdupq_n_s64(0xC8uLL);
      if (objc_msgSend(v6, "priority") == 300)
      {
        self->_trafficClassToUse = 700;
        self->_idsPriorityToUse = 300;
        self->_trafficClassApplied = objc_msgSend(v6, "priority");
      }
      if (objc_msgSend(v6, "priority") == 100)
      {
        self->_trafficClassToUse = 200;
        self->_idsPriorityToUse = 100;
        self->_trafficClassApplied = objc_msgSend(v6, "priority");
      }
      self->_trafficClassInitialized = 1;
    }
    if (!self->_pendingAckTimer)
    {
      v30 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_connectionQueue);
      v31 = dispatch_time(0, 2000000000);
      dispatch_source_set_timer(v30, v31, 0x77359400uLL, 0x5F5E100uLL);
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = sub_1906FAD54;
      handler[3] = &unk_1E2C60B38;
      objc_copyWeak(&v52, (id *)buf);
      v32 = v30;
      v51 = v32;
      dispatch_source_set_event_handler(v32, handler);
      dispatch_resume(v32);
      pendingAckTimer = self->_pendingAckTimer;
      self->_pendingAckTimer = (OS_dispatch_source *)v32;
      v34 = v32;

      self->_pendingAckTimerSuspended = 0;
      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);
    }
    -[IDSDirectMessageConnection resumePendingAckTimer](self, "resumePendingAckTimer");
    objc_msgSend(v6, "queueOneIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_queueOneToMessageIDDictionary, "objectForKeyedSubscript:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)v36;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_messageIDToMessageDictionary, "objectForKeyedSubscript:", v36);
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)v38;
          v40 = -[NSMutableArray indexOfObject:](self->_connectionMessageSendQueue, "indexOfObject:", v38);
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v42 = v40;
            +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = self->_shortServiceNameCString;
              if (!v44)
                v44 = "<unknown>";
              v47 = v44;
              v48 = self->_identifier;
              objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-guid"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "identifier");
              v46 = (NSString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              *(_QWORD *)&buf[4] = v48;
              v54 = 2080;
              v55 = v47;
              v56 = 2112;
              v57 = v49;
              v58 = 2112;
              v59 = v46;
              _os_log_impl(&dword_1906E0000, v43, OS_LOG_TYPE_DEFAULT, "[%llu %s] Replacing guid: %@ with guid: %@", buf, 0x2Au);

            }
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_connectionMessageSendQueue, "replaceObjectAtIndex:withObject:", v42, v16);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIDToMessageDictionary, "setObject:forKeyedSubscript:", 0, v37);

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueOneToMessageIDDictionary, "setObject:forKeyedSubscript:", v45, v35);

            goto LABEL_43;
          }

        }
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueOneToMessageIDDictionary, "setObject:forKeyedSubscript:", v41, v35);

      }
      else
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queueOneToMessageIDDictionary, "setObject:forKeyedSubscript:", v37, v35);
      }

    }
    -[NSMutableArray addObject:](self->_connectionMessageSendQueue, "addObject:", v16);
LABEL_43:
    -[IDSDirectMessageConnection dequeueMessages](self, "dequeueMessages", v46);

    goto LABEL_44;
  }
  -[IDSDirectMessageConnection failedToSendMessage:responseCode:](self, "failedToSendMessage:responseCode:", v16, 32);
LABEL_44:

}

- (void)dequeueMessages
{
  NSMutableArray *connectionMessageSendQueue;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *size;
  NSObject *connection;
  NSObject *v12;
  NSObject *connectionQueue;
  _QWORD completion[4];
  id v15;
  id v16[2];
  int v17;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  if (-[IDSDirectMessageConnection canUseDirectMessaging](self, "canUseDirectMessaging"))
  {
    -[IDSDirectMessageConnection setupConnectionIfApplicable](self, "setupConnectionIfApplicable");
    connectionMessageSendQueue = self->_connectionMessageSendQueue;
    if (connectionMessageSendQueue)
    {
      if (-[NSMutableArray count](connectionMessageSendQueue, "count")
        && self->_connectionState == 3
        && self->_peerIsConnected)
      {
        -[IDSDirectMessageConnection getPowerAssertion](self, "getPowerAssertion");
        -[NSMutableArray firstObject](self->_connectionMessageSendQueue, "firstObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ids-dm-msg-id"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "unsignedIntValue");
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ids-dm-snd-params"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        if (objc_msgSend(v7, "requireBluetooth") && !self->_peerIsNearby)
        {
          -[NSMutableArray removeFirstObject](self->_connectionMessageSendQueue, "removeFirstObject");
          connectionQueue = self->_connectionQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1906FB29C;
          block[3] = &unk_1E2C60B38;
          objc_copyWeak(&v20, &location);
          v19 = v4;
          dispatch_async(connectionQueue, block);

          objc_destroyWeak(&v20);
        }
        else
        {
          -[IDSDirectMessageConnection createDispatchDataForMessageSend:isAck:ackMessageId:](self, "createDispatchDataForMessageSend:isAck:ackMessageId:", v4, 0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          size = (void *)dispatch_data_get_size(v9);
          -[NSMutableArray removeFirstObject](self->_connectionMessageSendQueue, "removeFirstObject");
          connection = self->_connection;
          v12 = *MEMORY[0x1E0CCECE8];
          completion[0] = MEMORY[0x1E0C809B0];
          completion[1] = 3221225472;
          completion[2] = sub_1906FB2E8;
          completion[3] = &unk_1E2C60B60;
          objc_copyWeak(v16, &location);
          v17 = v6;
          v15 = v8;
          v16[1] = size;
          nw_connection_send(connection, v9, v12, 0, completion);

          objc_destroyWeak(v16);
        }
        objc_destroyWeak(&location);

      }
    }
  }
}

- (void)getPowerAssertion
{
  id v3;
  IMPowerAssertion *v4;
  IMPowerAssertion *assertion;
  NSObject *v6;
  unint64_t identifier;
  char *shortServiceNameCString;
  id v9;
  uint8_t buf[4];
  unint64_t v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_assertion)
  {
    if (self->_powerAssertionOptions)
    {
      v3 = objc_alloc(MEMORY[0x1E0D36AA0]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ids-dm-%@"), self->_serviceName);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v4 = (IMPowerAssertion *)objc_msgSend(v3, "initWithIdentifier:timeoutSec:properties:", 40.0);
      assertion = self->_assertion;
      self->_assertion = v4;

    }
    else
    {
      +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        shortServiceNameCString = self->_shortServiceNameCString;
        if (!shortServiceNameCString)
          shortServiceNameCString = "<unknown>";
        *(_DWORD *)buf = 134218242;
        v11 = identifier;
        v12 = 2080;
        v13 = shortServiceNameCString;
        _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "[%llu %s] Error! powerAssertionOptions is nil. Cannot get power assertion.", buf, 0x16u);
      }

    }
  }
}

- (void)clearPowerAssertion
{
  IMPowerAssertion *assertion;
  NSMutableDictionary *messageIDToMessageDictionary;

  assertion = self->_assertion;
  if (assertion)
  {
    messageIDToMessageDictionary = self->_messageIDToMessageDictionary;
    if (messageIDToMessageDictionary)
    {
      if (-[NSMutableDictionary count](messageIDToMessageDictionary, "count"))
        return;
      assertion = self->_assertion;
    }
    self->_assertion = 0;

  }
}

- (void)startPowerLogReportTimer
{
  NSObject *reporterTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  reporterTimer = self->_reporterTimer;
  if (reporterTimer)
    dispatch_source_cancel(reporterTimer);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_connectionQueue);
  v5 = self->_reporterTimer;
  self->_reporterTimer = v4;

  v6 = self->_reporterTimer;
  v7 = dispatch_time(0, 100000000);
  dispatch_source_set_timer(v6, v7, 1000000000 * self->_directMessagingReportStatsMSEC, 0x5F5E100uLL);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = self->_reporterTimer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1906FB6C4;
  v9[3] = &unk_1E2C60B88;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_reporterTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)logConnectionStatisticsInPowerDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t identifier;
  char *shortServiceNameCString;
  uint8_t buf[4];
  unint64_t v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ids-dm-%@"), self->_serviceName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_outgoingMessageBytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_outgoingMessageCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_incomingMessageBytes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_incomingMessageCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("IDSLocalStatisticsCategory"), v5, CFSTR("IDSLocalOutgoingMessageBytes"), v6, CFSTR("IDSLocalOutgoingMessages"), v7, CFSTR("IDSLocalIncomingMessageBytes"), v8, CFSTR("IDSLocalIncomingMessages"), 0);

  IDSPowerLogDictionary();
  +[IDSLogging IDSDirectMessagingConnection](IDSLogging, "IDSDirectMessagingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    shortServiceNameCString = self->_shortServiceNameCString;
    if (!shortServiceNameCString)
      shortServiceNameCString = "<unknown>";
    *(_DWORD *)buf = 134218498;
    v14 = identifier;
    v15 = 2080;
    v16 = shortServiceNameCString;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "[%llu %s] logConnectionStatisticsInPowerDictionary: %@", buf, 0x20u);
  }

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (char)shortServiceNameCString
{
  return self->_shortServiceNameCString;
}

- (void)setShortServiceNameCString:(char *)a3
{
  self->_shortServiceNameCString = a3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (BOOL)connectionSetupInProgress
{
  return self->_connectionSetupInProgress;
}

- (void)setConnectionSetupInProgress:(BOOL)a3
{
  self->_connectionSetupInProgress = a3;
}

- (NSMutableArray)connectionMessageSendQueue
{
  return self->_connectionMessageSendQueue;
}

- (void)setConnectionMessageSendQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionMessageSendQueue, a3);
}

- (IDSDirectMessageConnectionDelegate)delegate
{
  return (IDSDirectMessageConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)upgradedTrafficClass
{
  return self->_upgradedTrafficClass;
}

- (void)setUpgradedTrafficClass:(BOOL)a3
{
  self->_upgradedTrafficClass = a3;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (BOOL)connectionIsIncoming
{
  return self->_connectionIsIncoming;
}

- (void)setConnectionIsIncoming:(BOOL)a3
{
  self->_connectionIsIncoming = a3;
}

- (BOOL)pendingAckTimerSuspended
{
  return self->_pendingAckTimerSuspended;
}

- (void)setPendingAckTimerSuspended:(BOOL)a3
{
  self->_pendingAckTimerSuspended = a3;
}

- (BOOL)directMessagingAllowed
{
  return self->_directMessagingAllowed;
}

- (void)setDirectMessagingAllowed:(BOOL)a3
{
  self->_directMessagingAllowed = a3;
}

- (OS_dispatch_source)pendingAckTimer
{
  return self->_pendingAckTimer;
}

- (void)setPendingAckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAckTimer, a3);
}

- (OS_dispatch_source)reporterTimer
{
  return self->_reporterTimer;
}

- (void)setReporterTimer:(id)a3
{
  objc_storeStrong((id *)&self->_reporterTimer, a3);
}

- (NSMutableDictionary)queueOneToMessageIDDictionary
{
  return self->_queueOneToMessageIDDictionary;
}

- (void)setQueueOneToMessageIDDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_queueOneToMessageIDDictionary, a3);
}

- (NSMutableDictionary)messageIDToMessageDictionary
{
  return self->_messageIDToMessageDictionary;
}

- (void)setMessageIDToMessageDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_messageIDToMessageDictionary, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (BOOL)directMessagingSupported
{
  return self->_directMessagingSupported;
}

- (void)setDirectMessagingSupported:(BOOL)a3
{
  self->_directMessagingSupported = a3;
}

- (unsigned)trafficClassToUse
{
  return self->_trafficClassToUse;
}

- (void)setTrafficClassToUse:(unsigned int)a3
{
  self->_trafficClassToUse = a3;
}

- (int64_t)idsPriorityToUse
{
  return self->_idsPriorityToUse;
}

- (void)setIdsPriorityToUse:(int64_t)a3
{
  self->_idsPriorityToUse = a3;
}

- (BOOL)trafficClassInitialized
{
  return self->_trafficClassInitialized;
}

- (void)setTrafficClassInitialized:(BOOL)a3
{
  self->_trafficClassInitialized = a3;
}

- (int64_t)trafficClassApplied
{
  return self->_trafficClassApplied;
}

- (void)setTrafficClassApplied:(int64_t)a3
{
  self->_trafficClassApplied = a3;
}

- (BOOL)trafficClassTLVProcessed
{
  return self->_trafficClassTLVProcessed;
}

- (void)setTrafficClassTLVProcessed:(BOOL)a3
{
  self->_trafficClassTLVProcessed = a3;
}

- (BOOL)peerIsConnected
{
  return self->_peerIsConnected;
}

- (void)setPeerIsConnected:(BOOL)a3
{
  self->_peerIsConnected = a3;
}

- (BOOL)peerIsNearby
{
  return self->_peerIsNearby;
}

- (void)setPeerIsNearby:(BOOL)a3
{
  self->_peerIsNearby = a3;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (_IDSDeviceConnection)deviceConnection
{
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_deviceConnection, a3);
}

- (NSString)currentStreamName
{
  return self->_currentStreamName;
}

- (void)setCurrentStreamName:(id)a3
{
  objc_storeStrong((id *)&self->_currentStreamName, a3);
}

- (BOOL)peerSupportsDeviceConnection
{
  return self->_peerSupportsDeviceConnection;
}

- (void)setPeerSupportsDeviceConnection:(BOOL)a3
{
  self->_peerSupportsDeviceConnection = a3;
}

- (BOOL)conciseACKSupported
{
  return self->_conciseACKSupported;
}

- (void)setConciseACKSupported:(BOOL)a3
{
  self->_conciseACKSupported = a3;
}

- (unint64_t)directMessagingState
{
  return self->_directMessagingState;
}

- (void)setDirectMessagingState:(unint64_t)a3
{
  self->_directMessagingState = a3;
}

- (int)directMessagingTimeOutMSEC
{
  return self->_directMessagingTimeOutMSEC;
}

- (void)setDirectMessagingTimeOutMSEC:(int)a3
{
  self->_directMessagingTimeOutMSEC = a3;
}

- (int)directMessagingRetryMSEC
{
  return self->_directMessagingRetryMSEC;
}

- (void)setDirectMessagingRetryMSEC:(int)a3
{
  self->_directMessagingRetryMSEC = a3;
}

- (int)directMessagingReportStatsMSEC
{
  return self->_directMessagingReportStatsMSEC;
}

- (void)setDirectMessagingReportStatsMSEC:(int)a3
{
  self->_directMessagingReportStatsMSEC = a3;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (IDSServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProperties, a3);
}

- (IMPowerAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (NSDictionary)powerAssertionOptions
{
  return self->_powerAssertionOptions;
}

- (void)setPowerAssertionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_powerAssertionOptions, a3);
}

- (unint64_t)outgoingMessageBytes
{
  return self->_outgoingMessageBytes;
}

- (void)setOutgoingMessageBytes:(unint64_t)a3
{
  self->_outgoingMessageBytes = a3;
}

- (unint64_t)outgoingMessageCount
{
  return self->_outgoingMessageCount;
}

- (void)setOutgoingMessageCount:(unint64_t)a3
{
  self->_outgoingMessageCount = a3;
}

- (unint64_t)incomingMessageBytes
{
  return self->_incomingMessageBytes;
}

- (void)setIncomingMessageBytes:(unint64_t)a3
{
  self->_incomingMessageBytes = a3;
}

- (unint64_t)incomingMessageCount
{
  return self->_incomingMessageCount;
}

- (void)setIncomingMessageCount:(unint64_t)a3
{
  self->_incomingMessageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionOptions, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_currentStreamName, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_messageIDToMessageDictionary, 0);
  objc_storeStrong((id *)&self->_queueOneToMessageIDDictionary, 0);
  objc_storeStrong((id *)&self->_reporterTimer, 0);
  objc_storeStrong((id *)&self->_pendingAckTimer, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionMessageSendQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
