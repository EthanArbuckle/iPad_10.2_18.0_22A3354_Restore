@implementation IMDRelayPushHandler

+ (id)sharedInstance
{
  if (qword_1ED935EE8 != -1)
    dispatch_once(&qword_1ED935EE8, &unk_1E922E408);
  return (id)qword_1ED936130;
}

- (void)_handleMessageProcessedWithGUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMDRelayPushHandler guidToListenersCache](self, "guidToListenersCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (void)_cacheListeners:(id)a3 forGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[IMDRelayPushHandler guidToListenersCache](self, "guidToListenersCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    -[IMDRelayPushHandler setGuidToListenersCache:](self, "setGuidToListenersCache:", v9);

    -[IMDRelayPushHandler guidToListenersCache](self, "guidToListenersCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCountLimit:", 50000);

  }
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1D166C170(v6, (uint64_t)v7, v11);

  -[IMDRelayPushHandler guidToListenersCache](self, "guidToListenersCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v6, v7);

}

- (id)_cachedListenersForGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDRelayPushHandler guidToListenersCache](self, "guidToListenersCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Reusing cached listeners %@ for GUID %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    sub_1D166C1FC((uint64_t)v4, v9);
  }

  return v6;
}

+ (id)commandToHandlerBlock
{
  if (qword_1ED935FC8 != -1)
    dispatch_once(&qword_1ED935FC8, &unk_1E922E428);
  return (id)qword_1ED935FC0;
}

+ (id)localCommandToHandlerBlock
{
  if (qword_1EFC63E98 != -1)
    dispatch_once(&qword_1EFC63E98, &unk_1E922E6E0);
  return (id)qword_1EFC63E90;
}

- (IMDRelayPushHandler)initWithIDSAccount:(id)a3
{
  id v4;
  IMDRelayPushHandler *v5;
  IMDRelayPushHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMDRelayPushHandler;
  v5 = -[IMDRelayPushHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[IMDRelayPushHandler setAccount:](v5, "setAccount:", v4);

  return v6;
}

- (IMDRelayPushHandler)init
{
  IMDRelayPushHandler *v2;
  IMDRelayPushHandler *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  IMDRelayPushHandler *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)IMDRelayPushHandler;
  v2 = -[IMDRelayPushHandler init](&v6, sel_init);
  v3 = v2;
  if (v2 && IMOSLoggingEnabled(v2))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v8 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "Initing Push Handler %p", buf, 0xCu);
    }

  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  IDSAccount *account;
  IDSService *relayService;
  IDSService *smsWatchService;
  objc_super v7;
  uint8_t buf[4];
  IMDRelayPushHandler *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v9 = self;
      _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Deallocing Push Handler %p", buf, 0xCu);
    }

  }
  account = self->_account;
  self->_account = 0;

  -[IDSService removeDelegate:](self->_relayService, "removeDelegate:", self);
  relayService = self->_relayService;
  self->_relayService = 0;

  -[IDSService removeDelegate:](self->_smsWatchService, "removeDelegate:", self);
  smsWatchService = self->_smsWatchService;
  self->_smsWatchService = 0;

  -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects");
  v7.receiver = self;
  v7.super_class = (Class)IMDRelayPushHandler;
  -[IMDRelayPushHandler dealloc](&v7, sel_dealloc);
}

- (void)_updateListenerIfNeeded
{
  void *v3;
  IDSService *relayService;
  IDSService *smsWatchService;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  IDSService *v12;
  IDSService *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  IDSService *v20;
  IDSService *v21;

  if (self->_registeredForPush)
  {
    v3 = (void *)MEMORY[0x1D17EA968]();
    if (!self->_isListening)
    {
      -[IDSService removeDelegate:](self->_relayService, "removeDelegate:", self);
      relayService = self->_relayService;
      self->_relayService = 0;

      -[IDSService removeDelegate:](self->_smsWatchService, "removeDelegate:", self);
      smsWatchService = self->_smsWatchService;
      self->_smsWatchService = 0;

      v6 = objc_alloc(MEMORY[0x1E0D34358]);
      v7 = *MEMORY[0x1E0D34230];
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (IDSService *)objc_msgSend(v6, "initWithService:commands:", v7, v11);
      v13 = self->_relayService;
      self->_relayService = v12;

      v14 = (void *)MEMORY[0x1E0C80D38];
      -[IDSService addDelegate:queue:](self->_relayService, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);
      v15 = objc_alloc(MEMORY[0x1E0D34358]);
      v16 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (IDSService *)objc_msgSend(v15, "initWithService:commands:", CFSTR("com.apple.private.alloy.sms.watch"), v19);
      v21 = self->_smsWatchService;
      self->_smsWatchService = v20;

      -[IDSService addDelegate:queue:](self->_smsWatchService, "addDelegate:queue:", self, v14);
      self->_isListening = 1;
    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)_acceptIncomingPushes
{
  NSObject *v3;
  uint8_t v4[16];

  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "Accepting incoming pushes", v4, 2u);
      }

    }
    -[IMDRelayPushHandler _updateListenerIfNeeded](self, "_updateListenerIfNeeded");
  }
}

