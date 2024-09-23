@implementation CBManager

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_lock(&_sessionCounterLock);
  --_sessionCounter;
  pthread_mutex_unlock(&_sessionCounterLock);
  -[CBXpcConnection disconnect](self->_connection, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)CBManager;
  -[CBManager dealloc](&v3, sel_dealloc);
}

- (void)_handleAdvertisingAddressChanged:(id)a3
{
  id v4;
  NSData *v5;
  void *v6;
  int64_t v7;
  NSData *v8;
  void *v9;
  int64_t v10;
  NSData *advertisingAddress;
  NSData *v12;
  NSData *nonConnectableAdvertisingAddress;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBConnectableAdvertisingAddress"));
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBConnectableAdvertisingAddressType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBNonConnectableAdvertisingAddress"));
  v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBNonConnectableAdvertisingAddressType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  -[CBManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("advertisingAddress"));
  advertisingAddress = self->_advertisingAddress;
  self->_advertisingAddress = v5;
  v12 = v5;

  nonConnectableAdvertisingAddress = self->_nonConnectableAdvertisingAddress;
  self->_advertisingAddressType = v7;
  self->_nonConnectableAdvertisingAddress = v8;

  self->_nonConnectableAdvertisingAddressType = v10;
  -[CBManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("advertisingAddress"));
}

- (void)xpcConnectionDidReceiveMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v6 = a4;
  if ((_DWORD)v4 == 3)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v7 = CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A82A2000, v7, OS_LOG_TYPE_DEFAULT, "Received CBMsgIdReadyForTCC", v8, 2u);
    }
    -[CBManager performTCCCheck:](self, "performTCCCheck:", v6);

  }
  else
  {
    if ((_DWORD)v4 == 6)
      -[CBManager handleStateUpdatedMsg:](self, "handleStateUpdatedMsg:", v6);
    else
      -[CBManager handleMsg:args:](self, "handleMsg:args:", v4, v6);

  }
}

- (CBManagerState)state
{
  return self->_state;
}

- (void)extractLocalDeviceStatesDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAddressString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_localAddressString, v5);
  if (v6)
  {
    -[CBManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localName"));
    objc_storeStrong((id *)&self->_localName, v6);
    -[CBManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localName"));
  }
  if (+[CBManager authorization](CBManager, "authorization") == CBManagerAuthorizationNotDetermined)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v8 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      -[CBManager extractLocalDeviceStatesDictionary:].cold.1(v8);
      if (!v7)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  if (v7)
LABEL_10:
    -[CBManager setState:](self, "setState:", objc_msgSend(v7, "integerValue"));
LABEL_11:
  -[CBManager handleLocalDeviceStateUpdatedMsg:](self, "handleLocalDeviceStateUpdatedMsg:", v4);

}

+ (CBManagerAuthorization)authorization
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  CBManagerAuthorization v8;
  CBManagerAuthorization v9;

  v2 = xpc_copy_entitlement_for_self();
  v3 = (void *)v2;
  if (v2 && MEMORY[0x1A85D2194](v2) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v3))
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      +[CBManager authorization].cold.4();
    goto LABEL_27;
  }
  if (_os_feature_enabled_impl())
  {
    v4 = xpc_copy_entitlement_for_self();
    v5 = (void *)v4;
    if (v4 && MEMORY[0x1A85D2194](v4) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v5))
    {
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        +[CBManager authorization].cold.4();

      goto LABEL_27;
    }

  }
  if (!+[CBManager tccAvailable](CBManager, "tccAvailable"))
    goto LABEL_27;
  v6 = +[CBManager preflightCheckForTCC](CBManager, "preflightCheckForTCC");
  switch(v6)
  {
    case 2:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        +[CBManager authorization].cold.3();
      v8 = (unint64_t)(TCCAccessRestricted() != 0);

      return v8;
    case 1:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        +[CBManager authorization].cold.2();
      if (TCCAccessRestricted())
        v9 = CBManagerAuthorizationRestricted;
      else
        v9 = CBManagerAuthorizationDenied;

      return v9;
    case 0:
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
        +[CBManager authorization].cold.1();

      return 3;
    default:
LABEL_27:

      return 0;
  }
}