- (void)_ignoreIncomingPushes
{
  NSObject *v3;
  void *v4;
  IDSService *relayService;
  IDSService *smsWatchService;
  uint8_t v7[16];

  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    if (IMOSLoggingEnabled(self))
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1413000, v3, OS_LOG_TYPE_INFO, "No longer accepting incoming pushes", v7, 2u);
      }

    }
    v4 = (void *)MEMORY[0x1D17EA968]();
    -[IDSService removeDelegate:](self->_relayService, "removeDelegate:", self);
    relayService = self->_relayService;
    self->_relayService = 0;

    -[IDSService removeDelegate:](self->_smsWatchService, "removeDelegate:", self);
    smsWatchService = self->_smsWatchService;
    self->_smsWatchService = 0;

    self->_isListening = 0;
    objc_autoreleasePoolPop(v4);
  }
}

- (void)setRegistered:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Changing SMS Push Hander Regiration State to: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  if (v3)
    -[IMDRelayPushHandler _acceptIncomingPushes](self, "_acceptIncomingPushes");
  else
    -[IMDRelayPushHandler _ignoreIncomingPushes](self, "_ignoreIncomingPushes");
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (id)copyHandlersForEnumerating
{
  return (id)-[NSMutableArray _copyForEnumerating](self->_handlers, "_copyForEnumerating");
}

- (void)addListener:(id)a3
{
  NSMutableArray *handlers;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "nonRetainingArray");
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    -[NSMutableArray addObject:](handlers, "addObject:", v7);
  }

}

- (void)removeListener:(id)a3
{
  NSMutableArray *handlers;

  -[NSMutableArray removeObjectIdenticalTo:](self->_handlers, "removeObjectIdenticalTo:", a3);
  if (!-[NSMutableArray count](self->_handlers, "count"))
  {
    handlers = self->_handlers;
    self->_handlers = 0;

  }
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loginID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34388]), "initWithData:accountUniqueID:fromID:loginID:serviceName:", v9, 0, v8, v12, v11);
  return v13;
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "serviceName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loginID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34390]), "initWithDictionary:accountUniqueID:fromID:loginID:serviceName:", v9, 0, v8, v12, v11);
  return v13;
}

- (void)replayMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  IDSAccount *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  id v25;
  __int16 v26;
  IDSAccount *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMEventCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Received dictionary to replay %@", (uint8_t *)&v24, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "serviceName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D34230]);
      v10 = 24;
      if (v9)
        v10 = 16;
      v11 = *(id *)((char *)&self->super.isa + v10);

      v12 = self->_account;
      objc_msgSend(v7, "dictionaryValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fromID");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v11)
        v16 = v13 == 0;
      else
        v16 = 1;
      if (!v16 && v14 != 0)
      {
        -[IMDRelayPushHandler _service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:](self, "_service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:", v11, v12, v13, v14, 0, 1);
LABEL_29:

        goto LABEL_30;
      }
      if (!IMOSLoggingEnabled(v14))
        goto LABEL_29;
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v24 = 138413058;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "SMSReplay: Something was null. service %@ account %@ message %@ fromID %@", (uint8_t *)&v24, 0x2Au);
      }