- (void)performTCCCheck:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *devicesAroundUsDetails;
  NSString *v8;
  NSString *btGlobalTCCCenterLabel;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[CBManager tccAvailable](CBManager, "tccAvailable"))
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v12 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    LOWORD(v18) = 0;
    v13 = "TCC not available, calling doneWithTCC without setting tccComplete.";
    goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgRequiresTCC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager setTccRequired:](self, "setTccRequired:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTCCLEDevicesAroundDetails"));
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  devicesAroundUsDetails = self->devicesAroundUsDetails;
  self->devicesAroundUsDetails = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgTCCLELocalizedCenterLabel"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  btGlobalTCCCenterLabel = self->btGlobalTCCCenterLabel;
  self->btGlobalTCCCenterLabel = v8;

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v10 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    LODWORD(v18) = 67109376;
    HIDWORD(v18) = +[CBManager tccAvailable](CBManager, "tccAvailable");
    v19 = 1024;
    v20 = -[CBManager tccRequired](self, "tccRequired");
    _os_log_impl(&dword_1A82A2000, v11, OS_LOG_TYPE_DEFAULT, "Running performTccCheck CBManager tccAvail %d, tccRequired %d", (uint8_t *)&v18, 0xEu);

  }
  if (-[CBManager tccComplete](self, "tccComplete"))
  {
    if (CBLogInitOnce == -1)
    {
      v12 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_26:
        -[CBManager doneWithTCC](self, "doneWithTCC", v18);
        goto LABEL_27;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v12 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
    }
    LOWORD(v18) = 0;
    v13 = "TCC is already complete";
LABEL_14:
    _os_log_impl(&dword_1A82A2000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v18, 2u);
    goto LABEL_26;
  }
  if (!-[CBManager tccRequired](self, "tccRequired"))
  {
    if (CBLogInitOnce == -1)
    {
      v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        -[CBManager setTccApproved:](self, "setTccApproved:", 1);
        goto LABEL_26;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v16 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
    }
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1A82A2000, v16, OS_LOG_TYPE_DEFAULT, "TCC not required", (uint8_t *)&v18, 2u);
    goto LABEL_25;
  }
  if (CBLogInitOnce != -1)
  {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    v14 = CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    goto LABEL_19;
  }
  v14 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_19:
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1A82A2000, v14, OS_LOG_TYPE_DEFAULT, "TCC required", (uint8_t *)&v18, 2u);
  }
LABEL_20:
  -[CBManager checkForTCCWithDeviceCount](self, "checkForTCCWithDeviceCount");
LABEL_27:

}

+ (BOOL)tccAvailable
{
  return MEMORY[0x1E0DB1010] != 0;
}

- (BOOL)tccRequired
{
  return self->_tccRequired;
}

- (BOOL)tccComplete
{
  return self->_tccComplete;
}

- (void)setTccRequired:(BOOL)a3
{
  self->_tccRequired = a3;
}

- (void)setTccApproved:(BOOL)a3
{
  self->_tccApproved = a3;
}

- (id)initInternal
{
  CBManager *v2;
  CBManager *v3;
  NSString *localAddressString;
  NSString *localName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CBManager;
  v2 = -[CBManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    localAddressString = v2->_localAddressString;
    v2->_localAddressString = 0;

    localName = v3->_localName;
    v3->_localName = 0;

    pthread_mutex_lock(&_sessionCounterLock);
    ++_sessionCounter;
    pthread_mutex_unlock(&_sessionCounterLock);
  }
  return v3;
}

- (BOOL)getCBPrivacySupported
{
  return dyld_program_sdk_at_least();
}

- (void)doneWithTCC
{
  id v3;

  -[CBManager setTccComplete:](self, "setTccComplete:", 1);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 4, v3);

}

- (void)setTccComplete:(BOOL)a3
{
  self->_tccComplete = a3;
}