LABEL_20:

      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v6;
      objc_msgSend(v19, "serviceName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D34230]);
      v22 = 24;
      if (v21)
        v22 = 16;
      v11 = *(id *)((char *)&self->super.isa + v22);

      v12 = self->_account;
      objc_msgSend(v19, "dataValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fromID");
      v23 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v23;
      if (v11 && v13 && v23)
      {
        -[IMDRelayPushHandler _service:account:incomingData:fromID:context:isBeingReplayed:](self, "_service:account:incomingData:fromID:context:isBeingReplayed:", v11, v12, v13, v23, 0, 1);
        goto LABEL_29;
      }
      if (!IMOSLoggingEnabled(v23))
        goto LABEL_29;
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v24 = 138413058;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "SMSReplay: Something was null. service %@ account %@ data %@ fromID %@", (uint8_t *)&v24, 0x2Au);
      }
      goto LABEL_20;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_30:

}

- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8
{
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  _QWORD *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void (*v43)(_QWORD *, IMDRelayPushHandler *, void *, id, void *, id, id, _BOOL4);
  _QWORD *v44;
  IMDRelayPushHandler *v45;
  void *v46;
  id v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v56;
  id v57;
  void *v58;
  void *v59;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v62;
  uint64_t v63;

  v50 = a8;
  v63 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a4;
  v12 = a5;
  v56 = a6;
  v57 = a7;
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AA0]), "initWithIdentifier:timeout:", CFSTR("IncomingMessagePowerAssertion"), 10.0);
  v13 = *MEMORY[0x1E0D34890];
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34890]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D34870]);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "_FTOptionallyDecompressData");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeDictionary();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0D34A38];
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D34A38]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  sub_1D15AC5E8(v17, v12, CFSTR("mc"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v14, "objectForKey:", CFSTR("U"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v14, "objectForKey:", CFSTR("U"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_IDSDataFromBase64String:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    JWUUIDPushObjectToString();
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v25 = (void *)v24;

    goto LABEL_7;
  }
  objc_msgSend(v14, "objectForKey:", CFSTR("U"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("U"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    JWUUIDPushObjectToString();
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  JWUUIDPushObjectToString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  if (v25)
    v26 = v19;
  else
    v26 = 0;
  if (v26 == 1)
  {
    +[IMMessagesToTrack sharedInstance](IMMessagesToTrack, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addMessagesID:", v25);

  }
  if (v16
    || (objc_msgSend(v14, "objectForKey:", qword_1EFC61160), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v12, "objectForKey:", v15), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend(v16, "integerValue") == 227)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v49 = _os_activity_create(&dword_1D1413000, "com.apple.messages.SMSReceivedRelayLocalCommand", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v49, &state);
      if (IMOSLoggingEnabled(v28))
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v29, OS_LOG_TYPE_INFO, "Received IDS Nice message (Local Message) ", buf, 2u);
        }

      }
      objc_msgSend(v12, "objectForKey:", v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        objc_msgSend(v30, "objectForKey:", IMDRelayLocalMessageDictionaryDictKey);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "_FTOptionallyDecompressData");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        JWDecodeDictionary();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", IMDRelayLocalMessageDictionaryTypeKey);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled(v34))
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v34;
            _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, " Attempting to locate block for local message of type %@ ", buf, 0xCu);
          }

        }
        objc_msgSend((id)objc_opt_class(), "localCommandToHandlerBlock");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", v34);
        v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v37)
          ((void (**)(_QWORD, IMDRelayPushHandler *, void *, void *, void *, id, id, _BOOL4))v37)[2](v37, self, v16, v33, v14, v57, v56, v50);

      }
      os_activity_scope_leave(&state);

      goto LABEL_37;
    }
    objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", v16);
    v39 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isSMSFilterSyncEnabled");

    if (v41)
    {
      v42 = objc_msgSend(v16, "integerValue");
      v43 = (void (*)(_QWORD *, IMDRelayPushHandler *, void *, id, void *, id, id, _BOOL4))v39[2];
      if (v42 == 139)
      {
        v44 = v39;
        v45 = self;
        v46 = v16;
        v47 = v12;
LABEL_35:
        v43(v44, v45, v46, v47, v14, v57, v56, v50);
        goto LABEL_36;
      }
    }
    else
    {
      v43 = (void (*)(_QWORD *, IMDRelayPushHandler *, void *, id, void *, id, id, _BOOL4))v39[2];
    }
    v44 = v39;
    v47 = v54;
    v45 = self;
    v46 = v16;
    goto LABEL_35;
  }