- (void)startWithQueue:(id)a3 options:(id)a4 sessionType:(int)a5
{
  uint64_t v5;
  id v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v11;
  id v12;
  id v13;
  CBXpcConnection *v14;
  CBXpcConnection *connection;
  id v16;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v16 = v8;
  if (v8)
  {
    v9 = (OS_dispatch_queue *)v8;
    queue = self->_queue;
    self->_queue = v9;
  }
  else
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    queue = self->_queue;
    self->_queue = v11;
  }
  v13 = a4;

  v14 = -[CBXpcConnection initWithDelegate:queue:options:sessionType:]([CBXpcConnection alloc], "initWithDelegate:queue:options:sessionType:", self, self->_queue, v13, v5);
  connection = self->_connection;
  self->_connection = v14;

  -[CBXpcConnection connect](self->_connection, "connect");
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int64_t state;
  BOOL v12;
  BOOL v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      if (CBLogInitOnce != -1)
        dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v10 = CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412546;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_1A82A2000, v10, OS_LOG_TYPE_DEFAULT, "CBManager fwdMsg %@ through WHB for peripheral %@ ", (uint8_t *)&v15, 0x16u);
      }
      -[CBXpcConnection forwardWhbMsg:args:cnx:](self->_connection, "forwardWhbMsg:args:cnx:", v4, v6, v9);

      goto LABEL_16;
    }
  }
  state = self->_state;
  v12 = state == 10 || state == 5;
  if (v12
    || state == 4 && -[CBManager isMsgAllowedWhenOff:](self, "isMsgAllowedWhenOff:", v4)
    || -[CBManager isMsgAllowedAlways:](self, "isMsgAllowedAlways:", v4))
  {
    -[CBXpcConnection sendMsg:args:](self->_connection, "sendMsg:args:", v4, v6);
LABEL_16:
    v13 = 1;
    goto LABEL_17;
  }
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    -[CBManager sendMsg:args:].cold.1();
  v13 = 0;
LABEL_17:

  return v13;
}

- (BOOL)isMsgAllowedAlways:(unsigned __int16)a3
{
  return a3 == 4 || a3 == 31;
}

- (CBPairingAgent)sharedPairingAgent
{
  CBPairingAgent *pairingAgent;
  CBPairingAgent *v4;
  CBPairingAgent *v5;

  pairingAgent = self->_pairingAgent;
  if (!pairingAgent)
  {
    v4 = -[CBPairingAgent initWithParentManager:]([CBPairingAgent alloc], "initWithParentManager:", self);
    v5 = self->_pairingAgent;
    self->_pairingAgent = v4;

    pairingAgent = self->_pairingAgent;
  }
  return pairingAgent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_localAddressString, 0);
  objc_storeStrong((id *)&self->_nonConnectableAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_advertisingAddress, 0);
  objc_storeStrong((id *)&self->devicesAroundUsDetails, 0);
  objc_storeStrong((id *)&self->btGlobalTCCCenterLabel, 0);
  objc_storeStrong((id *)&self->_cnxDict, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pairingAgent, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setConnectionTargetQueue:(id)a3
{
  -[CBXpcConnection setTargetQueue:](self->_connection, "setTargetQueue:", a3);
}

- (id)getCurrentQueue
{
  OS_dispatch_queue *queue;
  void *v3;
  id v4;

  queue = self->_queue;
  if (queue)
    return queue;
  v3 = (void *)MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C80D38];
  return v3;
}

- (BOOL)sendRawCommand:(unsigned __int16)a3 data:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (BOOL)sendDebugMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  CBXpcConnection *connection;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  v13[0] = CFSTR("kCBMsgId");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v13[1] = CFSTR("kCBMsgArgs");
  v10 = (id)MEMORY[0x1E0C9AA70];
  if (v7)
    v10 = v7;
  v14[0] = v8;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendMsg:args:](connection, "sendMsg:args:", 208, v11);

  return 1;
}

- (id)sendDebugSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4;
  CBXpcConnection *connection;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  v14[0] = CFSTR("kCBMsgId");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedShort:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v14[1] = CFSTR("kCBMsgArgs");
  v10 = (id)MEMORY[0x1E0C9AA70];
  if (v7)
    v10 = v7;
  v15[0] = v8;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendSyncMsg:args:](connection, "sendSyncMsg:args:", 208, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  return -[CBXpcConnection sendSyncMsg:args:](self->_connection, "sendSyncMsg:args:", a3, a4);
}

- (BOOL)sendMsg:(unsigned __int16)a3 args:(id)a4 withReply:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  int64_t state;
  BOOL v11;
  BOOL v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  state = self->_state;
  v11 = state == 10 || state == 5;
  if (v11
    || state == 4 && -[CBManager isMsgAllowedWhenOff:](self, "isMsgAllowedWhenOff:", v6)
    || -[CBManager isMsgAllowedAlways:](self, "isMsgAllowedAlways:", v6))
  {
    -[CBXpcConnection sendMsgWithReply:args:replyBlock:](self->_connection, "sendMsgWithReply:args:replyBlock:", v6, v8, v9);
    v12 = 1;
  }
  else
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      -[CBManager sendMsg:args:].cold.1();
    v12 = 0;
  }

  return v12;
}