LABEL_38:

}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v28 = (void *)objc_msgSend(v13, "_copyMessageDictionaryForLogging");
  if (IMOSLoggingEnabled(v28))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v32 = v28;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v12;
      v37 = 1024;
      v38 = objc_msgSend(v12, "accountType");
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Received message %@ for service %@ on account %@ with type %d ", buf, 0x26u);
    }

  }
  v17 = (void *)MEMORY[0x1D17EA968]();
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isUnderFirstDataProtectionLock"))
  {

  }
  else
  {
    +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isRecordingReplayDB");

    if (!v21)
      goto LABEL_18;
  }
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMEventCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
    }

  }
  -[IMDRelayPushHandler _messageReplayObjectWithService:account:incomingTopLevelMessage:fromID:](self, "_messageReplayObjectWithService:account:incomingTopLevelMessage:fromID:", v11, v12, v13, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v24, "storeMessage:type:error:", v23, 2, &v30);
  v25 = v30;

  if (v25 && IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v23;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
    }

  }
LABEL_18:
  objc_autoreleasePoolPop(v17);
  -[IMDRelayPushHandler _service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:](self, "_service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:", v11, v12, v13, v14, v15, 0);

}

- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 isBeingReplayed:(BOOL)a8
{
  _BOOL8 v8;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  id v23;

  v8 = a8;
  v23 = a6;
  v12 = a7;
  objc_msgSend(a5, "_FTOptionallyDecompressData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  JWDecodeDictionary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v12, "outgoingResponseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  IDSGetUUIDData();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v17, CFSTR("U"), v23, qword_1EFC61170, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "originalCommand");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", v20);
  v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v12, "originalCommand");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, IMDRelayPushHandler *, void *, void *, void *, id, id, _BOOL8))v21)[2](v21, self, v22, v14, v18, v12, v23, v8);

  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  IMDRelayPushHandler *v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v28 = self;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled(v15))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      v31 = v13;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      v36 = 1024;
      v37 = objc_msgSend(v12, "accountType");
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Received Incomming Data %@ for service %@ on account %@ with type %d and context %@", buf, 0x30u);
    }

  }
  v17 = (void *)MEMORY[0x1D17EA968]();
  objc_msgSend(MEMORY[0x1E0D39B78], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isUnderFirstDataProtectionLock"))
  {

  }
  else
  {
    +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isRecordingReplayDB");

    if (!v21)
      goto LABEL_18;
  }
  if (IMOSLoggingEnabled(v19))
  {
    OSLogHandleForIMEventCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
    }

  }
  -[IMDRelayPushHandler _messageReplayObjectWithService:account:incomingData:fromID:](v28, "_messageReplayObjectWithService:account:incomingData:fromID:", v11, v12, v13, v14, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDReplayController sharedInstance](IMDReplayController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v24, "storeMessage:type:error:", v23, 2, &v29);
  v25 = v29;

  if (v25 && IMOSLoggingEnabled(v26))
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v23;
      v32 = 2112;
      v33 = v25;
      _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
    }

  }