- (void)setWHBMsgReplyHandler:(id)a3
{
  -[CBXpcConnection setWhbReplyHandler:](self->_connection, "setWhbReplyHandler:", a3);
}

- (void)closeL2CAPChannelForPeerUUID:(id)a3 withPsm:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBManager closeL2CAPChannelForPeerUUID:withPsm:].cold.1();
  v7 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("kCBMsgArgPSM"), v6, CFSTR("kCBMsgArgDeviceUUID"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 26, v9);

}

- (id)createCnxWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CBConnection *v8;
  CBDevice *v9;
  CBDevice *v10;
  void *v11;
  void *v12;
  void *v13;
  CBDevice *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgDeviceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteDeviceUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgWhbRemoteControllerId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CBManager getCnxInstanceForIdentifier:](self, "getCnxInstanceForIdentifier:", v5);
  v8 = (CBConnection *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(CBConnection);
    -[CBConnection setDispatchQueue:](v8, "setDispatchQueue:", self->_queue);
    v9 = objc_alloc_init(CBDevice);
    v10 = v9;
    if (v6)
    {
      -[CBDevice setIdentifier:](v9, "setIdentifier:", v6);
    }
    else
    {
      objc_msgSend(v5, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBDevice setIdentifier:](v10, "setIdentifier:", v11);

    }
    -[CBConnection setPeerDevice:](v8, "setPeerDevice:", v10);
    -[CBConnection peerDevice](v8, "peerDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc_init(CBDevice);
    -[CBDevice setIdentifier:](v14, "setIdentifier:", v7);
    -[CBConnection setRemoteDevice:](v8, "setRemoteDevice:", v14);
    -[NSMutableDictionary setObject:forKey:](self->_cnxDict, "setObject:forKey:", v8, v5);
    v15 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __31__CBManager_createCnxWithInfo___block_invoke;
    v28[3] = &unk_1E53FF780;
    v16 = v5;
    v29 = v16;
    -[CBConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v28);
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __31__CBManager_createCnxWithInfo___block_invoke_39;
    v25[3] = &unk_1E54026E8;
    v25[4] = self;
    v17 = v16;
    v26 = v17;
    v18 = v13;
    v27 = v18;
    -[CBConnection setErrorHandler:](v8, "setErrorHandler:", v25);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __31__CBManager_createCnxWithInfo___block_invoke_41;
    v22[3] = &unk_1E53FF668;
    v22[4] = self;
    v23 = v17;
    v24 = v18;
    v19 = v18;
    -[CBConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v22);
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __31__CBManager_createCnxWithInfo___block_invoke_42;
    v21[3] = &unk_1E53FFB40;
    v21[4] = self;
    -[CBConnection setXpcForwardMessageReceiveHandler:](v8, "setXpcForwardMessageReceiveHandler:", v21);

  }
  return v8;
}

void __31__CBManager_createCnxWithInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  v2 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A82A2000, v2, OS_LOG_TYPE_DEFAULT, "WHB cnx instance for localId %@ invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void __31__CBManager_createCnxWithInfo___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    __31__CBManager_createCnxWithInfo___block_invoke_39_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "removeCnxInstanceForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "removeWhbRemoteId:", *(_QWORD *)(a1 + 48));

}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_41(uint64_t a1)
{
  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
    __31__CBManager_createCnxWithInfo___block_invoke_41_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "removeCnxInstanceForIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "removeWhbRemoteId:", *(_QWORD *)(a1 + 48));
}

uint64_t __31__CBManager_createCnxWithInfo___block_invoke_42(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didReceiveForwardedDelegateCallbackMessage:", a2);
}

- (id)getCnxInstanceForIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *cnxDict;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;

  v4 = a3;
  cnxDict = self->_cnxDict;
  if (!cnxDict)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_cnxDict;
    self->_cnxDict = v6;

    cnxDict = self->_cnxDict;
  }
  -[NSMutableDictionary objectForKey:](cnxDict, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeCnxInstanceForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_cnxDict, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_cnxDict, "removeObjectForKey:", v6);
  }

}

- (void)didReceiveForwardedMessageForCBManager:(id)a3
{
  -[CBXpcConnection didReceiveForwardedMessage:](self->_connection, "didReceiveForwardedMessage:", a3);
}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
  -[CBXpcConnection setWhbLocalId:forRemoteId:](self->_connection, "setWhbLocalId:forRemoteId:", a3, a4);
}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return -[CBXpcConnection getWhbLocalIdForRemoteId:](self->_connection, "getWhbLocalIdForRemoteId:", a3);
}