LABEL_18:
  objc_autoreleasePoolPop(v17);
  -[IMDRelayPushHandler _service:account:incomingData:fromID:context:isBeingReplayed:](v28, "_service:account:incomingData:fromID:context:isBeingReplayed:", v11, v12, v13, v14, v15, 0);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  int v17;
  id v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v8 = a6;
  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      if (v8)
        v16 = CFSTR("YES");
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (id)_serviceNameOrCompatibilityServiceNameFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayMessageItemDictionaryServiceKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[IMDServiceController sharedController](IMDServiceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceWithName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", IMDRelayMessageItemDictionaryCompatibilityServiceKey);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;

        v4 = v8;
      }

    }
    v9 = v4;
    v4 = v9;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_serviceNameForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IMDRelayPushHandler _serviceNameOrCompatibilityServiceNameFromDictionary:](self, "_serviceNameOrCompatibilityServiceNameFromDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", IMDRelayMessageItemDictionary);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[IMDRelayPushHandler _serviceNameOrCompatibilityServiceNameFromDictionary:](self, "_serviceNameOrCompatibilityServiceNameFromDictionary:", v6);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    v8 = (void *)*MEMORY[0x1E0D38F58];
    if (v5)
      v8 = v5;
    v7 = v8;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_guidsForMessage:(id)a3 messageGUID:(id)a4 routingBehaviors:(unint64_t)a5
{
  char v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v10 = v9;
  if (v8 && (v5 & 2) != 0)
    objc_msgSend(v9, "addObject:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v10, "addObjectsFromArray:", v11);
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", IMDCTMessageDictionaryGUIDKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", IMDRelayLocalMessageDictionaryGUIDKey);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "addObject:", v18);
    objc_msgSend(v10, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_handlerForServiceName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = -[IMDRelayPushHandler copyHandlersForEnumerating](self, "copyHandlersForEnumerating", 0);
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "service");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "internalName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", v4);

            if ((v12 & 1) != 0)
            {
              v6 = v9;
              goto LABEL_14;
            }
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_calculateHandlersForMessage:(id)a3 messageGUID:(id)a4 fromIdentifier:(id)a5 command:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v16 = a3;
  v15 = objc_msgSend(a6, "integerValue");
  -[IMDRelayPushHandler _calculateHandlersForMatchType:routingBehaviors:message:messageGUID:fromIdentifier:completionBlock:](self, "_calculateHandlersForMatchType:routingBehaviors:message:messageGUID:fromIdentifier:completionBlock:", -[IMDRelayPushHandler _listenerMatchTypeForCommand:message:](self, "_listenerMatchTypeForCommand:message:", v15, v16), -[IMDRelayPushHandler _routingBehaviorsForCommand:](self, "_routingBehaviorsForCommand:", v15), v16, v14, v13, v12);

}

- (id)_messageDictionaryForLocalMessage:(id)a3 type:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t isKindOfClass;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (qword_1EFC63EA8 != -1)
    dispatch_once(&qword_1EFC63EA8, &unk_1E922E840);
  objc_msgSend((id)qword_1EFC63EA0, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {

LABEL_7:
    v5 = v8;
    v10 = v5;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled(isKindOfClass))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138740739;
      v14 = v5;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = objc_opt_class();
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Local message %{sensitive}@ of type %@ had key %@ but it was of class %@ instead of NSDictionary", (uint8_t *)&v13, 0x2Au);
    }

  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (void)_calculateHandlersForLocalMessage:(id)a3 userInfo:(id)a4 completionBlock:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = IMDRelayLocalMessageDictionaryTypeKey;
  v9 = a5;
  v10 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[IMDRelayPushHandler _messageDictionaryForLocalMessage:type:](self, "_messageDictionaryForLocalMessage:type:", v10, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMDRelayPushHandler _calculateHandlersForMatchType:routingBehaviors:message:messageGUID:fromIdentifier:completionBlock:](self, "_calculateHandlersForMatchType:routingBehaviors:message:messageGUID:fromIdentifier:completionBlock:", -[IMDRelayPushHandler _listenerMatchTypeForLocalMessageType:message:](self, "_listenerMatchTypeForLocalMessageType:message:", v12, v11), -[IMDRelayPushHandler _routingBehaviorsForLocalMessageType:](self, "_routingBehaviorsForLocalMessageType:", v12), v11, 0, 0, v9);
}

- (id)_handlersForExplicitServiceWithMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMDRelayPushHandler _serviceNameForMessage:](self, "_serviceNameForMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDRelayPushHandler _handlerForServiceName:](self, "_handlerForServiceName:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6;
  }
  else
  {
    v8 = 0;
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412803;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      v15 = 2117;
      v16 = v4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Routing payload to %@ due to explicitly specified service %@, payload=%{sensitive}@", (uint8_t *)&v11, 0x20u);
    }

  }
  return v8;
}