- (void)removeWhbRemoteId:(id)a3
{
  -[CBXpcConnection removeWhbRemoteId:](self->_connection, "removeWhbRemoteId:", a3);
}

- (void)retrieveSupportedResources:(id)a3 subKey:(id)a4 completion:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  char **__ptr32 *v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  if (v9)
  {
    if (objc_msgSend(v9, "length"))
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBManager.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key != nil"));

    if (objc_msgSend(0, "length"))
    {
LABEL_3:
      if (v11)
        goto LABEL_4;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBManager.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

      v12 = MEMORY[0x1E0C809B0];
      v13 = &off_1A8334000;
      if (v9)
        goto LABEL_5;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBManager.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[key length] > 0"));

  if (!v11)
    goto LABEL_14;
LABEL_4:
  v12 = MEMORY[0x1E0C809B0];
  v13 = &off_1A8334000;
  if (v9)
  {
LABEL_5:
    v14 = objc_msgSend(v9, "length");
    if (v11 && v14)
      goto LABEL_8;
  }
LABEL_7:
  -[CBXpcConnection getEventQueue](self->_connection, "getEventQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = *((_QWORD *)v13 + 67);
  block[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke;
  block[3] = &unk_1E5402710;
  v25 = v11;
  dispatch_async(v15, block);

LABEL_8:
  if (v10)
    v16 = v10;
  else
    v16 = &stru_1E5403C08;
  v26[0] = CFSTR("kCBMsgArgResourceKey");
  v26[1] = CFSTR("kCBMsgArgResourceSubKey");
  v27[0] = v9;
  v27[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  v22[1] = *((_QWORD *)v13 + 67);
  v22[2] = __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_66;
  v22[3] = &unk_1E53FF618;
  v23 = v11;
  v18 = v11;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 28, v17, v22);

}

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithInfo:", &unk_1E5424080);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

void __58__CBManager_retrieveSupportedResources_subKey_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResourceTotalCount"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCBMsgArgResourceRemainingCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveBundle:(id)a3 sessionCountWithCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = CFSTR("kCBMsgArgApplicationID");
  v14[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke;
  v11[3] = &unk_1E53FF618;
  v12 = v6;
  v10 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 31, v9, v11);

}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (CBLogInitOnce != -1)
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1();
    v7 = &unk_1E5423E98;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (unsigned __int16)objc_msgSend(v7, "unsignedIntValue"));

}

+ (unsigned)retrieveCurrentProcessSessionCount
{
  unsigned __int16 v2;

  pthread_mutex_lock(&_sessionCounterLock);
  v2 = _sessionCounter;
  pthread_mutex_unlock(&_sessionCounterLock);
  return v2;
}

+ (id)getTCCServer
{
  uint64_t v2;
  void *v3;

  pthread_mutex_lock(&gLock);
  if (!getTCCServer_tccServer)
  {
    v2 = tcc_server_create();
    v3 = (void *)getTCCServer_tccServer;
    getTCCServer_tccServer = v2;

  }
  pthread_mutex_unlock(&gLock);
  return (id)getTCCServer_tccServer;
}

+ (int)preflightCheckForTCC
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 2;
  v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_credential_singleton_for_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__CBManager_preflightCheckForTCC__block_invoke;
  v8[3] = &unk_1E5402738;
  v8[4] = &v9;
  v5 = (void *)MEMORY[0x1A85D1CE4](v8);
  +[CBManager getTCCServer](CBManager, "getTCCServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_server_message_request_authorization();

  LODWORD(v6) = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return (int)v6;
}

uint64_t __33__CBManager_preflightCheckForTCC__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;

  if (!a3)
  {
    v3 = result;
    result = tcc_authorization_record_get_authorization_right();
    v4 = 2 * (result != 2);
    if (!result)
      v4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = v4;
  }
  return result;
}

- (CBManagerAuthorization)authorization
{
  return +[CBManager authorization](CBManager, "authorization");
}

- (void)handlePairingAgentMsg:(unsigned __int16)a3 args:(id)a4
{
  -[CBPairingAgent handlePairingMessage:args:](self->_pairingAgent, "handlePairingMessage:args:", a3, a4);
}

- (BOOL)isMsgAllowedWhenOff:(unsigned __int16)a3
{
  return 0;
}