- (void)_calculateHandlersForMatchType:(unint64_t)a3 routingBehaviors:(unint64_t)a4 message:(id)a5 messageGUID:(id)a6 fromIdentifier:(id)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void (**v50)(void *, void *);
  IMDRelayPushHandler *v51;
  id v52;
  void *v53;
  void *v54;
  id obj;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  uint64_t i;
  uint64_t v62;
  id v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  void (**v67)(void *, void *);
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD aBlock[4];
  id v85;
  IMDRelayPushHandler *v86;
  id v87;
  unint64_t v88;
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  void *v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v52 = a7;
  v16 = a8;
  v51 = self;
  v53 = v14;
  v47 = v15;
  -[IMDRelayPushHandler _guidsForMessage:messageGUID:routingBehaviors:](self, "_guidsForMessage:messageGUID:routingBehaviors:", v14, v15, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D15BC044;
  aBlock[3] = &unk_1E922E868;
  v49 = v17;
  v85 = v49;
  v86 = self;
  v88 = a4;
  v48 = v16;
  v87 = v48;
  v50 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (a3 != 1 && (a4 & 4) != 0)
  {
    -[IMDRelayPushHandler _handlersForExplicitServiceWithMessage:](self, "_handlersForExplicitServiceWithMessage:", v14);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "count"))
    {
LABEL_4:
      v50[2](v50, v58);
      goto LABEL_62;
    }

  }
  v18 = -[IMDRelayPushHandler copyHandlersForEnumerating](self, "copyHandlersForEnumerating");
  v58 = v18;
  switch(a3)
  {
    case 0uLL:
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          v92 = v14;
          _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Broadcasting payload to all registered listeners, payload=%{sensitive}@", buf, 0xCu);
        }

      }
      goto LABEL_4;
    case 1uLL:
      -[IMDRelayPushHandler _handlersForExplicitServiceWithMessage:](self, "_handlersForExplicitServiceWithMessage:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2](v50, v20);

      break;
    case 2uLL:
      v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v74 = 0u;
      v75 = 0u;
      v73 = 0u;
      v72 = 0u;
      obj = -[IMDRelayPushHandler copyHandlersForEnumerating](self, "copyHandlersForEnumerating");
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
      if (v57)
      {
        v54 = 0;
        v56 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v73 != v56)
              objc_enumerationMutation(obj);
            v59 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              objc_msgSend(v59, "accounts");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v22; ++j)
                  {
                    if (*(_QWORD *)v69 != v23)
                      objc_enumerationMutation(v21);
                    v25 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j);
                    v26 = (void *)MEMORY[0x1E0D39648];
                    +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "accounts");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(v26) = objc_msgSend(v26, "isAccountUsableForSendingWithAllAccounts:account:", v28, v25);

                    if ((_DWORD)v26)
                      objc_msgSend(v63, "addObject:", v25);
                  }
                  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v68, v89, 16);
                }
                while (v22);
              }

              objc_msgSend(v59, "chatForOutgoingMessage:fromIdentifier:isInProxyMode:createIfNotExists:", v53, v52, 0, 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v29, "isNewerThan:", v54))
              {
                v30 = v29;

                v54 = v30;
              }

            }
          }
          v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v90, 16);
        }
        while (v57);
      }
      else
      {
        v54 = 0;
      }

      objc_msgSend(v53, "objectForKey:", IMDCTMessageDictionaryReceipientsKey);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "__imArrayByApplyingBlock:", &unk_1E922E888);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      +[IMDServiceReachabilityController sharedController](IMDServiceReachabilityController, "sharedController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMDServiceReachabilityController sharedController](IMDServiceReachabilityController, "sharedController");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "reachabilityContextForChat:", v54);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = sub_1D15BC230;
      v65[3] = &unk_1E922E8B0;
      v65[4] = v51;
      v66 = v53;
      v67 = v50;
      objc_msgSend(v44, "calculateServiceForSendingToHandles:accounts:context:completionBlock:", v43, v63, v46, v65);

      break;
    case 3uLL:
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v60 = v49;
      v31 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
      if (v31)
      {
        v62 = *(_QWORD *)v81;
        v64 = 0;
        while (1)
        {
          for (k = 0; k != v31; ++k)
          {
            if (*(_QWORD *)v81 != v62)
              objc_enumerationMutation(v60);
            v33 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v34 = v58;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v77;
              do
              {
                for (m = 0; m != v35; ++m)
                {
                  if (*(_QWORD *)v77 != v36)
                    objc_enumerationMutation(v34);
                  v38 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
                  if ((objc_opt_respondsToSelector() & 1) != 0
                    && objc_msgSend(v38, "responsibleForMessageID:", v33))
                  {
                    v97 = v38;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
                    v39 = objc_claimAutoreleasedReturnValue();

                    v64 = (void *)v39;
                    goto LABEL_51;
                  }
                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v76, v98, 16);
              }
              while (v35);
            }
LABEL_51:

          }
          v31 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
          if (!v31)
            goto LABEL_55;
        }
      }
      v64 = 0;
LABEL_55:

      if (IMOSLoggingEnabled(v40))
      {
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412803;
          v92 = v60;
          v93 = 2112;
          v94 = v64;
          v95 = 2117;
          v96 = v53;
          _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Routing payload for messages %@ to %@, payload=%{sensitive}@", buf, 0x20u);
        }

      }
      v50[2](v50, v64);

      break;
    default:
      break;
  }
LABEL_62:

}

- (BOOL)_messageRequestsServiceForSendingBypass:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", IMDRelayMessageItemDictionarySkipServiceForSendingKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0;

  return v4;
}

- (unint64_t)_listenerMatchTypeForCommand:(int64_t)a3 message:(id)a4
{
  id v6;
  char v7;
  unint64_t v8;
  void *v9;
  BOOL v10;

  v6 = a4;
  v7 = a3 - 101;
  if ((unint64_t)(a3 - 101) > 0x30)
    goto LABEL_9;
  if (((1 << v7) & 0x1600000000003) == 0)
  {
    if (((1 << v7) & 0x18000000000) != 0)
      goto LABEL_11;
    if (((1 << v7) & 0xC0000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "deviceType") == 2)
      {
        v10 = -[IMDRelayPushHandler _messageRequestsServiceForSendingBypass:](self, "_messageRequestsServiceForSendingBypass:", v6);

        if (!v10)
        {
          v8 = 2;
          goto LABEL_12;
        }
      }
      else
      {

      }
LABEL_11:
      v8 = 1;
      goto LABEL_12;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_12;
  }
  v8 = 3;
LABEL_12:

  return v8;
}

- (unint64_t)_listenerMatchTypeForLocalMessageType:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (qword_1EFC63EC0 != -1)
    dispatch_once(&qword_1EFC63EC0, &unk_1E922E8D0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_10;
  }
  objc_msgSend((id)qword_1EFC63EB0, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "deviceType") != 2)
    goto LABEL_8;
  v11 = -[IMDRelayPushHandler _messageRequestsServiceForSendingBypass:](self, "_messageRequestsServiceForSendingBypass:", v7);

  if (!v11)
  {
    objc_msgSend((id)qword_1EFC63EB8, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v12)
      v9 = objc_msgSend(v12, "integerValue");
LABEL_8:

  }
LABEL_10:

  return v9;
}

- (unint64_t)_routingBehaviorsForCommand:(int64_t)a3
{
  unint64_t result;
  char v4;

  result = 0;
  v4 = a3 - 101;
  if ((unint64_t)(a3 - 101) <= 0x30)
  {
    if (((1 << v4) & 0xD8000000000) != 0)
    {
      return 8;
    }
    else if (((1 << v4) & 0x1400000000003) != 0)
    {
      return 2;
    }
    else if (a3 == 146)
    {
      return 6;
    }
  }
  return result;
}

- (unint64_t)_routingBehaviorsForLocalMessageType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (qword_1EFC63ED0 != -1)
    dispatch_once(&qword_1EFC63ED0, &unk_1E922E8F0);
  objc_msgSend((id)qword_1EFC63EC8, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
  objc_storeStrong((id *)&self->_relayService, a3);
}

- (IDSService)smsWatchService
{
  return self->_smsWatchService;
}

- (void)setSmsWatchService:(id)a3
{
  objc_storeStrong((id *)&self->_smsWatchService, a3);
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)registeredForPush
{
  return self->_registeredForPush;
}

- (void)setRegisteredForPush:(BOOL)a3
{
  self->_registeredForPush = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSCache)guidToListenersCache
{
  return self->_guidToListenersCache;
}

- (void)setGuidToListenersCache:(id)a3
{
  objc_storeStrong((id *)&self->_guidToListenersCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidToListenersCache, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_smsWatchService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
}

@end