- (void)handleMsg:(unsigned __int16)a3 args:(id)a4
{
  -[CBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)xpcConnectionDidReset
{
  -[CBManager setState:](self, "setState:", 1);
  -[CBPairingAgent updateRegistration](self->_pairingAgent, "updateRegistration");
}

- (void)xpcConnectionIsInvalid
{
  -[CBManager setState:](self, "setState:", 2);
}

- (void)triggerBTErrorReport:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (CBLogInitOnce != -1)
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    -[CBManager triggerBTErrorReport:].cold.1();
  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("kCBMsgArgReasonEnum"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBManager sendMsg:args:](self, "sendMsg:args:", 27, v7);

}

- (id)peerWithInfo:(id)a3
{
  -[CBManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)checkForTCCWithDeviceCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  tcc_credential_singleton_for_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_service_singleton_for_CF_name();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->btGlobalTCCCenterLabel, CFSTR("mapCentralLabelStringKey"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->devicesAroundUsDetails, CFSTR("mapLabelArrayForCalloutsKey"));
  tcc_message_options_set_client_dict();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__CBManager_checkForTCCWithDeviceCount__block_invoke;
  v9[3] = &unk_1E5402760;
  v9[4] = self;
  v7 = (void *)MEMORY[0x1A85D1CE4](v9);
  +[CBManager getTCCServer](CBManager, "getTCCServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tcc_server_message_request_authorization();

}

void __39__CBManager_checkForTCCWithDeviceCount__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = v5;
  if (a3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getCurrentQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__CBManager_checkForTCCWithDeviceCount__block_invoke_2;
    v10[3] = &unk_1E53FF5A0;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 32);
    v11 = v8;
    v12 = v9;
    dispatch_async(v7, v10);

  }
}

uint64_t __39__CBManager_checkForTCCWithDeviceCount__block_invoke_2(uint64_t a1)
{
  uint64_t authorization_right;

  authorization_right = tcc_authorization_record_get_authorization_right();
  objc_msgSend(*(id *)(a1 + 40), "setTccComplete:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setTccApproved:", authorization_right == 2);
  return objc_msgSend(*(id *)(a1 + 40), "doneWithTCC");
}

- (void)queryBluetoothStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
    v7 = a3;
  else
    v7 = (id)MEMORY[0x1E0C9AA70];
  v14 = CFSTR("kCBMsgArgOptions");
  v15[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __45__CBManager_queryBluetoothStatus_completion___block_invoke;
  v12[3] = &unk_1E53FF618;
  v13 = v6;
  v11 = v6;
  -[CBManager sendMsg:args:withReply:](self, "sendMsg:args:withReply:", 30, v10, v12);

}

void __45__CBManager_queryBluetoothStatus_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)tccApproved
{
  return self->_tccApproved;
}

- (NSData)advertisingAddress
{
  return self->_advertisingAddress;
}

- (void)setAdvertisingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)advertisingAddressType
{
  return self->_advertisingAddressType;
}

- (NSData)nonConnectableAdvertisingAddress
{
  return self->_nonConnectableAdvertisingAddress;
}

- (void)setNonConnectableAdvertisingAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)nonConnectableAdvertisingAddressType
{
  return self->_nonConnectableAdvertisingAddressType;
}

- (NSString)localAddressString
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)localName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)extractLocalDeviceStatesDictionary:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  +[CBManager authorization](CBManager, "authorization");
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_DEBUG, "Authorization state is %ld", v2, 0xCu);

}

- (void)sendMsg:args:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "API MISUSE: %@ can only accept this command while in the powered on state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)closeL2CAPChannelForPeerUUID:withPsm:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_DEBUG, "Close L2CAP channel for peerUUID %@ with psm :%u", v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __31__CBManager_createCnxWithInfo___block_invoke_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "CBCentralManager->WHB shim error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __31__CBManager_createCnxWithInfo___block_invoke_41_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1A82A2000, v0, OS_LOG_TYPE_ERROR, "CBCentralManager->WHB shim interrupted", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __55__CBManager_retrieveBundle_sessionCountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A82A2000, v0, v1, "retrieveBundle:CBSessionCountWithCompletion failed %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)authorization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1A82A2000, v0, v1, "Skipping TCC check, authStatus: CBManagerAuthorizationNotDetermined", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)triggerBTErrorReport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_1A82A2000, v0, v1, "Reporting a BT Problem", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
