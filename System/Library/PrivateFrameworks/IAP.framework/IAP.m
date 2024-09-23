void *IAPRegisterEAAuthGetters(void *result, void *a2)
{
  _eaAuthDataGetter = result;
  _eaAuthSerialStringGetter = a2;
  return result;
}

uint64_t IAPLocationDeactivate()
{
  unsigned int ClientIDForIAPD;
  unsigned int v1;
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;

  pthread_mutex_lock(&__isLocationActivatedLock);
  if (__isLocationActivated == 1)
    __isLocationActivated = 0;
  pthread_mutex_unlock(&__isLocationActivatedLock);
  ClientIDForIAPD = IAPAppGetClientIDForIAPD();
  if (ClientIDForIAPD)
  {
    v1 = ClientIDForIAPD;
    v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v2)
    {
      v3 = v2;
      v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "clientID", v1);
      xpc_dictionary_set_string(v4, "requestType", "IAPLocationDeactivate");
      v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
      if (v5)
      {
        v6 = v5;
        v7 = MEMORY[0x1B5E4DB38]();
        if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] IAPLocationDeactivate received an XPC_ERROR_CONNECTION_INVALID error.\n"));
        }
        else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] IAPLocationDeactivate received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
        }
        else if (v7 == MEMORY[0x1E0C812F8])
        {
          if (!xpc_dictionary_get_BOOL(v6, "result"))
            NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationDeactivate");
        }
        else if (v7 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationDeactivate", 122);
        }
        else
        {
          NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationDeactivate", 126, v7);
        }
        xpc_release(v6);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationDeactivate", 132);
      }
      xpc_release(v4);
      xpc_release(v3);
    }
    else
    {
      NSLog(CFSTR("[#Location] Skip IAPLocationDeactivate, no xpc connection to iapd\n"));
    }
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationDeactivate, no clientID for iapd\n"));
  }
  return 1;
}

uint64_t IAPAppRegisterClient(uint64_t a1)
{
  int v1;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  xpc_object_t v11;
  uint64_t v12;
  _BOOL4 v13;
  _xpc_connection_s *v14;
  _xpc_connection_s *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _xpc_connection_s *v22;
  _xpc_connection_s *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD __dst[129];

  v1 = a1;
  __dst[128] = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("IAPAppRegisterClient: capabilities 0x%x"), a1);
  pthread_mutex_lock(&__eaClientPortLock);
  if ((__eaClientRegisterediapd & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__iapdServerLaunched, CFSTR("kIAPServerLaunchedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)__iapdServerDied, CFSTR("kIAPDServerDiedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if ((__eaClientRegisterediap2d & 1) == 0)
  {
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)__iap2dServerLaunched, CFSTR("kIAP2ServerLaunchedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)__iap2dServerDied, CFSTR("kIAP2ServerDiedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  NSLog(CFSTR("IAPAppRegisterClient: __eaClientRegisterediapd %d -> %d"), __eaClientRegisterediapd, 1);
  __eaClientRegisterediapd = 1;
  NSLog(CFSTR("IAPAppRegisterClient: __eaClientRegisterediap2d %d -> %d"), __eaClientRegisterediap2d, 1);
  __eaClientRegisterediap2d = 1;
  __eaClientCapabilities = v1;
  if ((v1 & 0x200) != 0)
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", getprogname(), 4);
  else
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  v7 = (void *)v6;
  memset((char *)__dst + 1, 170, 0x3FFuLL);
  LOBYTE(__dst[0]) = 0;
  if (v7 && (unint64_t)objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4) <= 0x3FF)
    strlcpy((char *)__dst, (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4), 0x400uLL);
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "objectForInfoDictionaryKey:", CFSTR("UISupportedExternalAccessoryProtocols"));
  if (v8 && (v9 = v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 100, 0, 0);
  else
    v10 = 0;
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, "requestType", "IAPAppRegisterClient");
  xpc_dictionary_set_uint64(v11, "eaClientCapabilities", __eaClientCapabilities);
  xpc_dictionary_set_string(v11, "eaClientBundleID", (const char *)__dst);
  xpc_dictionary_set_uint64(v11, "eaClientID", __eaClientIDiapd);
  xpc_dictionary_set_BOOL(v11, "eaClientHasCheckedForConnectedAccessories", __eaClientHasCheckedForConnectedAccessories);
  if (v10)
    xpc_dictionary_set_data(v11, "eaClientSupportedProtocols", (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  v12 = __eaiapdHasClientID;
  v13 = IAPDHasLaunched();
  NSLog(CFSTR("IAPAppRegisterClient: __eaiapdHasClientID %d, IAPDHasLaunched %d"), v12, v13);
  if ((__eaiapdHasClientID & 1) == 0 && IAPDHasLaunched())
  {
    v14 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v14)
    {
      v15 = v14;
      v16 = _IAPSendXPCMessageWithTimeout(v14, v11, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v16)
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppRegisterClient", 515);
        v19 = 0;
LABEL_51:
        xpc_release(v15);
        goto LABEL_25;
      }
      v17 = (void *)v16;
      v18 = MEMORY[0x1B5E4DB38]();
      if (v17 == (void *)MEMORY[0x1E0C81260] && v18 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 491, __dst[0]);
      }
      else if (v17 == (void *)MEMORY[0x1E0C81258] && v18 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 495, __dst[0]);
      }
      else
      {
        if (v18 == MEMORY[0x1E0C812F8])
        {
          __eaClientIDiapd = xpc_dictionary_get_uint64(v17, "eaClientID");
          v19 = 1;
          __eaiapdHasClientID = 1;
LABEL_50:
          xpc_release(v17);
          goto LABEL_51;
        }
        if (v18 == MEMORY[0x1E0C81310])
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppRegisterClient", 505, v28, __dst[0]);
        else
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppRegisterClient", 509, v18, __dst[0]);
      }
      v19 = 0;
      goto LABEL_50;
    }
  }
  v19 = 0;
LABEL_25:
  v20 = __eaiap2dHasClientID;
  v21 = IAP2DHasLaunched();
  NSLog(CFSTR("IAPAppRegisterClient: __eaiap2dHasClientID %d, IAP2DHasLaunched %d"), v20, v21);
  if ((__eaiap2dHasClientID & 1) == 0 && IAP2DHasLaunched())
  {
    v22 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
    if (v22)
    {
      v23 = v22;
      xpc_dictionary_set_uint64(v11, "eaClientID", __eaClientIDiap2d);
      v24 = _IAPSendXPCMessageWithTimeout(v23, v11, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v24)
      {
        v25 = (void *)v24;
        v26 = MEMORY[0x1B5E4DB38]();
        if (v25 == (void *)MEMORY[0x1E0C81260] && v26 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 539);
        }
        else if (v25 == (void *)MEMORY[0x1E0C81258] && v26 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 543);
        }
        else if (v26 == MEMORY[0x1E0C812F8])
        {
          __eaClientIDiap2d = xpc_dictionary_get_uint64(v25, "eaClientID");
          v19 = 1;
          __eaiap2dHasClientID = 1;
        }
        else if (v26 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppRegisterClient", 553, v28);
        }
        else
        {
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppRegisterClient", 557, v26);
        }
        xpc_release(v25);
      }
      else
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppRegisterClient", 563);
      }
      xpc_release(v23);
    }
  }
  xpc_release(v11);
  pthread_mutex_unlock(&__eaClientPortLock);
  NSLog(CFSTR("IAPAppRegisterClient: registerWasSuccessful %d"), v19);
  return v19;
}

_xpc_connection_s *IAPAppConnectedAccessories()
{
  xpc_object_t v0;
  _BOOL4 v1;
  _BOOL4 v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const void *data;
  uint64_t v8;
  _xpc_connection_s *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  size_t length;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "requestType", "IAPAppConnectedAccessories");
  NSLog(CFSTR("IAPAppConnectedAccessories: __eaClientHasCheckedForConnectedAccessories %d -> %d"), __eaClientHasCheckedForConnectedAccessories, 1);
  __eaClientHasCheckedForConnectedAccessories = 1;
  v1 = IAPDHasLaunched();
  v2 = IAP2DHasLaunched();
  NSLog(CFSTR("IAPAppConnectedAccessories: IAPDHasLaunched %d, IAP2DHasLaunched %d"), v1, v2);
  v3 = 0;
  if (IAPDHasLaunched())
  {
    v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    xpc_dictionary_set_uint64(v0, "eaClientID", __eaClientIDiapd);
    if (v3)
    {
      v4 = _IAPSendXPCMessageWithTimeout(v3, v0, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v4)
      {
        v5 = (void *)v4;
        xpc_release(v3);
        v6 = MEMORY[0x1B5E4DB38](v5);
        if (v5 == (void *)MEMORY[0x1E0C81260] && v6 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 637);
        }
        else if (v5 == (void *)MEMORY[0x1E0C81258] && v6 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 641);
        }
        else if (v6 == MEMORY[0x1E0C812F8])
        {
          length = 0;
          data = xpc_dictionary_get_data(v5, "plistData", &length);
          v3 = 0;
          if (!data || !length)
            goto LABEL_21;
          v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
          if (v8)
          {
            v20 = 0;
            v3 = (_xpc_connection_s *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v20);
            if (!v3)
              NSLog(CFSTR("ERROR - received bogus string from iapd with the following error: %@"), objc_msgSend(v20, "description"));
            goto LABEL_21;
          }
        }
        else if (v6 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppConnectedAccessories", 668);
        }
        else
        {
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppConnectedAccessories", 672, v6);
        }
        v3 = 0;
LABEL_21:
        xpc_release(v5);
        goto LABEL_22;
      }
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppConnectedAccessories", 628);
      xpc_release(v3);
      v3 = 0;
    }
  }
LABEL_22:
  if (IAP2DHasLaunched())
  {
    v9 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
    xpc_dictionary_set_uint64(v0, "eaClientID", __eaClientIDiap2d);
    if (v9)
    {
      v10 = _IAPSendXPCMessageWithTimeout(v9, v0, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v10)
      {
        v11 = (void *)v10;
        xpc_release(v9);
        v12 = MEMORY[0x1B5E4DB38](v11);
        if (v11 == (void *)MEMORY[0x1E0C81260] && v12 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 699);
        }
        else if (v11 == (void *)MEMORY[0x1E0C81258] && v12 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 703);
        }
        else if (v12 == MEMORY[0x1E0C812F8])
        {
          length = 0;
          v13 = xpc_dictionary_get_data(v11, "plistData", &length);
          if (v13)
          {
            if (length)
            {
              v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13);
              if (v14)
              {
                v20 = 0;
                v15 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v20);
                if (v15)
                {
                  v16 = v15;
                  if (!v3)
                    v3 = (_xpc_connection_s *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  -[_xpc_connection_s addObjectsFromArray:](v3, "addObjectsFromArray:", v16);
                }
                else
                {
                  NSLog(CFSTR("ERROR - received bogus string from iap2d with the following error: %@"), objc_msgSend(v20, "description"), v18, v19);
                }
              }
            }
          }
        }
        else if (v12 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppConnectedAccessories", 740, v19);
        }
        else
        {
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppConnectedAccessories", 744, v12);
        }
      }
      else
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppConnectedAccessories", 690);
        v11 = v9;
      }
      xpc_release(v11);
    }
  }
  xpc_release(v0);
  return v3;
}

BOOL IAPDHasLaunched()
{
  _BOOL8 v0;
  uint64_t v1;
  int check;
  uint64_t state64;
  int out_token;

  out_token = 0;
  state64 = 0;
  v0 = 0;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      v1 = IAPDHasLaunched::_oldIapdAvailableState;
      if (IAPDHasLaunched::_oldIapdAvailableState != state64)
      {
        NSLog(CFSTR("IAPDHasLaunched: kIAPAvailableNotification iapdAvailableState %d -> %d"), IAPDHasLaunched::_oldIapdAvailableState, state64);
        v1 = state64;
        IAPDHasLaunched::_oldIapdAvailableState = state64;
      }
      v0 = v1 != 0;
    }
    else
    {
      v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IAP2DHasLaunched()
{
  _BOOL8 v0;
  uint64_t v1;
  int check;
  uint64_t state64;
  int out_token;

  out_token = 0;
  state64 = 0;
  v0 = 0;
  if (!notify_register_check("com.apple.iap2d.notify.availability", &out_token))
  {
    check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      v1 = IAP2DHasLaunched::_oldIap2dAvailableState;
      if (IAP2DHasLaunched::_oldIap2dAvailableState != state64)
      {
        NSLog(CFSTR("IAP2DHasLaunched: kIAP2AvailableNotification iap2dAvailableState %d -> %d"), IAP2DHasLaunched::_oldIap2dAvailableState, state64);
        v1 = state64;
        IAP2DHasLaunched::_oldIap2dAvailableState = state64;
      }
      v0 = v1 != 0;
    }
    else
    {
      v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

uint64_t IAPLocationActivate()
{
  unsigned int ClientIDForIAPD;
  unsigned int v1;
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;

  pthread_mutex_lock(&__isLocationActivatedLock);
  if ((__isLocationActivated & 1) == 0)
    __isLocationActivated = 1;
  pthread_mutex_unlock(&__isLocationActivatedLock);
  ClientIDForIAPD = IAPAppGetClientIDForIAPD();
  if (ClientIDForIAPD)
  {
    v1 = ClientIDForIAPD;
    v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v2)
    {
      v3 = v2;
      v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "clientID", v1);
      xpc_dictionary_set_string(v4, "requestType", "IAPLocationActivate");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
      xpc_release(v3);
    }
    else
    {
      NSLog(CFSTR("[#Location] Skip IAPLocationActivate, no xpc connection to iapd\n"));
    }
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationActivate, no clientID for iapd\n"));
  }
  return 1;
}

uint64_t IAPAppGetClientIDForIAPD()
{
  uint64_t v0;

  pthread_mutex_lock(&__eaClientPortLock);
  v0 = __eaClientIDiapd;
  pthread_mutex_unlock(&__eaClientPortLock);
  return v0;
}

uint64_t IAPAppSendXPCMessageReplyWithTimeout(_xpc_connection_s *a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  return _IAPSendXPCMessageReplyWithTimeout(a1, a2, a4, a3, a5);
}

uint64_t IAPAppSendDebugCommand(unsigned int a1, void *a2, uint64_t *a3)
{
  xpc_object_t v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const void *data;
  uint64_t v14;
  size_t length;

  length = 0;
  if (a3)
    *a3 = 0;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "requestType", "kXPCIAPAppSendDebugCommand");
  xpc_dictionary_set_uint64(v6, "kXPCIAPAppDebugCommandType", a1);
  xpc_dictionary_set_data(v6, "kXPCIAPAppDebugCommandData", (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
  v7 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
  if (v7)
  {
    v8 = v7;
    v9 = _IAPSendXPCMessageWithTimeout(v7, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppSendDebugCommand", 351);
      v12 = 0;
LABEL_23:
      xpc_release(v8);
      goto LABEL_24;
    }
    v10 = (void *)v9;
    v11 = MEMORY[0x1B5E4DB38]();
    if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendDebugCommand", 320);
    }
    else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendDebugCommand", 324);
    }
    else
    {
      if (v11 == MEMORY[0x1E0C812F8])
      {
        data = xpc_dictionary_get_data(v10, "kXPCIAPAppDebugCommandData", &length);
        v12 = 1;
        if (data)
        {
          if (length)
          {
            v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
            if (a3)
              *a3 = v14;
          }
        }
        goto LABEL_22;
      }
      if (v11 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppSendDebugCommand", 341);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppSendDebugCommand", 345, v11);
    }
    v12 = 0;
LABEL_22:
    xpc_release(v10);
    goto LABEL_23;
  }
  NSLog(CFSTR("ERROR - %s no connection to iapd"), "IAPAppSendDebugCommand");
  v12 = 0;
LABEL_24:
  xpc_release(v6);
  return v12;
}

BOOL IAPAppToAppSocketPath(int a1, int a2, char *__str)
{
  if (__str)
    snprintf(__str, 0x100uLL, "%s/ea.%u.%u", "/var/mobile/Library/ExternalAccessory", a1, a2);
  else
    NSLog(CFSTR("ERROR - %s %s : %d - ERROR: path is NULL"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppToAppSocketPath", 371);
  return __str != 0;
}

BOOL IAPAppToAppFifoPath(int a1, int a2, char *__str)
{
  if (__str)
    snprintf(__str, 0x100uLL, "%s/ea.%d.%d.out", "/var/mobile/Library/ExternalAccessory", a1, a2);
  else
    NSLog(CFSTR("ERROR - %s %s : %d - ERROR: path is NULL"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppToAppFifoPath", 384);
  return __str != 0;
}

BOOL IAPAppFromAppFifoPath(int a1, int a2, char *__str)
{
  if (__str)
    snprintf(__str, 0x100uLL, "%s/ea.%d.%d.in", "/var/mobile/Library/ExternalAccessory", a1, a2);
  else
    NSLog(CFSTR("%s %s : %d - ERROR: path is NULL"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppFromAppFifoPath", 397);
  return __str != 0;
}

uint64_t __iapdServerLaunched(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t result;
  char v6;
  uint64_t state64;
  int out_token;

  if (_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken != -1)
    dispatch_once(&_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken, &__block_literal_global_234);
  out_token = 0;
  result = notify_register_check("com.apple.iapd.notify.availability", &out_token);
  if (!(_DWORD)result)
  {
    state64 = 1;
    notify_get_state(out_token, &state64);
    if (!state64)
    {
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.iapd.notify.availability");
    }
    result = notify_cancel(out_token);
  }
  if (__eaClientRegisterediapd == 1)
  {
    IAPAppRegisterClient(__eaClientCapabilities);
    v6 = 0;
    result = IAPLocationIsActivated(&v6);
    if (v6)
      return IAPLocationActivate();
  }
  return result;
}

uint64_t __iapdServerDied(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  pthread_mutex_lock(&__eaClientPortLock);
  __eaiapdHasClientID = 0;
  __eaClientIDiapd = 0;
  pthread_mutex_unlock(&__eaClientPortLock);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppMigServerDiedNotification"), 0, 0);
}

uint64_t __iap2dServerLaunched(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t result;
  char v6;
  uint64_t state64;
  int out_token;

  if (_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken != -1)
    dispatch_once(&_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken, &__block_literal_global_234);
  out_token = 0;
  result = notify_register_check("com.apple.iap2d.notify.availability", &out_token);
  if (!(_DWORD)result)
  {
    state64 = 1;
    notify_get_state(out_token, &state64);
    if (!state64)
    {
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.iapd.notify.availability");
    }
    result = notify_cancel(out_token);
  }
  if (__eaClientRegisterediap2d == 1)
  {
    IAPAppRegisterClient(__eaClientCapabilities);
    v6 = 0;
    result = IAPLocationIsActivated(&v6);
    if (v6)
      return IAPLocationActivate();
  }
  return result;
}

uint64_t __iap2dServerDied(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  pthread_mutex_lock(&__eaClientPortLock);
  __eaiap2dHasClientID = 0;
  __eaClientIDiap2d = 0;
  pthread_mutex_unlock(&__eaClientPortLock);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppMigServerDiedNotification"), 0, 0);
}

uint64_t IAPAppGetClientIDForIAP2D()
{
  uint64_t v0;

  pthread_mutex_lock(&__eaClientPortLock);
  v0 = __eaClientIDiap2d;
  pthread_mutex_unlock(&__eaClientPortLock);
  return v0;
}

BOOL IAPAppCreateSessionForAccessory(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  int *v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int uint64;
  int v16;

  v16 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v16);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppCreateSessionForAccessory");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    if (v16)
    {
      if (v16 != 1)
        goto LABEL_8;
      v9 = &__eaClientIDiap2d;
    }
    else
    {
      v9 = &__eaClientIDiapd;
    }
    xpc_dictionary_set_uint64(v8, "eaClientID", *v9);
LABEL_8:
    v11 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v11)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppCreateSessionForAccessory", 810);
      v10 = 0;
LABEL_23:
      xpc_release(v8);
      xpc_release(v7);
      return v10;
    }
    v12 = (void *)v11;
    v13 = MEMORY[0x1B5E4DB38]();
    if (v12 == (void *)MEMORY[0x1E0C81260] && v13 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 785);
    }
    else if (v12 == (void *)MEMORY[0x1E0C81258] && v13 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 789);
    }
    else
    {
      if (v13 == MEMORY[0x1E0C812F8])
      {
        uint64 = xpc_dictionary_get_uint64(v12, "eaSessionID");
        *a3 = uint64;
        v10 = uint64 != 0x10000;
LABEL_22:
        xpc_release(v12);
        goto LABEL_23;
      }
      if (v13 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppCreateSessionForAccessory", 800);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppCreateSessionForAccessory", 804, v13);
    }
    v10 = 0;
    goto LABEL_22;
  }
  NSLog(CFSTR("%s:%s-%d connection = %hhx, not valid!"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 816, 0);
  return 0;
}

BOOL IAPAppOpenSessionFromAppToAccessory(unsigned int a1, unsigned int a2, unsigned int a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  int v14;

  v14 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppOpenSessionFromAppToAccessory");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    xpc_dictionary_set_uint64(v8, "eaSessionID", a3);
    v9 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppOpenSessionFromAppToAccessory", 865);
      v12 = 0;
LABEL_18:
      xpc_release(v8);
      xpc_release(v7);
      return v12;
    }
    v10 = (void *)v9;
    v11 = MEMORY[0x1B5E4DB38]();
    if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 843);
    }
    else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 847);
    }
    else
    {
      if (v11 == MEMORY[0x1E0C812F8])
      {
        v12 = xpc_dictionary_get_BOOL(v10, "openWasSuccessful");
LABEL_17:
        xpc_release(v10);
        goto LABEL_18;
      }
      if (v11 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppOpenSessionFromAppToAccessory", 855);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppOpenSessionFromAppToAccessory", 859, v11);
    }
    v12 = 0;
    goto LABEL_17;
  }
  NSLog(CFSTR("%s:%s-%d connection = %hhx, not valid!"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 871, 0);
  return 0;
}

BOOL IAPAppOpenSessionFromAccessoryToApp(unsigned int a1, unsigned int a2, unsigned int a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  int v14;

  v14 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppOpenSessionFromAccessoryToApp");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    xpc_dictionary_set_uint64(v8, "eaSessionID", a3);
    v9 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppOpenSessionFromAccessoryToApp", 920);
      v12 = 0;
LABEL_18:
      xpc_release(v8);
      xpc_release(v7);
      return v12;
    }
    v10 = (void *)v9;
    v11 = MEMORY[0x1B5E4DB38]();
    if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 898);
    }
    else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 902);
    }
    else
    {
      if (v11 == MEMORY[0x1E0C812F8])
      {
        v12 = xpc_dictionary_get_BOOL(v10, "openWasSuccessful");
LABEL_17:
        xpc_release(v10);
        goto LABEL_18;
      }
      if (v11 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppOpenSessionFromAccessoryToApp", 910);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppOpenSessionFromAccessoryToApp", 914, v11);
    }
    v12 = 0;
    goto LABEL_17;
  }
  NSLog(CFSTR("%s:%s-%d connection = %hhx, not valid!"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 926, 0);
  return 0;
}

BOOL IAPAppCloseSessionToAccessory(unsigned int a1, unsigned int a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  int v12;

  v12 = 2;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v12);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPAppCloseSessionToAccessory");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_uint64(v6, "eaSessionID", a2);
    v7 = _IAPSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v7)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppCloseSessionToAccessory", 975);
      v10 = 0;
LABEL_18:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    v8 = (void *)v7;
    v9 = MEMORY[0x1B5E4DB38]();
    if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 953);
    }
    else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 957);
    }
    else
    {
      if (v9 == MEMORY[0x1E0C812F8])
      {
        v10 = xpc_dictionary_get_BOOL(v8, "closeWasSuccessful");
LABEL_17:
        xpc_release(v8);
        goto LABEL_18;
      }
      if (v9 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppCloseSessionToAccessory", 965);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppCloseSessionToAccessory", 969, v9);
    }
    v10 = 0;
    goto LABEL_17;
  }
  NSLog(CFSTR("%s:%s-%d connection = %hhx, not valid!"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 981, 0);
  return 0;
}

void IAPAppStartAccessibility()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global);
}

void IAPAppStopAccessibility()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_224);
}

BOOL IAPAppSendAccessibilityResponse(unsigned int a1, uint64_t a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  _BOOL8 result;
  int v14;

  v14 = 2;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  v5 = v4;
  if (a2 && v4)
  {
    v6 = (void *)MEMORY[0x1B5E4D838]();
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "requestType", "IAPAppAccessibilityResponse");
    xpc_dictionary_set_uint64(v7, "connectionID", a1);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
    if (v8)
      xpc_dictionary_set_data(v7, "userInfo", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    v9 = _IAPSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppSendAccessibilityResponse", 1085);
      v12 = 0;
LABEL_22:
      xpc_release(v7);
      objc_autoreleasePoolPop(v6);
      goto LABEL_23;
    }
    v10 = (void *)v9;
    v11 = MEMORY[0x1B5E4DB38]();
    if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendAccessibilityResponse", 1063);
    }
    else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendAccessibilityResponse", 1067);
    }
    else
    {
      if (v11 == MEMORY[0x1E0C812F8])
      {
        v12 = xpc_dictionary_get_BOOL(v10, "sendWasSuccessful");
LABEL_21:
        xpc_release(v10);
        goto LABEL_22;
      }
      if (v11 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppSendAccessibilityResponse", 1075);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppSendAccessibilityResponse", 1079, v11);
    }
    v12 = 0;
    goto LABEL_21;
  }
  v12 = 0;
  result = 0;
  if (v5)
  {
LABEL_23:
    xpc_release(v5);
    return v12;
  }
  return result;
}

BOOL IAPAppSendPointOfInterestInformation(unsigned int a1, void *a2, void *a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  void *v8;
  xpc_object_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 result;
  int v15;

  v15 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v15);
  v7 = v6;
  if (a2 && a3 && v6)
  {
    v8 = (void *)MEMORY[0x1B5E4D838]();
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "IAPDestinationtInformation");
    xpc_dictionary_set_uint64(v9, "connectionID", a1);
    xpc_dictionary_set_data(v9, "IAPDestinationtInformationIdentifierStr", (const void *)objc_msgSend((id)objc_msgSend(a3, "dataUsingEncoding:", 4), "bytes"), objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4));
    xpc_dictionary_set_data(v9, "IAPDestinationInformationParametersStr", (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
    v10 = _IAPSendXPCMessageWithTimeout(v7, v9, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v10)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppSendPointOfInterestInformation", 1144);
      v13 = 0;
LABEL_21:
      xpc_release(v9);
      objc_autoreleasePoolPop(v8);
      goto LABEL_22;
    }
    v11 = (void *)v10;
    v12 = MEMORY[0x1B5E4DB38]();
    if (v11 == (void *)MEMORY[0x1E0C81260] && v12 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendPointOfInterestInformation", 1122);
    }
    else if (v11 == (void *)MEMORY[0x1E0C81258] && v12 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendPointOfInterestInformation", 1126);
    }
    else
    {
      if (v12 == MEMORY[0x1E0C812F8])
      {
        v13 = xpc_dictionary_get_BOOL(v11, "sendWasSuccessful");
LABEL_20:
        xpc_release(v11);
        goto LABEL_21;
      }
      if (v12 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppSendPointOfInterestInformation", 1134);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppSendPointOfInterestInformation", 1138, v12);
    }
    v13 = 0;
    goto LABEL_20;
  }
  v13 = 0;
  result = 0;
  if (v7)
  {
LABEL_22:
    xpc_release(v7);
    return v13;
  }
  return result;
}

void IAPAppBeginOOBBTPairingForConnection(unsigned int a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  void *v4;
  xpc_object_t v5;
  int v6;

  v6 = 2;
  v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v6);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1B5E4D838]();
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPAppBeginOOBPairingStr");
    xpc_dictionary_set_uint64(v5, "connectionID", a1);
    xpc_connection_send_message(v3, v5);
    xpc_release(v5);
    objc_autoreleasePoolPop(v4);
    xpc_release(v3);
  }
}

void IAPAppNotifyAppOfSessionClose(int a1, int a2)
{
  _QWORD block[4];
  int v3;
  int v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __IAPAppNotifyAppOfSessionClose_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  v3 = a2;
  v4 = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void *__GetEAAccessoryManager(void)
{
  void *result;
  void *v1;
  void *v2;

  result = (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
  if (!__GetEAAccessoryManager(void)::_GetEAAccesoryManager)
  {
    v1 = (void *)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory"));
    v2 = dlopen((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 1);
    __GetEAAccessoryManager(void)::eaHandle = (uint64_t)v2;
    if (v2)
    {
      result = dlsym(v2, "GetEAAccesoryManager");
      __GetEAAccessoryManager(void)::_GetEAAccesoryManager = (uint64_t)result;
      if (result)
        return result;
      goto LABEL_4;
    }
    NSLog(CFSTR("ERROR: Could not load ExternalAccessory.framework from %@"), v1);
    result = (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
    if (!__GetEAAccessoryManager(void)::_GetEAAccesoryManager)
    {
LABEL_4:
      NSLog(CFSTR("ERROR: could not load GetEAAccesoryManager"));
      return (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
    }
  }
  return result;
}

uint64_t IAPAppProcessIDIsUsingAccessory(const __CFString *a1)
{
  xpc_object_t v2;
  CFIndex Length;
  char *v4;
  char *v5;
  CFIndex v6;
  uint64_t v7;
  const char *CStringPtr;
  _xpc_connection_s *v9;
  _xpc_connection_s *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t (*v15)(const __CFString *);
  uint64_t v17;

  if (a1)
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPAppProcessIDIsUsingAccessory");
    Length = CFStringGetLength(a1);
    v4 = (char *)malloc_type_malloc(Length + 1, 0xAB168C1uLL);
    if (v4)
    {
      v5 = v4;
      v6 = CFStringGetLength(a1);
      CFStringGetCString(a1, v5, v6 + 1, 0x8000100u);
      xpc_dictionary_set_string(v2, "displayIdentifier", v5);
      free(v5);
    }
    else
    {
      CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
      NSLog(CFSTR("%s:%s-%d ERROR, can't check for process %s\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1401, CStringPtr);
    }
    if (!IAPDHasLaunched())
      goto LABEL_24;
    v9 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (!v9)
      goto LABEL_24;
    v10 = v9;
    v11 = _IAPSendXPCMessageWithTimeout(v9, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = MEMORY[0x1B5E4DB38]();
      if (v12 == (void *)MEMORY[0x1E0C81260] && v13 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1416);
      }
      else if (v12 == (void *)MEMORY[0x1E0C81258] && v13 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1420);
      }
      else
      {
        if (v13 == MEMORY[0x1E0C812F8])
        {
          v14 = xpc_dictionary_get_BOOL(v12, "processAllowedByIAPD");
          xpc_release(v12);
          xpc_release(v10);
          if (v14)
          {
            v7 = 1;
LABEL_27:
            xpc_release(v2);
            return v7;
          }
LABEL_24:
          v15 = (uint64_t (*)(const __CFString *))IAPWeakLinkSymbol("ACCDigitalAudioAllowBackgroundAudioForClient", (const void *)6);
          if (v15)
          {
            v7 = v15(a1);
            NSLog(CFSTR("background audio processAllowed = %d for displayID %@"), v7, a1);
          }
          else
          {
            NSLog(CFSTR("ERROR - couldn't find function ACCDigitalAudioAllowBackgroundAudioForClient"));
            v7 = 0;
          }
          goto LABEL_27;
        }
        if (v13 == MEMORY[0x1E0C81310])
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppProcessIDIsUsingAccessory", 1428, v17);
        else
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppProcessIDIsUsingAccessory", 1432, v13);
      }
      xpc_release(v12);
    }
    else
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppProcessIDIsUsingAccessory", 1438);
    }
    xpc_release(v10);
    goto LABEL_24;
  }
  NSLog(CFSTR("%s:%s-%d ERROR, can't check for process, displayID is null\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1464);
  return 0;
}

uint64_t IAPAppAuthCertForConnectionID(uint64_t a1)
{
  unsigned int v1;
  uint64_t result;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *data;
  size_t length;
  int v13;

  v1 = a1;
  if (!_eaAuthDataGetter || (result = _eaAuthDataGetter(a1)) == 0)
  {
    v13 = 2;
    v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(v1, &v13);
    v4 = v3;
    if (v13 != 2 && v3 != 0)
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "requestType", "IAPAppAuthCertForConnectionIDStr");
      xpc_dictionary_set_uint64(v7, "connectionID", v1);
      v8 = _IAPSendXPCMessageWithTimeout(v4, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v8)
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppAuthCertForConnectionID", 1524);
        v6 = 0;
LABEL_27:
        xpc_release(v7);
        goto LABEL_28;
      }
      v9 = (void *)v8;
      v10 = MEMORY[0x1B5E4DB38]();
      if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertForConnectionID", 1496);
      }
      else if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertForConnectionID", 1500);
      }
      else
      {
        if (v10 == MEMORY[0x1E0C812F8])
        {
          length = 0;
          data = xpc_dictionary_get_data(v9, "kXPCIAPAppAuthCertDataStr", &length);
          v6 = 0;
          if (data && length)
            v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
          goto LABEL_26;
        }
        if (v10 == MEMORY[0x1E0C81310])
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppAuthCertForConnectionID", 1514);
        else
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppAuthCertForConnectionID", 1518, v10);
      }
      v6 = 0;
LABEL_26:
      xpc_release(v9);
      goto LABEL_27;
    }
    v6 = 0;
    result = 0;
    if (v4)
    {
LABEL_28:
      xpc_release(v4);
      return v6;
    }
  }
  return result;
}

uint64_t IAPAppAuthCertSerialStringForConnectionID(uint64_t a1)
{
  unsigned int v1;
  uint64_t result;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *string;
  int v12;

  v1 = a1;
  if (!_eaAuthSerialStringGetter || (result = _eaAuthSerialStringGetter(a1)) == 0)
  {
    v12 = 2;
    v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(v1, &v12);
    v4 = v3;
    if (v12 != 2 && v3 != 0)
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "requestType", "IAPAppAuthCertSerialForConnectionIDStr");
      xpc_dictionary_set_uint64(v7, "connectionID", v1);
      v8 = _IAPSendXPCMessageWithTimeout(v4, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v8)
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAppAuthCertSerialStringForConnectionID", 1589);
        v6 = 0;
LABEL_26:
        xpc_release(v7);
        goto LABEL_27;
      }
      v9 = (void *)v8;
      v10 = MEMORY[0x1B5E4DB38]();
      if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INVALID error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertSerialStringForConnectionID", 1564);
      }
      else if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%s-%d received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertSerialStringForConnectionID", 1568);
      }
      else if (v10 == MEMORY[0x1E0C812F8])
      {
        string = xpc_dictionary_get_string(v9, "kXPCIAPAppAuthCertSerialStr");
        if (string)
        {
          v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 4);
LABEL_25:
          xpc_release(v9);
          goto LABEL_26;
        }
      }
      else if (v10 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAppAuthCertSerialStringForConnectionID", 1579);
      }
      else
      {
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAppAuthCertSerialStringForConnectionID", 1583, v10);
      }
      v6 = 0;
      goto LABEL_25;
    }
    v6 = 0;
    result = 0;
    if (v4)
    {
LABEL_27:
      xpc_release(v4);
      return v6;
    }
  }
  return result;
}

void SendDisplayPortStatusToAccessory(BOOL a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;

  v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "kXPCIAPAppSendDisplayPortStatus");
    xpc_dictionary_set_BOOL(v4, "kXPCDisplayPortStatus", a1);
    xpc_connection_send_message(v3, v4);
    xpc_release(v4);
    xpc_release(v3);
  }
}

void ___ZL41_InitIAPAppSendXPCMessageDefaultTimeoutMsv_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  objc_msgSend(v0, "addSuiteNamed:", CFSTR("com.apple.logging"));
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("OverrideIAPXPCTimeoutMs"));
  if (v1 == -1)
    v2 = 0;
  else
    v2 = v1;
  if (v1)
    v3 = v2;
  else
    v3 = 1000;
  NSLog(CFSTR("Loading logging preferences... %@, %ld -> %ld"), CFSTR("OverrideIAPXPCTimeoutMs"), __IAPAppSendXPCMessageDefaultTimeoutMs, v3);
  __IAPAppSendXPCMessageDefaultTimeoutMs = v3;
}

void ___ZL28_xpc_handle_outgoing_requestPU24objcproto13OS_xpc_object8NSObjectPU28objcproto17OS_dispatch_queueS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *string;
  void *v7;
  const void *data;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t (*EAAccessoryManager)(void);
  void *v14;
  xpc_object_t value;
  const char *string_ptr;
  BOOL v17;
  xpc_object_t reply;
  void *v19;
  uint64_t v20;
  xpc_object_t v21;
  const char *v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  size_t length;

  v4 = MEMORY[0x1B5E4DB38](a2);
  v5 = MEMORY[0x1E0C812F8];
  if (v4 != MEMORY[0x1E0C812F8])
  {
    if (v4 == MEMORY[0x1E0C81310])
    {
      value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x1E0C81270]);
      if (value)
        string_ptr = xpc_string_get_string_ptr(value);
      else
        string_ptr = "";
      NSLog(CFSTR("%s:%s-%d ERROR - received error: %s"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1363, string_ptr);
    }
    else
    {
      NSLog(CFSTR("%s:%s-%d ERROR - received an unknown error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1368);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    return;
  }
  string = xpc_dictionary_get_string(a2, "requestType");
  if (!string)
  {
    NSLog(CFSTR("RequestType not specified in xpc message!"));
    string = "<nil>";
  }
  if (!strcmp(string, "VoiceOver"))
  {
    v7 = (void *)MEMORY[0x1B5E4D838]();
    v25 = 0;
    length = 0xAAAAAAAAAAAAAAAALL;
    data = xpc_dictionary_get_data(a2, "userInfo", &length);
    if (data
      && (v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length)) != 0
      && (v10 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v25)) != 0)
    {
      v11 = (void *)v10;
      v12 = xpc_dictionary_get_string(a2, "VoiceOver");
      EAAccessoryManager = (uint64_t (*)(void))__GetEAAccessoryManager();
      if (EAAccessoryManager)
        v14 = (void *)EAAccessoryManager();
      else
        v14 = 0;
      if (v12)
      {
        if (!strcmp(v12, "Action"))
        {
          if (__GetEAStringConstant(char const*)::once != -1)
            dispatch_once(&__GetEAStringConstant(char const*)::once, &__block_literal_global_267);
          if (__GetEAStringConstant(char const*)::eaHandle)
          {
            v23 = dlsym((void *)__GetEAStringConstant(char const*)::eaHandle, "EAAccessoryAccessibilityContextKey");
            if (v23)
            {
              if (*v23 && objc_msgSend(v11, "objectForKey:"))
                objc_msgSend(v14, "accessibilityContextChange:", v11);
            }
          }
          objc_msgSend(v14, "accessibilityAction:", v11);
        }
        else if (!strcmp(v12, "ContextChange"))
        {
          objc_msgSend(v14, "accessibilityContextChange:", v11);
        }
        else if (!strcmp(v12, "ItemPropertyRequest"))
        {
          objc_msgSend(v14, "accessibilityItemPropertyRequest:", v11);
        }
        else if (!strcmp(v12, "SystemPropertyChange"))
        {
          objc_msgSend(v14, "accessibilitySystemPropertyChange:", v11);
        }
        else if (!strcmp(v12, "SystemPropertyRequest"))
        {
          objc_msgSend(v14, "accessibilitySystemPropertyRequest:", v11);
        }
        v17 = 1;
        goto LABEL_30;
      }
      NSLog(CFSTR("%s:%s-%d ERROR - received bogus voiceOver request"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1317);
    }
    else if (v25)
    {
      NSLog(CFSTR("%s:%s-%d ERROR - received bogus userInfo with the following error: %@"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1326, objc_msgSend(v25, "description"));
    }
    else
    {
      NSLog(CFSTR("%s:%s-%d ERROR - received bogus userInfo"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1330);
    }
    v17 = 0;
LABEL_30:
    reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      v19 = reply;
      v20 = MEMORY[0x1B5E4DB38]();
      if (v20 == v5)
      {
        xpc_dictionary_set_BOOL(v19, "sendWasSuccessful", v17);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v19);
      }
      else if (v20 == MEMORY[0x1E0C81310])
      {
        v21 = xpc_dictionary_get_value(v19, (const char *)*MEMORY[0x1E0C81270]);
        if (v21)
          v22 = xpc_string_get_string_ptr(v21);
        else
          v22 = "";
        NSLog(CFSTR("%s:%s-%d ERROR - received error: %s"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1348, v22);
      }
      else
      {
        NSLog(CFSTR("%s:%s-%d ERROR - received an unknown error.\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1352, v24);
      }
      xpc_release(v19);
    }
    objc_autoreleasePoolPop(v7);
  }
}

void ___ZL21__GetEAStringConstantPKc_block_invoke()
{
  void *v0;

  v0 = (void *)objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory"));
  __GetEAStringConstant(char const*)::eaHandle = (uint64_t)dlopen((const char *)objc_msgSend(v0, "fileSystemRepresentation"), 1);
  if (!__GetEAStringConstant(char const*)::eaHandle)
    NSLog(CFSTR("%s:%s-%d Could not load ExternalAccessory.framework from %@"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "__GetEAStringConstant_block_invoke", 1215, v0);
}

uint64_t IAPServerPort()
{
  uint64_t v0;
  BOOL v1;
  int check;
  uint64_t state64;
  int out_token;

  out_token = 0;
  state64 = 0;
  v0 = 0;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    check = 0;
    notify_check(out_token, &check);
    if (check && (notify_get_state(out_token, &state64), state64))
    {
      if (!__iapdServerPort)
      {
        pthread_mutex_lock(&__iapdServerPortLock);
        if (bootstrap_look_up(*MEMORY[0x1E0C81720], __iapdServerPortName, (mach_port_t *)&__iapdServerPort))
          v1 = 0;
        else
          v1 = (__iapdServerPort + 1) >= 2;
        if (v1)
          __iapdServerMachPort = (uint64_t)CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E0C9AE00], __iapdServerPort, 0, 0, 0);
        pthread_mutex_unlock(&__iapdServerPortLock);
        if (__iapdServerMachPort)
          CFMachPortSetInvalidationCallBack((CFMachPortRef)__iapdServerMachPort, (CFMachPortInvalidationCallBack)__invalidateIAPDServerPort);
      }
      v0 = __iapdServerPort;
    }
    else
    {
      v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IAPCheckIn()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;

  if (IAPDHasLaunched())
  {
    v0 = (_xpc_connection_s *)RetainIAPDaemonConnection();
    if (v0)
    {
      v1 = v0;
      v2 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v2, "requestType", "IAPCheckIn");
      NSLog(CFSTR("%s: send xpc message '%s' to iapd server \n"), "IAPCheckIn", "IAPCheckIn");
      v3 = _IAPSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v3)
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPCheckIn", 167);
        v8 = 0;
LABEL_23:
        xpc_release(v2);
        xpc_release(v1);
        return v8;
      }
      v4 = (void *)v3;
      v5 = MEMORY[0x1B5E4DB38]();
      if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPCheckIn received an XPC_ERROR_CONNECTION_INVALID error.\n"), v10, v11);
      }
      else if (v4 == (void *)MEMORY[0x1E0C81258] && v5 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPCheckIn received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v10, v11);
      }
      else
      {
        if (v5 == MEMORY[0x1E0C812F8])
        {
          v8 = xpc_dictionary_get_BOOL(v4, "result");
          NSLog(CFSTR("IAPCheckIn: result = %d\n"), v8);
LABEL_22:
          xpc_release(v4);
          goto LABEL_23;
        }
        if (v5 == MEMORY[0x1E0C81310])
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPCheckIn", 157);
        else
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPCheckIn", 161, v5);
      }
      v8 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

void *RetainConnectionToIAPDaemon()
{
  if (IAPDHasLaunched())
    return RetainIAPDaemonConnection();
  else
    return 0;
}

uint64_t _IAPSendXPCMessageWithTimeout(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___IAPSendXPCMessageWithTimeout_block_invoke;
  v9[3] = &unk_1E69311A0;
  v9[4] = &v10;
  _IAPSendXPCMessageReplyWithTimeout(a1, a2, a3, global_queue, (uint64_t)v9);
  v7 = v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1B563EBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL iaptransportdHasLaunched()
{
  _BOOL8 v0;
  int check;
  uint64_t state64;
  int out_token;

  out_token = 0;
  state64 = 0;
  v0 = 0;
  if (!notify_register_check("com.apple.iaptransportd.notify.availability", &out_token))
  {
    check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      v0 = state64 != 0;
    }
    else
    {
      v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IsIAPDaemonConnection(uint64_t a1)
{
  BOOL v1;

  if (a1)
    v1 = __iapd_connection == 0;
  else
    v1 = 1;
  return !v1 && __iapd_connection == a1;
}

BOOL IsIAP2DaemonConnection(uint64_t a1)
{
  BOOL v1;

  if (a1)
    v1 = __iap2d_connection == 0;
  else
    v1 = 1;
  return !v1 && __iap2d_connection == a1;
}

uint64_t GetIAPTransportDaemonConnection(void)
{
  uint64_t IAPTransportDaemonConnection;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAPTransportDaemonConnection = _GetIAPTransportDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPTransportDaemonConnection;
}

uint64_t __IAPConnectionMutexLock(void)
{
  return pthread_mutex_lock(&__iapConnectionMutex);
}

uint64_t _GetIAPTransportDaemonConnection(void)
{
  NSObject *v0;
  _xpc_connection_s *mach_service;

  if (!__iaptransportd_connection)
  {
    v0 = __iaptransportdConnectionQ;
    if (!__iaptransportdConnectionQ)
    {
      v0 = dispatch_queue_create("iaptransportdConnectionQueue", 0);
      __iaptransportdConnectionQ = (uint64_t)v0;
    }
    mach_service = xpc_connection_create_mach_service("com.apple.iaptransportd.xpc", v0, 0);
    __iaptransportd_connection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_92);
      xpc_connection_resume((xpc_connection_t)__iaptransportd_connection);
    }
    else
    {
      NSLog(CFSTR("No connection made!\n"));
      dispatch_release((dispatch_object_t)__iaptransportdConnectionQ);
      __iaptransportdConnectionQ = 0;
    }
  }
  return __iaptransportd_connection;
}

uint64_t __IAPConnectionMutexUnlock(void)
{
  return pthread_mutex_unlock(&__iapConnectionMutex);
}

void *RetainIAPTransportDaemonConnection(void)
{
  void *IAPTransportDaemonConnection;
  void *v1;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAPTransportDaemonConnection = (void *)_GetIAPTransportDaemonConnection();
  v1 = IAPTransportDaemonConnection;
  if (IAPTransportDaemonConnection)
    xpc_retain(IAPTransportDaemonConnection);
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

uint64_t GetIAPConnectionQueue(void)
{
  if (GetIAPConnectionQueue(void)::once != -1)
    dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
  return __iAPConnectionQ;
}

dispatch_queue_t ___Z21GetIAPConnectionQueuev_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("iAPConnectionQueue", 0);
  __iAPConnectionQ = (uint64_t)result;
  return result;
}

uint64_t GetIAPDaemonConnection(void)
{
  uint64_t IAPDaemonConnection;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAPDaemonConnection = _GetIAPDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPDaemonConnection;
}

uint64_t _GetIAPDaemonConnection(void)
{
  _xpc_connection_s *mach_service;

  if (!__iapd_connection)
  {
    if (IAPDHasLaunched())
    {
      if (GetIAPConnectionQueue(void)::once != -1)
        dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
      mach_service = xpc_connection_create_mach_service("com.apple.iapd.xpc", (dispatch_queue_t)__iAPConnectionQ, 0);
      __iapd_connection = (uint64_t)mach_service;
      if (mach_service)
      {
        xpc_connection_set_event_handler(mach_service, &__block_literal_global_106);
        xpc_connection_resume((xpc_connection_t)__iapd_connection);
      }
      else
      {
        NSLog(CFSTR("No connection to iapd made!\n"));
      }
    }
    else
    {
      NSLog(CFSTR("iapd not launched!\n"));
    }
  }
  return __iapd_connection;
}

uint64_t GetIAP2DaemonConnection(void)
{
  uint64_t IAP2DaemonConnection;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAP2DaemonConnection = _GetIAP2DaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAP2DaemonConnection;
}

uint64_t _GetIAP2DaemonConnection(void)
{
  _xpc_connection_s *mach_service;

  if (!__iap2d_connection)
  {
    if (IAP2DHasLaunched())
    {
      if (GetIAPConnectionQueue(void)::once != -1)
        dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
      mach_service = xpc_connection_create_mach_service("com.apple.iap2d.xpc", (dispatch_queue_t)__iAPConnectionQ, 0);
      __iap2d_connection = (uint64_t)mach_service;
      if (mach_service)
      {
        xpc_connection_set_event_handler(mach_service, &__block_literal_global_137);
        xpc_connection_resume((xpc_connection_t)__iap2d_connection);
      }
      else
      {
        NSLog(CFSTR("No connection to iap2d made!\n"));
      }
    }
    else
    {
      NSLog(CFSTR("iapd not launched!\n"));
    }
  }
  return __iap2d_connection;
}

uint64_t GetConnectionToIAPTransportDaemon()
{
  uint64_t IAPTransportDaemonConnection;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAPTransportDaemonConnection = _GetIAPTransportDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPTransportDaemonConnection;
}

uint64_t GetConnectionToIAPDaemon()
{
  uint64_t IAPDaemonConnection;

  if (!IAPDHasLaunched())
    return 0;
  pthread_mutex_lock(&__iapConnectionMutex);
  IAPDaemonConnection = _GetIAPDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPDaemonConnection;
}

uint64_t GetConnectionToIAP2Daemon()
{
  uint64_t IAP2DaemonConnection;

  if (!IAP2DHasLaunched())
    return 0;
  pthread_mutex_lock(&__iapConnectionMutex);
  IAP2DaemonConnection = _GetIAP2DaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAP2DaemonConnection;
}

_xpc_connection_s *GetConnectionToIAPDaemonOwningPhysicalConnector(_DWORD *a1)
{
  _xpc_connection_s *ConnectionToIAPDaemon;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (a1)
    *a1 = 2;
  ConnectionToIAPDaemon = (_xpc_connection_s *)GetConnectionToIAPDaemon();
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "requestType", "OwnsPhysicalConnector");
  if (ConnectionToIAPDaemon)
  {
    NSLog(CFSTR("%s: send xpc message '%s' to iapd server \n"), "GetConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
    v4 = _IAPSendXPCMessageWithTimeout(ConnectionToIAPDaemon, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = MEMORY[0x1B5E4DB38]();
      if (v5 == (void *)MEMORY[0x1E0C81260] && v6 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v5 == (void *)MEMORY[0x1E0C81258] && v6 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v6 == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(v5, "result"))
      {
        xpc_release(v5);
        xpc_release(v3);
        if (a1)
          *a1 = 0;
        return ConnectionToIAPDaemon;
      }
      xpc_release(v5);
    }
    else
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "GetConnectionToIAPDaemonOwningPhysicalConnector", 980);
    }
  }
  ConnectionToIAPDaemon = (_xpc_connection_s *)GetConnectionToIAP2Daemon();
  if (!ConnectionToIAPDaemon)
  {
LABEL_39:
    xpc_release(v3);
    return ConnectionToIAPDaemon;
  }
  NSLog(CFSTR("%s: send xpc message '%s' to iap2d server \n"), "GetConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
  v9 = _IAPSendXPCMessageWithTimeout(ConnectionToIAPDaemon, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v9)
  {
    NSLog(CFSTR("%s:%d No reply received for message!"), "GetConnectionToIAPDaemonOwningPhysicalConnector", 1022);
    goto LABEL_39;
  }
  v10 = (void *)v9;
  v11 = MEMORY[0x1B5E4DB38]();
  if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("iap2d PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INVALID error.\n"));
LABEL_38:
    xpc_release(v10);
    goto LABEL_39;
  }
  if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("iap2d PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    goto LABEL_38;
  }
  if (v11 != MEMORY[0x1E0C812F8] || !xpc_dictionary_get_BOOL(v10, "result"))
    goto LABEL_38;
  xpc_release(v10);
  xpc_release(v3);
  if (a1)
    *a1 = 1;
  return ConnectionToIAPDaemon;
}

uint64_t GetConnectionToIAPDaemonWithConnectionID(int a1, int *a2)
{
  uint64_t result;
  int v4;

  if (a2)
    *a2 = 2;
  if ((~a1 & 0x1000000) == 0)
  {
    result = GetConnectionToIAPDaemon();
    if (!a2)
      return result;
    v4 = 0;
LABEL_9:
    *a2 = v4;
    return result;
  }
  if ((~a1 & 0x2000000) == 0)
  {
    result = GetConnectionToIAP2Daemon();
    if (!a2)
      return result;
    v4 = 1;
    goto LABEL_9;
  }
  return 0;
}

_xpc_connection_s *GetConnectionToIAPDaemonByCheckingConnectionID(unsigned int a1, _DWORD *a2)
{
  xpc_object_t v4;
  uint64_t ConnectionToIAPDaemon;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v12;
  _xpc_connection_s *v13;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "requestType", "OwnsConnectionID");
  xpc_dictionary_set_uint64(v4, "connectionID", a1);
  if (a2)
    *a2 = 2;
  if ((a1 & 0x1000000) == 0x1000000)
  {
    ConnectionToIAPDaemon = GetConnectionToIAPDaemon();
  }
  else
  {
    if ((~a1 & 0x2000000) != 0)
    {
      v6 = 0;
      goto LABEL_31;
    }
    ConnectionToIAPDaemon = GetConnectionToIAP2Daemon();
  }
  v6 = (_xpc_connection_s *)ConnectionToIAPDaemon;
  if (ConnectionToIAPDaemon)
  {
    NSLog(CFSTR("%s: send xpc message '%s' to iapd server \n"), "GetConnectionToIAPDaemonByCheckingConnectionID", "OwnsConnectionID");
    v7 = _IAPSendXPCMessageWithTimeout(v6, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v7)
    {
      v8 = (void *)v7;
      v9 = MEMORY[0x1B5E4DB38]();
      if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd GetConnectionToIAPDaemonByCheckingConnectionID received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd GetConnectionToIAPDaemonByCheckingConnectionID received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v9 == MEMORY[0x1E0C812F8])
      {
        v12 = xpc_dictionary_get_BOOL(v8, "result");
        if (v12)
          v13 = v6;
        else
          v13 = 0;
        if (!a2 || !v12)
          goto LABEL_30;
        if ((a1 & 0x1000000) == 0x1000000)
        {
          *a2 = 0;
        }
        else if ((~a1 & 0x2000000) == 0)
        {
          *a2 = 1;
        }
      }
      v13 = v6;
LABEL_30:
      xpc_release(v8);
      v6 = v13;
      goto LABEL_31;
    }
    NSLog(CFSTR("%s:%d No reply received for message!"), "GetConnectionToIAPDaemonByCheckingConnectionID", 1129);
  }
LABEL_31:
  xpc_release(v4);
  return v6;
}

void *RetainIAPDaemonConnection(void)
{
  void *IAPDaemonConnection;
  void *v1;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAPDaemonConnection = (void *)_GetIAPDaemonConnection();
  v1 = IAPDaemonConnection;
  if (IAPDaemonConnection)
    xpc_retain(IAPDaemonConnection);
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

void *RetainIAP2DaemonConnection(void)
{
  void *IAP2DaemonConnection;
  void *v1;

  pthread_mutex_lock(&__iapConnectionMutex);
  IAP2DaemonConnection = (void *)_GetIAP2DaemonConnection();
  v1 = IAP2DaemonConnection;
  if (IAP2DaemonConnection)
    xpc_retain(IAP2DaemonConnection);
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

void *RetainConnectionToIAP2Daemon()
{
  if (IAP2DHasLaunched())
    return RetainIAP2DaemonConnection();
  else
    return 0;
}

_xpc_connection_s *RetainConnectionToIAPDaemonOwningPhysicalConnector(_DWORD *a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1)
    *a1 = 2;
  if (IAPDHasLaunched())
    v2 = (_xpc_connection_s *)RetainIAPDaemonConnection();
  else
    v2 = 0;
  NSLog(CFSTR("%s: iapd connection %d"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", v2 != 0);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "requestType", "OwnsPhysicalConnector");
  if (v2)
  {
    NSLog(CFSTR("%s: send xpc message '%s' to iapd server \n"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
    v4 = _IAPSendXPCMessageWithTimeout(v2, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = MEMORY[0x1B5E4DB38]();
      if (v5 == (void *)MEMORY[0x1E0C81260] && v6 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INVALID error.\n"), v13, v15);
      }
      else if (v5 == (void *)MEMORY[0x1E0C81258] && v6 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("iapd PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v13, v15);
      }
      else if (v6 == MEMORY[0x1E0C812F8])
      {
        if (xpc_dictionary_get_BOOL(v5, "result"))
        {
          xpc_release(v5);
          xpc_release(v3);
          if (a1)
          {
            v11 = 0;
            *a1 = 0;
LABEL_50:
            NSLog(CFSTR("%s: daemonType %d, connection %d"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", v11, 1);
            return v2;
          }
LABEL_49:
          v11 = 0xFFFFFFFFLL;
          goto LABEL_50;
        }
      }
      else if (v6 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1251);
      }
      else
      {
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1255, v6);
      }
      xpc_release(v5);
    }
    else
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1261);
    }
  }
  else
  {
    NSLog(CFSTR("%s:%d no connection to iapd!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1266);
  }
  if (!IAP2DHasLaunched())
  {
    NSLog(CFSTR("%s: iap2d connection %d"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 0);
    goto LABEL_27;
  }
  v2 = (_xpc_connection_s *)RetainIAP2DaemonConnection();
  NSLog(CFSTR("%s: iap2d connection %d"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", v2 != 0);
  if (!v2)
  {
LABEL_27:
    NSLog(CFSTR("%s:%d no connection to iap2d!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1324);
    v2 = 0;
    goto LABEL_47;
  }
  NSLog(CFSTR("%s: send xpc message '%s' to iap2d server \n"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
  v8 = _IAPSendXPCMessageWithTimeout(v2, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = MEMORY[0x1B5E4DB38]();
    if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("iap2d PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INVALID error.\n"), v14, v16, v17);
      goto LABEL_46;
    }
    if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("iap2d PhysicalConnectorOwnership received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v14, v16, v17);
      goto LABEL_46;
    }
    if (v10 != MEMORY[0x1E0C812F8])
    {
      if (v10 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1309, v17);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1313, v10);
      goto LABEL_46;
    }
    if (!xpc_dictionary_get_BOOL(v9, "result"))
    {
LABEL_46:
      xpc_release(v9);
      goto LABEL_47;
    }
    xpc_release(v9);
    xpc_release(v3);
    if (a1)
    {
      v11 = 1;
      *a1 = 1;
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  NSLog(CFSTR("%s:%d No reply received for message!"), "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1319);
LABEL_47:
  xpc_release(v3);
  return v2;
}

void *RetainConnectionToIAPDaemonWithConnectionID(int a1, int *a2)
{
  void *result;
  int v4;

  if (a2)
    *a2 = 2;
  if ((~a1 & 0x1000000) == 0)
  {
    if (IAPDHasLaunched())
    {
      result = RetainIAPDaemonConnection();
      if (!a2)
        return result;
    }
    else
    {
      result = 0;
      if (!a2)
        return result;
    }
    v4 = 0;
LABEL_16:
    *a2 = v4;
    return result;
  }
  if ((~a1 & 0x2000000) != 0)
    return 0;
  if (!IAP2DHasLaunched())
  {
    result = 0;
    if (!a2)
      return result;
    goto LABEL_15;
  }
  result = RetainIAP2DaemonConnection();
  if (a2)
  {
LABEL_15:
    v4 = 1;
    goto LABEL_16;
  }
  return result;
}

void *RetainConnectionToIAPDOnlyWithConnectionID(int a1, _DWORD *a2)
{
  void *result;

  if (a2)
    *a2 = 2;
  if ((~a1 & 0x1000000) != 0)
    return 0;
  if (!IAPDHasLaunched())
  {
    result = 0;
    if (!a2)
      return result;
    goto LABEL_9;
  }
  result = RetainIAPDaemonConnection();
  if (a2)
LABEL_9:
    *a2 = 0;
  return result;
}

_xpc_connection_s *RetainConnectionToIAPDaemonByCheckingConnectionID(uint64_t a1, _DWORD *a2)
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  _xpc_connection_s *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "requestType", "OwnsConnectionID");
  xpc_dictionary_set_uint64(v4, "connectionID", a1);
  if (a2)
    *a2 = 2;
  if ((a1 & 0x1000000) == 0x1000000)
  {
    if (IAPDHasLaunched())
    {
      v5 = (_xpc_connection_s *)RetainIAPDaemonConnection();
LABEL_9:
      v6 = v5;
      goto LABEL_11;
    }
  }
  else if ((~(_DWORD)a1 & 0x2000000) == 0 && IAP2DHasLaunched())
  {
    v5 = (_xpc_connection_s *)RetainIAP2DaemonConnection();
    goto LABEL_9;
  }
  v6 = 0;
LABEL_11:
  NSLog(CFSTR("%s: connectionID %x (%d) / %x / %x, connection %d"), "RetainConnectionToIAPDaemonByCheckingConnectionID", a1, a1, 0x1000000, 0x2000000, v6 != 0);
  if (!v6)
    goto LABEL_33;
  NSLog(CFSTR("%s: send xpc message '%s' to iapd server \n"), "RetainConnectionToIAPDaemonByCheckingConnectionID", "OwnsConnectionID");
  v7 = _IAPSendXPCMessageWithTimeout(v6, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v7)
  {
    NSLog(CFSTR("%s:%d No reply received for message!"), "RetainConnectionToIAPDaemonByCheckingConnectionID", 1462);
    goto LABEL_33;
  }
  v8 = (void *)v7;
  v9 = MEMORY[0x1B5E4DB38]();
  if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("iapd RetainConnectionToIAPDaemonByCheckingConnectionID received an XPC_ERROR_CONNECTION_INVALID error.\n"), v14, v15, v16);
  }
  else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("iapd RetainConnectionToIAPDaemonByCheckingConnectionID received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v14, v15, v16);
  }
  else if (v9 == MEMORY[0x1E0C812F8])
  {
    v10 = xpc_dictionary_get_BOOL(v8, "result");
    if (v10)
      v11 = v6;
    else
      v11 = 0;
    if (!a2 || !v10)
      goto LABEL_32;
    if ((a1 & 0x1000000) == 0x1000000)
    {
      *a2 = 0;
    }
    else if ((~(_DWORD)a1 & 0x2000000) == 0)
    {
      *a2 = 1;
    }
  }
  else if (v9 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("%s:%d Unhandled reply error!"), "RetainConnectionToIAPDaemonByCheckingConnectionID", 1452, v16);
  }
  else
  {
    NSLog(CFSTR("%s:%d Unknown reply type %p!"), "RetainConnectionToIAPDaemonByCheckingConnectionID", 1456, v9);
  }
  v11 = v6;
LABEL_32:
  xpc_release(v8);
  v6 = v11;
LABEL_33:
  xpc_release(v4);
  if (a2)
    v12 = *a2;
  else
    v12 = 0xFFFFFFFFLL;
  NSLog(CFSTR("%s: connectionID %d, connection %d, daemonType %d"), "RetainConnectionToIAPDaemonByCheckingConnectionID", a1, v6 != 0, v12);
  return v6;
}

uint64_t _IAPSendXPCMessageReplyWithTimeout(_xpc_connection_s *a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  const char *string;
  const char *v11;
  NSObject *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  void *v19;
  dispatch_time_t v20;
  double v21;
  _QWORD handler[8];

  pthread_mutex_lock(&__iapConnectionMutex);
  if (a5)
  {
    if (!a1)
    {
LABEL_25:
      syslog(3, "%s: connection does not match one of the existing ones!!!", "_IAPSendXPCMessageReplyWithTimeout");
LABEL_26:
      (*(void (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
      return pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else
  {
    string = xpc_dictionary_get_string(a2, "requestType");
    v11 = "unknown";
    if (string)
      v11 = string;
    syslog(3, "%s: replyHandler not provided for '%s'!", "_IAPSendXPCMessageReplyWithTimeout", v11);
    if (!a1)
      goto LABEL_25;
  }
  if ((_xpc_connection_s *)__iapd_connection != a1
    && __iap2d_connection != (_QWORD)a1
    && __iaptransportd_connection != (_QWORD)a1)
  {
    goto LABEL_25;
  }
  if (!a2 || !a5)
  {
    NSLog(CFSTR("%s: one of connection(%d)/message(%d)/replyHandler(%d) is nil!"), "_IAPSendXPCMessageReplyWithTimeout", 1, a2 != 0, a5 != 0);
    if (!a5)
      return pthread_mutex_unlock(&__iapConnectionMutex);
    goto LABEL_26;
  }
  v14 = dispatch_semaphore_create(0);
  v15 = xpc_dictionary_get_string(a2, "requestType");
  v16 = "unknown";
  if (v15)
    v17 = v15;
  else
    v17 = "unknown";
  if ((_xpc_connection_s *)__iapd_connection == a1)
  {
    v16 = "iapd";
  }
  else if ((_xpc_connection_s *)__iap2d_connection == a1)
  {
    v16 = "iap2d";
  }
  else if ((_xpc_connection_s *)__iaptransportd_connection == a1)
  {
    v16 = "iaptransportd";
  }
  NSLog(CFSTR("%s: send xpc message '%s' to %s server, tryLeft %d \n"), "_IAPSendXPCMessageReplyWithTimeout", v17, v16, 0);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___IAPSendXPCMessageReplyWithTimeout_block_invoke;
  handler[3] = &unk_1E6931178;
  handler[4] = a2;
  handler[5] = a1;
  handler[6] = v14;
  handler[7] = a5;
  xpc_connection_send_message_with_reply(a1, a2, a4, handler);
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  if (a3)
    v20 = dispatch_time(0, 1000000 * a3);
  else
    v20 = -1;
  if (dispatch_semaphore_wait(v14, v20))
  {
    syslog(3, "%s: xpc_connection_send_message_with_reply did not reply within %d ms. Timeout has occurred, tryLeft %d", "_IAPSendXPCMessageReplyWithTimeout", a3, 0);
    (*(void (**)(uint64_t, _QWORD))(a5 + 16))(a5, 0);
  }
  else
  {
    objc_msgSend(v19, "timeIntervalSinceNow");
    syslog(6, "%s: xpc_connection_send_message_with_reply reply in %lu ms.", "_IAPSendXPCMessageReplyWithTimeout", (v21 * 1000.0));
  }
  dispatch_release(v14);
  return pthread_mutex_unlock(&__iapConnectionMutex);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __invalidateIAPDServerPort(__CFMachPort *a1, void *a2)
{
  __CFNotificationCenter *LocalCenter;

  pthread_mutex_lock(&__iapdServerPortLock);
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], __iapdServerPort);
  __iapdServerPort = 0;
  CFRelease((CFTypeRef)__iapdServerMachPort);
  __iapdServerMachPort = 0;
  pthread_mutex_unlock(&__iapdServerPortLock);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kIAPDServerDiedNotification"), 0, 0, 1u);
}

void ___ZL32_GetIAPTransportDaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  const void *data;
  const char *v5;
  const char *v6;
  IAPClientPortManager *v7;
  uint64_t v8;
  __CFNotificationCenter *LocalCenter;
  size_t length;

  if (MEMORY[0x1B5E4DB38](a2) == MEMORY[0x1E0C81310])
  {
    if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
    {
      pthread_mutex_lock(&__iapConnectionMutex);
      if (__iaptransportd_connection)
      {
        NSLog(CFSTR("%s Cleanup connection! "), "_xpc_iaptransportd_handle_message");
        xpc_connection_cancel((xpc_connection_t)__iaptransportd_connection);
        xpc_release((xpc_object_t)__iaptransportd_connection);
        __iaptransportd_connection = 0;
        NSLog(CFSTR("%s Notify iaptransportd server died! "), "_xpc_iaptransportd_handle_message");
        LocalCenter = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(LocalCenter, CFSTR("kIAPTransportServerDiedNotification"), 0, 0, 1u);
      }
      pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else if (MEMORY[0x1B5E4DB38](a2) == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(CFSTR("RequestType not specified in xpc message!"));
      string = "<nil>";
    }
    if (!strcmp(string, "transmitData"))
    {
      length = 0;
      data = xpc_dictionary_get_data(a2, "data", &length);
      v5 = xpc_dictionary_get_string(a2, "IAPClientPortUUIDStr");
      if (v5 && data)
      {
        v6 = v5;
        v7 = +[IAPClientPortManager sharedInstance](IAPClientPortManager, "sharedInstance");
        v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        -[IAPClientPortManager sendData:data:length:](v7, "sendData:data:length:", v8, data, (unsigned __int16)length);
      }
      else
      {
        NSLog(CFSTR("_xpc_iaptransportd_handle_message handling kXPCTransmitDataStr error\n"));
      }
    }
  }
}

void ___ZL23_GetIAPDaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  int uint64;
  int v10;
  const void *data;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t state64;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  size_t length;

  if (MEMORY[0x1B5E4DB38](a2) != MEMORY[0x1E0C81310])
  {
    if (MEMORY[0x1B5E4DB38](a2) != MEMORY[0x1E0C812F8])
      return;
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(CFSTR("RequestType not specified in xpc message!"));
      string = "<nil>";
    }
    if (!strcmp(string, "eaNotifyAppOfSessionClose"))
    {
      uint64 = xpc_dictionary_get_uint64(a2, "connectionID");
      v10 = xpc_dictionary_get_uint64(a2, "eaSessionID");
      IAPAppNotifyAppOfSessionClose(uint64, v10);
      return;
    }
    if (!strcmp(string, "EAProtocolAccessoryConnected"))
    {
      v32 = 0;
      length = 0;
      data = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
    }
    else if (!strcmp(string, "EAProtocolAccessoryDisconnected"))
    {
      v32 = 0;
      length = 0;
      v13 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3;
    }
    else if (!strcmp(string, "EAProtocolAccessoryReconnected"))
    {
      v32 = 0;
      length = 0;
      v15 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v16 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4;
    }
    else
    {
      if (!strcmp(string, "kXPCACCNotificationKey"))
      {
        NSLog(CFSTR("%s handling kXPCACCNotificationKey"), "_xpc_iapd_handle_message");
        v17 = xpc_dictionary_get_string(a2, "kXPCACCNotificationNameKey");
        if (!v17)
        {
          NSLog(CFSTR("%s: received nil arg. notificationNameFromXPCMessage %@"), "_xpc_iapd_handle_message", 0);
          return;
        }
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
        if (!v18)
        {
          NSLog(CFSTR("%s Error when converting notificationNameFromXPCMessage"), "_xpc_iapd_handle_message");
          return;
        }
        v19 = v18;
        NSLog(CFSTR("%s received notificationName %@ to post locally"), "_xpc_iapd_handle_message", v18);
        length = 0;
        v20 = xpc_dictionary_get_data(a2, "kXPCACCNotificationPlistData", &length);
        if (v20)
        {
          v21 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, length);
          if (!v21)
          {
            NSLog(CFSTR("%s Error when creating accessoryPlistData"), "_xpc_iapd_handle_message", v25);
            return;
          }
          v32 = 0;
          v22 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v21, 0, 0, &v32);
          if (!v22)
          {
            NSLog(CFSTR("%s Error when creating accessoryPlist! Got: %@"), "_xpc_iapd_handle_message", objc_msgSend(v32, "localizedDescription"));
            return;
          }
          state64 = MEMORY[0x1E0C809B0];
          v27 = 3221225472;
          v28 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5;
          v29 = &unk_1E6931250;
          v30 = v19;
          v31 = v22;
        }
        else
        {
          state64 = MEMORY[0x1E0C809B0];
          v27 = 3221225472;
          v28 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6;
          v29 = &unk_1E6931228;
          v30 = v19;
        }
        goto LABEL_39;
      }
      if (!strcmp(string, "EAProtocolAccessoryUpdated"))
      {
        v32 = 0;
        length = 0;
        v23 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        v24 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, length);
        v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v24, 0, 0, &v32);
        state64 = MEMORY[0x1E0C809B0];
        v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7;
      }
      else
      {
        if (strcmp(string, "EAProtocolAccessoryPortPropertyChanged"))
          return;
        v32 = 0;
        length = 0;
        v4 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, length);
        v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v32);
        state64 = MEMORY[0x1E0C809B0];
        v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8;
      }
    }
    v27 = 3221225472;
    v28 = v7;
    v29 = &unk_1E6931228;
    v30 = v6;
LABEL_39:
    dispatch_async(MEMORY[0x1E0C80D38], &state64);
    return;
  }
  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      NSLog(CFSTR("%s CONNECTION_INTERRUPTED! "), "_xpc_iapd_handle_message");
      LODWORD(length) = 0;
      if (!notify_register_check("com.apple.iapd.notify.availability", (int *)&length))
      {
        state64 = 0;
        notify_get_state(length, &state64);
        if (state64 == 1)
        {
          notify_set_state(length, 0);
          notify_post("com.apple.iapd.notify.availability");
        }
        notify_cancel(length);
      }
    }
    else
    {
      NSLog(CFSTR("%s CONNECTION_INVALID! "), "_xpc_iapd_handle_message");
    }
    pthread_mutex_lock(&__iapConnectionMutex);
    if (__iapd_connection)
    {
      NSLog(CFSTR("%s Cleanup connection! "), "_xpc_iapd_handle_message");
      xpc_connection_cancel((xpc_connection_t)__iapd_connection);
      xpc_release((xpc_object_t)__iapd_connection);
      __iapd_connection = 0;
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_113);
    }
    pthread_mutex_unlock(&__iapConnectionMutex);
  }
}

void ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  NSLog(CFSTR("%s Notify iapd server died! "), "_xpc_iapd_handle_message_block_invoke");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kIAPDServerDiedNotification"), 0, 0, 1u);
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryDidConnectNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryDidDisconnectNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppReconnectAccessory"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5(uint64_t a1)
{
  NSLog(CFSTR("Posting notificationNameNS = %@ accessoryPlist = %@!"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6(uint64_t a1)
{
  NSLog(CFSTR("Posting notificationNameNS = %@ with no payload"), *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryUpdatedNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryPortPropertyChangedNotification"), 0, *(_QWORD *)(a1 + 32));
}

void ___ZL24_GetIAP2DaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  int uint64;
  int v10;
  const void *data;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t state64;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  size_t length;

  if (MEMORY[0x1B5E4DB38](a2) != MEMORY[0x1E0C81310])
  {
    if (MEMORY[0x1B5E4DB38](a2) != MEMORY[0x1E0C812F8])
      return;
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(CFSTR("RequestType not specified in xpc message!"));
      string = "<nil>";
    }
    if (!strcmp(string, "eaNotifyAppOfSessionClose"))
    {
      uint64 = xpc_dictionary_get_uint64(a2, "connectionID");
      v10 = xpc_dictionary_get_uint64(a2, "eaSessionID");
      IAPAppNotifyAppOfSessionClose(uint64, v10);
      return;
    }
    if (!strcmp(string, "EAProtocolAccessoryConnected"))
    {
      v32 = 0;
      length = 0;
      data = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v12 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
    }
    else if (!strcmp(string, "EAProtocolAccessoryDisconnected"))
    {
      v32 = 0;
      length = 0;
      v13 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v14 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3;
    }
    else if (!strcmp(string, "EAProtocolAccessoryReconnected"))
    {
      v32 = 0;
      length = 0;
      v15 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
      v16 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, length);
      v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, 0, &v32);
      state64 = MEMORY[0x1E0C809B0];
      v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4;
    }
    else
    {
      if (!strcmp(string, "kXPCACCNotificationKey"))
      {
        NSLog(CFSTR("%s handling kXPCACCNotificationKey"), "_xpc_iap2d_handle_message");
        v17 = xpc_dictionary_get_string(a2, "kXPCACCNotificationNameKey");
        if (!v17)
        {
          NSLog(CFSTR("%s: received nil arg. notificationNameFromXPCMessage %@"), "_xpc_iap2d_handle_message", 0);
          return;
        }
        v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
        if (!v18)
        {
          NSLog(CFSTR("%s Error when converting notificationNameFromXPCMessage"), "_xpc_iap2d_handle_message");
          return;
        }
        v19 = v18;
        NSLog(CFSTR("%s received notificationName %@ to post locally"), "_xpc_iap2d_handle_message", v18);
        length = 0;
        v20 = xpc_dictionary_get_data(a2, "kXPCACCNotificationPlistData", &length);
        if (v20)
        {
          v21 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, length);
          if (!v21)
          {
            NSLog(CFSTR("%s Error when creating accessoryPlistData"), "_xpc_iap2d_handle_message", v25);
            return;
          }
          v32 = 0;
          v22 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v21, 0, 0, &v32);
          if (!v22)
          {
            NSLog(CFSTR("%s Error when creating accessoryPlist! Got: %@"), "_xpc_iap2d_handle_message", objc_msgSend(v32, "localizedDescription"));
            return;
          }
          state64 = MEMORY[0x1E0C809B0];
          v27 = 3221225472;
          v28 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5;
          v29 = &unk_1E6931250;
          v30 = v19;
          v31 = v22;
        }
        else
        {
          state64 = MEMORY[0x1E0C809B0];
          v27 = 3221225472;
          v28 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6;
          v29 = &unk_1E6931228;
          v30 = v19;
        }
        goto LABEL_39;
      }
      if (!strcmp(string, "EAProtocolAccessoryUpdated"))
      {
        v32 = 0;
        length = 0;
        v23 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        v24 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, length);
        v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v24, 0, 0, &v32);
        state64 = MEMORY[0x1E0C809B0];
        v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7;
      }
      else
      {
        if (strcmp(string, "EAProtocolAccessoryPortPropertyChanged"))
          return;
        v32 = 0;
        length = 0;
        v4 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, length);
        v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v32);
        state64 = MEMORY[0x1E0C809B0];
        v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8;
      }
    }
    v27 = 3221225472;
    v28 = v7;
    v29 = &unk_1E6931228;
    v30 = v6;
LABEL_39:
    dispatch_async(MEMORY[0x1E0C80D38], &state64);
    return;
  }
  if (a2 == (void *)MEMORY[0x1E0C81258] || a2 == (void *)MEMORY[0x1E0C81260])
  {
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      NSLog(CFSTR("%s CONNECTION_INTERRUPTED! "), "_xpc_iap2d_handle_message");
      LODWORD(length) = 0;
      if (!notify_register_check("com.apple.iap2d.notify.availability", (int *)&length))
      {
        state64 = 0;
        notify_get_state(length, &state64);
        if (state64 == 1)
        {
          notify_set_state(length, 0);
          notify_post("com.apple.iap2d.notify.availability");
        }
        notify_cancel(length);
      }
    }
    else
    {
      NSLog(CFSTR("%s CONNECTION_INVALID! "), "_xpc_iap2d_handle_message");
    }
    pthread_mutex_lock(&__iapConnectionMutex);
    if (__iap2d_connection)
    {
      NSLog(CFSTR("%s Cleanup connection! "), "_xpc_iap2d_handle_message");
      xpc_connection_cancel((xpc_connection_t)__iap2d_connection);
      xpc_release((xpc_object_t)__iap2d_connection);
      __iap2d_connection = 0;
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_138);
    }
    pthread_mutex_unlock(&__iapConnectionMutex);
  }
}

void ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  NSLog(CFSTR("%s Notify iap2d server died! "), "_xpc_iap2d_handle_message_block_invoke");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kIAP2ServerDiedNotification"), 0, 0, 1u);
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryDidConnectNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryDidDisconnectNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppReconnectAccessory"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5(uint64_t a1)
{
  NSLog(CFSTR("Posting notificationNameNS = %@ accessoryPlist = %@!"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6(uint64_t a1)
{
  NSLog(CFSTR("Posting notificationNameNS = %@ with no payload"), *(_QWORD *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", *(_QWORD *)(a1 + 32), 0, 0);
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryUpdatedNotification"), 0, *(_QWORD *)(a1 + 32));
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IAPAppAccessoryPortPropertyChangedNotification"), 0, *(_QWORD *)(a1 + 32));
}

void IAPTimeSyncSetParams(unsigned int a1, uint64_t a2, unsigned int a3)
{
  void *v6;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v6 = RetainConnectionToIAPDaemonWithConnectionID(a1, 0);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "timeSyncOffsetUncertaintyThresholdStr", a2);
    xpc_dictionary_set_uint64(v8, "timeSyncOffsetMeasurementIntervalStr", a3);
    xpc_dictionary_set_string(v8, "requestType", "timeSyncParamStr");
    v9 = IAPAppSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = MEMORY[0x1B5E4DB38]();
      if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPTimeSyncSetParams received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPTimeSyncSetParams received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v11 == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_BOOL(v10, "result"))
          NSLog(CFSTR("ERROR - %s failed.\n"), "IAPTimeSyncSetParams");
      }
      else if (v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPTimeSyncSetParams", 50);
      }
      else
      {
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPTimeSyncSetParams", 54, v11);
      }
      xpc_release(v10);
    }
    else
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPTimeSyncSetParams", 60);
    }
    xpc_release(v8);
    xpc_release(v7);
  }
}

void IAPTimeSyncGetInfo(unsigned int a1, NSObject *a2, uint64_t a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  _QWORD v9[6];

  v6 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "timeSyncInfoStr");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    dispatch_retain(a2);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __IAPTimeSyncGetInfo_block_invoke;
    v9[3] = &unk_1E69312E0;
    v9[4] = a2;
    v9[5] = a3;
    IAPAppSendXPCMessageReplyWithTimeout(v7, v8, a2, __IAPAppSendXPCMessageDefaultTimeoutMs, (uint64_t)v9);
    xpc_release(v8);
    xpc_release(v7);
  }
}

void IAPTimeSyncResetKalmanFilter(unsigned int a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v2 = RetainConnectionToIAPDaemonWithConnectionID(a1, 0);
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    xpc_dictionary_set_string(v4, "requestType", "timeSyncResetKalmanFilterStr");
    v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v5)
    {
      v6 = (void *)v5;
      v7 = MEMORY[0x1B5E4DB38]();
      if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPTimeSyncResetKalmanFilter received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPTimeSyncResetKalmanFilter received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v7 == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_BOOL(v6, "result"))
          NSLog(CFSTR("ERROR - %s failed.\n"), "IAPTimeSyncResetKalmanFilter");
      }
      else if (v7 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPTimeSyncResetKalmanFilter", 156);
      }
      else
      {
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPTimeSyncResetKalmanFilter", 160, v7);
      }
      xpc_release(v6);
    }
    else
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPTimeSyncResetKalmanFilter", 166);
    }
    xpc_release(v4);
    xpc_release(v3);
  }
}

uint64_t IAPCameraSendCameraControlMessage(unsigned int a1, uint64_t a2, unsigned int a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  const char *v8;
  xpc_object_t v9;
  void *v10;
  int v12;

  v12 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v12);
  if (v6)
  {
    v7 = v6;
    if (a3 <= 4)
    {
      v8 = off_1E6931340[a3];
      v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v9, "requestType", v8);
      xpc_dictionary_set_uint64(v9, "connectionID", a1);
      v10 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
      xpc_dictionary_set_data(v9, "IAPCameraIds", (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      xpc_connection_send_message(v7, v9);
      xpc_release(v9);
    }
    xpc_release(v7);
  }
  return 0;
}

uint64_t IAPCameraSendStartLivePreview(unsigned int a1, uint64_t a2, unsigned int a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v9;
  int v11;

  v11 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v11);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPCameraSendStartLivePreview");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
    xpc_dictionary_set_data(v8, "IAPCameraIds", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    xpc_dictionary_set_uint64(v8, "IAPCameraLivePreviewFormatIndexStr", a3);
    xpc_connection_send_message(v7, v8);
    xpc_release(v8);
    xpc_release(v7);
  }
  return 0;
}

uint64_t IAPCameraSendStartCameraUpdates(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;

  v15 = 2;
  v8 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v15);
  if (v8)
  {
    v9 = v8;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "requestType", "IAPCameraSendStartCameraUpdates");
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0);
    xpc_dictionary_set_data(v10, "IAPCameraIds", (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
    xpc_dictionary_set_data(v10, "IAPCameraProperties", (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a4, 200, 0, 0);
    xpc_dictionary_set_data(v10, "IAPCameraCapabilities", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    xpc_connection_send_message(v9, v10);
    xpc_release(v10);
    xpc_release(v9);
  }
  return 0;
}

uint64_t IAPCameraSendSetCameraProperties(unsigned int a1, unsigned int a2, uint64_t a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v9;
  int v11;

  v11 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v11);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPCameraSendSetCameraProperties");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "IAPCameraId", a2);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, 0);
    xpc_dictionary_set_data(v8, "IAPCameraProperties", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    xpc_connection_send_message(v7, v8);
    xpc_release(v8);
    xpc_release(v7);
  }
  return 0;
}

BOOL IAPAccessoryEQSelectEqualizerAtIndex(unsigned int a1, unsigned int a2)
{
  void *v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v12;

  if (IAPDHasLaunched())
  {
    v4 = RetainConnectionToIAPDaemon();
    if (v4)
    {
      v5 = v4;
      v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v6, "connectionID", a1);
      xpc_dictionary_set_uint64(v6, "eqIndex", a2);
      xpc_dictionary_set_string(v6, "requestType", "IAPAccessoryEQSelectEqualizerAtIndex");
      v7 = IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v7)
      {
        NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAccessoryEQSelectEqualizerAtIndex", 60);
        v12 = 0;
LABEL_23:
        xpc_release(v6);
        xpc_release(v5);
        return v12;
      }
      v8 = (void *)v7;
      v9 = MEMORY[0x1B5E4DB38]();
      if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPAccessoryEQSelectEqualizerAtIndex received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("IAPAccessoryEQSelectEqualizerAtIndex received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else
      {
        if (v9 == MEMORY[0x1E0C812F8])
        {
          v12 = xpc_dictionary_get_BOOL(v8, "result");
          NSLog(CFSTR("IAPAccessoryEQSelectEqualizerAtIndex: result = %d\n"), v12);
LABEL_22:
          xpc_release(v8);
          goto LABEL_23;
        }
        if (v9 == MEMORY[0x1E0C81310])
          NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAccessoryEQSelectEqualizerAtIndex", 50);
        else
          NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAccessoryEQSelectEqualizerAtIndex", 54, v9);
      }
      v12 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

uint64_t IAPAudioDeviceStateChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return -[IAPAudioCallbackInfo _deviceStateChanged:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance", a3, a4, a5), "_deviceStateChanged:", 0);
}

uint64_t AccessoryDigitalAudioNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return -[IAPAudioCallbackInfo _deviceStateChanged:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance", a3, a4, a5), "_deviceStateChanged:", 0);
}

uint64_t IAPAudioVolumeChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return -[IAPAudioCallbackInfo _volumeChanged:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance", a3, a4, a5), "_volumeChanged:", 0);
}

uint64_t IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return -[IAPAudioCallbackInfo _pauseOnHeadphoneDisconnectChanged:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance", a3, a4, a5), "_pauseOnHeadphoneDisconnectChanged:", 0);
}

uint64_t IAPAudioVolumeControlSupportChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  return -[IAPAudioCallbackInfo _volumeControlSupportChanged:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance", a3, a4, a5), "_volumeControlSupportChanged:", 0);
}

uint64_t IAPAudioNotifyOfPlaybackStateChanged()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("IAPAudioPlaybackStateChangedNotification"), 0, 0, 0);
  return 1;
}

uint64_t IAPAudioRegisterDeviceStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo setupDeviceStateChangedCallback:withContext:andRunLoop:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "setupDeviceStateChangedCallback:withContext:andRunLoop:", a1, a2, a3);

  return 1;
}

uint64_t IAPAudioUnregisterDeviceStateChangedCallback()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo clearDeviceStateChangedCallback](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "clearDeviceStateChangedCallback");

  return 1;
}

id IAPAudioCopyDeviceStates()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v8;
  uint64_t (*v9)(void);
  id v11;
  const void *data;
  uint64_t v13;
  id v14;
  size_t length;

  length = 0;
  v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v0)
  {
    v1 = v0;
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPAudioCopyDeviceStates");
    v3 = IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v3)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioCopyDeviceStates", 378);
      v8 = 0;
      goto LABEL_19;
    }
    v4 = (void *)v3;
    v5 = MEMORY[0x1B5E4DB38]();
    if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioCopyDeviceStates received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v4 == (void *)MEMORY[0x1E0C81258] && v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioCopyDeviceStates received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v5 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v4, "result"))
      {
        v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        data = xpc_dictionary_get_data(v4, "deviceStates", &length);
        if (data && (v13 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length)) != 0)
        {
          v14 = 0;
          v8 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v14);
          if (!v8)
            NSLog(CFSTR("ERROR - received bogus string (len=%lu) from server with the following error: %@"), length, objc_msgSend(v14, "description"));
        }
        else
        {
          v8 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioCopyDeviceStates", 368);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioCopyDeviceStates", 372, v5);
    }
    v8 = 0;
LABEL_18:
    xpc_release(v4);
LABEL_19:
    xpc_release(v2);
    xpc_release(v1);
    if (v8)
      return v8;
  }
  v9 = (uint64_t (*)(void))IAPWeakLinkSymbol("ACCAudioCopyDeviceStates", (const void *)6);
  if (!v9 || (v8 = (id)v9()) == 0)
  {
    NSLog(CFSTR("IAPAudioCopyDeviceStates: audioDeviceStates == NULL"));
    return 0;
  }
  return v8;
}

uint64_t IAPAudioRegisterVolumeChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo setupVolumeChangedCallback:withContext:andRunLoop:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "setupVolumeChangedCallback:withContext:andRunLoop:", a1, a2, a3);

  return 1;
}

uint64_t IAPAudioUnregisterVolumeChangedCallback()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo clearVolumeChangedCallback](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "clearVolumeChangedCallback");

  return 1;
}

_xpc_connection_s *IAPAudioSetVolume(float a1)
{
  return IAPAudioSetVolumeForTransport(1u, a1);
}

_xpc_connection_s *IAPAudioSetVolumeForTransport(unsigned int a1, float a2)
{
  _xpc_connection_s *result;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  int v7;

  v7 = 2;
  result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v7);
  if (result)
  {
    v5 = result;
    if (!v7)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v6, "transport", a1);
      xpc_dictionary_set_double(v6, "volume", a2);
      xpc_dictionary_set_string(v6, "requestType", "IAPAudioSetVolumeForTransport");
      xpc_connection_send_message(v5, v6);
      xpc_release(v6);
    }
    xpc_release(v5);
    return (_xpc_connection_s *)1;
  }
  return result;
}

uint64_t IAPAudioGetVolume(float *a1)
{
  return IAPAudioGetVolumeForTransport(1u, a1);
}

uint64_t IAPAudioGetVolumeForTransport(unsigned int a1, float *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  float v14;
  int v15;

  *a2 = 0.0;
  v15 = 2;
  v4 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v15);
  if (v4)
  {
    v5 = v4;
    if (v15)
    {
      v6 = 1;
LABEL_23:
      xpc_release(v5);
      return v6;
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "transport", a1);
    xpc_dictionary_set_string(v7, "requestType", "IAPAudioGetVolumeForTransport");
    v8 = IAPAppSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v8)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioGetVolumeForTransport", 510);
      v6 = 0;
LABEL_22:
      xpc_release(v7);
      goto LABEL_23;
    }
    v9 = (void *)v8;
    v10 = MEMORY[0x1B5E4DB38]();
    if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioGetVolumeForTransport received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioGetVolumeForTransport received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v10 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v9, "result"))
      {
        v14 = xpc_dictionary_get_double(v9, "volume");
        *a2 = v14;
        v6 = 1;
        goto LABEL_21;
      }
    }
    else if (v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioGetVolumeForTransport", 500);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioGetVolumeForTransport", 504, v10);
    }
    v6 = 0;
LABEL_21:
    xpc_release(v9);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IAPAudioRegisterShouldPauseAudioOnHeadsetDisconnectChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo setupPauseOnHeadphoneDisconnectChangedCallback:withContext:andRunLoop:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "setupPauseOnHeadphoneDisconnectChangedCallback:withContext:andRunLoop:", a1, a2, a3);

  return 1;
}

uint64_t IAPAudioUnregisterShouldPauseAudioOnHeadsetDisconnectChangedCallback()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo clearPauseOnHeadphoneDisconnectChangedCallback](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "clearPauseOnHeadphoneDisconnectChangedCallback");

  return 1;
}

uint64_t IAPAudioShouldPauseAudioOnHeadsetDisconnect(BOOL *a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v12;

  *a1 = 1;
  v12 = 2;
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    v3 = v2;
    if (v12)
    {
      v4 = 0;
LABEL_23:
      xpc_release(v3);
      return v4;
    }
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioShouldPauseAudioOnHeadsetDisconnect");
    v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 588);
      v4 = 0;
LABEL_22:
      xpc_release(v5);
      goto LABEL_23;
    }
    v7 = (void *)v6;
    v8 = MEMORY[0x1B5E4DB38]();
    if (v7 == (void *)MEMORY[0x1E0C81260] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioShouldPauseAudioOnHeadsetDisconnect received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v7 == (void *)MEMORY[0x1E0C81258] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioShouldPauseAudioOnHeadsetDisconnect received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v8 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v7, "result"))
      {
        *a1 = xpc_dictionary_get_BOOL(v7, "shouldPause");
        v4 = 1;
        goto LABEL_21;
      }
    }
    else if (v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 578);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 582, v8);
    }
    v4 = 0;
LABEL_21:
    xpc_release(v7);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IAPAudioRegisterVolumeControlSupportChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo setupVolumeControlSupportChangedCallback:withContext:andRunLoop:](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "setupVolumeControlSupportChangedCallback:withContext:andRunLoop:", a1, a2, a3);

  return 1;
}

uint64_t IAPAudioUnregisterVolumeControlSupportChangedCallback()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[IAPAudioCallbackInfo clearVolumeControlSupportChangedCallback](+[IAPAudioCallbackInfo sharedInstance](IAPAudioCallbackInfo, "sharedInstance"), "clearVolumeControlSupportChangedCallback");

  return 1;
}

uint64_t IAPAudioIsVolumeControlSupported(BOOL *a1)
{
  return IAPAudioIsVolumeControlSupportedForTransport(1u, a1);
}

uint64_t IAPAudioIsVolumeControlSupportedForTransport(unsigned int a1, BOOL *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v14;

  *a2 = 0;
  v14 = 2;
  v4 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v14);
  if (v4)
  {
    v5 = v4;
    if (v14)
    {
      v6 = 1;
LABEL_23:
      xpc_release(v5);
      return v6;
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "transport", a1);
    xpc_dictionary_set_string(v7, "requestType", "IAPAudioIsVolumeControlSupportedForTransport");
    v8 = IAPAppSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v8)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioIsVolumeControlSupportedForTransport", 668);
      v6 = 0;
LABEL_22:
      xpc_release(v7);
      goto LABEL_23;
    }
    v9 = (void *)v8;
    v10 = MEMORY[0x1B5E4DB38]();
    if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioIsVolumeControlSupportedForTransport received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioIsVolumeControlSupportedForTransport received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v10 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v9, "result"))
      {
        *a2 = xpc_dictionary_get_BOOL(v9, "isSupported");
        v6 = 1;
        goto LABEL_21;
      }
    }
    else if (v10 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioIsVolumeControlSupportedForTransport", 658);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioIsVolumeControlSupportedForTransport", 662, v10);
    }
    v6 = 0;
LABEL_21:
    xpc_release(v9);
    goto LABEL_22;
  }
  return 0;
}

_xpc_connection_s *IAPAudioStartPlayback()
{
  return IAPAudioStartPlaybackForTransport(1u);
}

_xpc_connection_s *IAPAudioStartPlaybackForTransport(unsigned int a1)
{
  _xpc_connection_s *result;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  int v5;

  v5 = 2;
  result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v5);
  if (result)
  {
    v3 = result;
    if (!v5)
    {
      v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "transport", a1);
      xpc_dictionary_set_string(v4, "requestType", "IAPAudioStartPlaybackForTransport");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
    }
    xpc_release(v3);
    return (_xpc_connection_s *)1;
  }
  return result;
}

_xpc_connection_s *IAPAudioStopPlayback()
{
  return IAPAudioStopPlaybackForTransport(1u);
}

_xpc_connection_s *IAPAudioStopPlaybackForTransport(unsigned int a1)
{
  _xpc_connection_s *result;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  int v5;

  v5 = 2;
  result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v5);
  if (result)
  {
    v3 = result;
    if (!v5)
    {
      v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "transport", a1);
      xpc_dictionary_set_string(v4, "requestType", "IAPAudioStopPlaybackForTransport");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
    }
    xpc_release(v3);
    return (_xpc_connection_s *)1;
  }
  return result;
}

BOOL IAPAudioStartRecording()
{
  return IAPAudioStartRecordingForTransport(1u);
}

BOOL IAPAudioStartRecordingForTransport(unsigned int a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  _BOOL8 v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v12;

  v12 = 2;
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    v3 = v2;
    if (v12)
    {
      v4 = 1;
LABEL_25:
      xpc_release(v3);
      return v4;
    }
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "transport", a1);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioStartRecordingForTransport");
    v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioStartRecordingForTransport", 793);
      v4 = 0;
LABEL_24:
      xpc_release(v5);
      goto LABEL_25;
    }
    v7 = (void *)v6;
    v8 = MEMORY[0x1B5E4DB38]();
    if (v7 == (void *)MEMORY[0x1E0C81260] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioStartRecordingForTransport received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v7 == (void *)MEMORY[0x1E0C81258] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioStartRecordingForTransport received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else
    {
      if (v8 == MEMORY[0x1E0C812F8])
      {
        v4 = xpc_dictionary_get_BOOL(v7, "result");
LABEL_23:
        xpc_release(v7);
        goto LABEL_24;
      }
      if (v8 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioStartRecordingForTransport", 783);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioStartRecordingForTransport", 787, v8);
    }
    v4 = 0;
    goto LABEL_23;
  }
  return 0;
}

BOOL IAPAudioStopRecording()
{
  return IAPAudioStopRecordingForTransport(1u);
}

BOOL IAPAudioStopRecordingForTransport(unsigned int a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  _BOOL8 v4;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v12;

  v12 = 2;
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    v3 = v2;
    if (v12)
    {
      v4 = 1;
LABEL_25:
      xpc_release(v3);
      return v4;
    }
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "transport", a1);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioStopRecordingForTransport");
    v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPAudioStopRecordingForTransport", 856);
      v4 = 0;
LABEL_24:
      xpc_release(v5);
      goto LABEL_25;
    }
    v7 = (void *)v6;
    v8 = MEMORY[0x1B5E4DB38]();
    if (v7 == (void *)MEMORY[0x1E0C81260] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioStopRecordingForTransport received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v7 == (void *)MEMORY[0x1E0C81258] && v8 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPAudioStopRecordingForTransport received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else
    {
      if (v8 == MEMORY[0x1E0C812F8])
      {
        v4 = xpc_dictionary_get_BOOL(v7, "result");
LABEL_23:
        xpc_release(v7);
        goto LABEL_24;
      }
      if (v8 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPAudioStopRecordingForTransport", 846);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPAudioStopRecordingForTransport", 850, v8);
    }
    v4 = 0;
    goto LABEL_23;
  }
  return 0;
}

uint64_t IAPAudioIsVoiceSignalProcessingEnabled(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
  return 1;
}

uint64_t IAPAudioEnableVoiceSignalProcessing()
{
  return 1;
}

uint64_t IAPAudioDisableVoiceSignalProcessing()
{
  return 1;
}

void __iap2dServerLaunched()
{
  id v0;

  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### - (void)__iap2dServerLaunched, post kiAP2ServerDidLaunchNotification"));
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("iAP2ServerLaunch"), 0);

}

void __iap2dServerDied()
{
  id v0;

  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    if (!__debugLogEnabled___bNavigationDebug)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (__debugLogEnabled___bNavigationDebug)
LABEL_3:
    NSLog(CFSTR("[#Navigation] ### - (void)__iap2dServerDied, post kiAP2ServerDidDieNotification"));
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("iAP2ServerDie"), 0);

}

BOOL __debugLogEnabled()
{
  int AppBooleanValue;

  AppBooleanValue = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("iAP2LogNavigation"), CFSTR("com.apple.iapd"), 0);
    __debugLogEnabled___bNavigationDebug = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

void *IAPWeakLinkSymbol(const char *a1, const void *a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(const void *a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v12;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("UIKit");
        v7 = CFSTR("UIKit.framework");
        goto LABEL_7;
      case 1uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("MobileCoreServices");
        v7 = CFSTR("MobileCoreServices.framework");
LABEL_7:
        v8 = CFSTR("Frameworks");
        goto LABEL_14;
      case 2uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("SpringBoardServices");
        v7 = CFSTR("SpringBoardServices.framework");
        goto LABEL_13;
      case 3uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("FrontBoardServices");
        v7 = CFSTR("FrontBoardServices.framework");
        goto LABEL_13;
      case 4uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("CarKit");
        v7 = CFSTR("CarKit.framework");
        goto LABEL_13;
      case 5uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("VisualVoicemail");
        v7 = CFSTR("VisualVoicemail.framework");
        goto LABEL_13;
      case 6uLL:
        v4 = (void *)MEMORY[0x1E0CB3940];
        v5 = (void *)MEMORY[0x1E0C99D20];
        v6 = CPSystemRootDirectory();
        v12 = CFSTR("AccessoryAudio");
        v7 = CFSTR("AccessoryAudio.framework");
LABEL_13:
        v8 = CFSTR("PrivateFrameworks");
LABEL_14:
        v9 = (void *)objc_msgSend(v4, "pathWithComponents:", objc_msgSend(v5, "arrayWithObjects:", v6, CFSTR("System"), CFSTR("Library"), v8, v7, v12, 0));
        if (!v9)
          goto LABEL_17;
        v10 = dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1);
        if (!v10)
          goto LABEL_17;
        Value = v10;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, a1, v10);
        break;
      default:
LABEL_17:
        NSLog(CFSTR("Could not load source: %ld"), a1);
        Value = 0;
        break;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

Class IAPWeakLinkClass(NSString *a1, const void *a2)
{
  Class result;

  result = (Class)__HandleForSource(a2);
  if (result)
    return NSClassFromString(a1);
  return result;
}

void *IAPWeakLinkStringConstant(const char *a1, const void *a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
  {
    result = dlsym(result, a1);
    if (result)
      return *(void **)result;
  }
  return result;
}

uint64_t Generate32BitConnectionID()
{
  int v0;
  void *v1;
  uint64_t result;
  int v3;
  int v4;

  if (Generate32BitConnectionID_onceToken != -1)
    dispatch_once(&Generate32BitConnectionID_onceToken, &__block_literal_global_2);
  if (((Generate32BitConnectionID_connectionID + 1) & 0xFFFFFF) != 0)
    v0 = Generate32BitConnectionID_connectionID + 1;
  else
    v0 = Generate32BitConnectionID_connectionID + 2;
  Generate32BitConnectionID_connectionID = v0;
  v1 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (!objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.apple.iapd")))
  {
    v3 = Generate32BitConnectionID_connectionID;
    v4 = 0x1000000;
LABEL_11:
    result = v4 & 0xFF000000 | v3 & 0xFFFFFF;
    goto LABEL_12;
  }
  if (!objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("com.apple.iap2d")))
  {
    v3 = Generate32BitConnectionID_connectionID;
    v4 = 0x2000000;
    goto LABEL_11;
  }
  NSLog(CFSTR("%s:%s unknown daemon %@ creating connectionID"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/common/SharedFunctions.m", "Generate32BitConnectionID", v1);
  result = Generate32BitConnectionID_connectionID | 0xFF000000;
LABEL_12:
  Generate32BitConnectionID_connectionID = result;
  return result;
}

uint64_t IsAppVisibleInCurrentMode(uint64_t a1)
{
  uint64_t v1;
  Class v2;
  Class v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v1 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v2 = IAPWeakLinkClass(CFSTR("LSApplicationProxy"), (const void *)1);
  v3 = IAPWeakLinkClass(CFSTR("LSApplicationWorkspace"), (const void *)1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (objc_msgSend((id)-[objc_class defaultWorkspace](v3, "defaultWorkspace"), "applicationIsInstalled:", v1))
  {
    v4 = -[objc_class applicationProxyForIdentifier:](v2, "applicationProxyForIdentifier:", v1);
    v5 = (void *)-[objc_class defaultWorkspace](v3, "defaultWorkspace");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v8[3] = &unk_1E6931458;
    v8[4] = v4;
    v8[5] = &v9;
    objc_msgSend(v5, "enumerateBundlesOfType:block:", 4, v8);
  }
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_1B5646810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IsExistAppMusic()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
}

uint64_t IsExistAppPodcasts()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
}

uint64_t IsExistAppiBooks()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
}

uint64_t IsExistAppiTunesU()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.itunesu");
}

BOOL ShouldAccessoryBeHidden(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  v2 = (void *)MEMORY[0x1B5E4D838]();
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a1, 4);
  v4 = 0;
  do
  {
    v5 = objc_msgSend(v3, "caseInsensitiveCompare:", hiddenAccessoryTable[v4]);
    if (v4 > 0xF)
      break;
    ++v4;
  }
  while (v5);
  v6 = v5 == 0;
  objc_autoreleasePoolPop(v2);
  return v6;
}

BOOL IsDataAggregationEnabled()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("GreenValkyrie"), CFSTR("com.apple.iaptransportd"), 0) != 0;
}

uint64_t IAPDigitalAudioCurrentSampleRate()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t uint64;
  _BOOL4 v9;

  NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate"));
  v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (!v0)
  {
    NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate: No connection to IAPDaemonOwningPhysicalConnector"));
    NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate: sampleRate=%d retVal=%d"), 0, 0);
    return 0;
  }
  v1 = v0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioCurrentSampleRate");
  v3 = IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v3)
  {
    NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioCurrentSampleRate", 70);
    uint64 = 0;
    v9 = 0;
    goto LABEL_22;
  }
  v4 = (void *)v3;
  v5 = MEMORY[0x1B5E4DB38]();
  if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate: received an XPC_ERROR_CONNECTION_INVALID error.\n"));
LABEL_20:
    uint64 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  if (v4 == (void *)MEMORY[0x1E0C81258] && v5 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    goto LABEL_20;
  }
  if (v5 != MEMORY[0x1E0C812F8])
  {
    if (v5 == MEMORY[0x1E0C81310])
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioCurrentSampleRate", 60);
    else
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioCurrentSampleRate", 64, v5);
    goto LABEL_20;
  }
  uint64 = xpc_dictionary_get_uint64(v4, "sampleRate");
  v9 = xpc_dictionary_get_BOOL(v4, "result");
LABEL_21:
  xpc_release(v4);
LABEL_22:
  xpc_release(v2);
  xpc_release(v1);
  NSLog(CFSTR("IAPDigitalAudioCurrentSampleRate: sampleRate=%d retVal=%d"), uint64, v9);
  if (!v9)
    return 0;
  return uint64;
}

uint64_t IAPDigitalAudioSetSampleRate(uint64_t a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v11;

  NSLog(CFSTR("IAPDigitalAudioSetSampleRate: inputRate=%u"), a1);
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "inputRate", a1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSetSampleRate");
    v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioSetSampleRate", 138);
      v8 = 0;
      goto LABEL_19;
    }
    v6 = v5;
    v7 = MEMORY[0x1B5E4DB38]();
    if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSetSampleRate: received an XPC_ERROR_CONNECTION_INVALID error.\n"), v11);
    }
    else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSetSampleRate: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v11);
    }
    else if (v7 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        NSLog(CFSTR("IAPDigitalAudioSetSampleRate Handled by kXPCDigitalAudioSetSampleRateStr"));
        v8 = 1;
LABEL_18:
        xpc_release(v6);
LABEL_19:
        xpc_release(v4);
        xpc_release(v3);
        if ((_DWORD)v8)
          goto LABEL_23;
        goto LABEL_20;
      }
    }
    else if (v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioSetSampleRate", 128);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioSetSampleRate", 132, v7);
    }
    v8 = 0;
    goto LABEL_18;
  }
  v8 = 0;
LABEL_20:
  v9 = (uint64_t (*)(uint64_t))IAPWeakLinkSymbol("ACCDigitalAudioSetSampleRate", (const void *)6);
  if (v9)
    v8 = v9(a1);
  else
    NSLog(CFSTR("IAPDigitalAudioSetSampleRate: function not handled."));
LABEL_23:
  NSLog(CFSTR("IAPDigitalAudioSetSampleRate: inputRate=%u retVal=%d"), a1, v8);
  return v8;
}

uint64_t IAPDigitalAudioSupportedSampleRate(uint64_t a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t uint64;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v13;

  NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: inputRate=%u"), a1);
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "inputRate", a1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSupportedSampleRate");
    v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioSupportedSampleRate", 222);
      uint64 = 0;
      v8 = 0;
      goto LABEL_19;
    }
    v6 = v5;
    v7 = MEMORY[0x1B5E4DB38]();
    if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: received an XPC_ERROR_CONNECTION_INVALID error.\n"), v13);
    }
    else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v13);
    }
    else if (v7 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        uint64 = xpc_dictionary_get_uint64(v6, "outputRate");
        NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate handled by kXPCDigitalAudioSupportedSampleRateStr"));
        v8 = 1;
LABEL_18:
        xpc_release(v6);
LABEL_19:
        xpc_release(v4);
        xpc_release(v3);
        if (v8)
          goto LABEL_23;
        goto LABEL_20;
      }
    }
    else if (v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioSupportedSampleRate", 212);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioSupportedSampleRate", 216, v7);
    }
    uint64 = 0;
    v8 = 0;
    goto LABEL_18;
  }
  v8 = 0;
  uint64 = 0;
LABEL_20:
  v10 = (uint64_t (*)(uint64_t))IAPWeakLinkSymbol("ACCDigitalAudioSupportedSampleRate", (const void *)6);
  if (v10)
  {
    v11 = v10(a1);
    NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: inutRate=%u outputRate=%u retVal=%d"), a1, v11, 1);
    return v11;
  }
  NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: function not handled."));
LABEL_23:
  NSLog(CFSTR("IAPDigitalAudioSupportedSampleRate: inutRate=%u outputRate=%u retVal=%d"), a1, uint64, v8);
  if (v8)
    return uint64;
  else
    return 0;
}

BOOL IAPDigitalAudioSetVolumeOffset(uint64_t a1)
{
  unsigned int v1;
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v10;

  v1 = a1;
  NSLog(CFSTR("IAPDigitalAudioSetVolumeOffset: offset=%u"), a1);
  v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "offset", v1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSetVolumeOffset");
    v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioSetVolumeOffset", 296);
      v8 = 0;
LABEL_18:
      xpc_release(v4);
      xpc_release(v3);
      goto LABEL_19;
    }
    v6 = v5;
    v7 = MEMORY[0x1B5E4DB38]();
    if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSetVolumeOffset: received an XPC_ERROR_CONNECTION_INVALID error.\n"), v10);
    }
    else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioSetVolumeOffset: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v10);
    }
    else
    {
      if (v7 == MEMORY[0x1E0C812F8])
      {
        v8 = xpc_dictionary_get_BOOL(v6, "result");
LABEL_17:
        xpc_release(v6);
        goto LABEL_18;
      }
      if (v7 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioSetVolumeOffset", 286);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioSetVolumeOffset", 290, v7);
    }
    v8 = 0;
    goto LABEL_17;
  }
  NSLog(CFSTR("IAPDigitalAudioSetVolumeOffset: No connection to IAPDaemonOwningPhysicalConnector"));
  v8 = 0;
LABEL_19:
  NSLog(CFSTR("IAPDigitalAudioSetVolumeOffset: retVal=%d"), v8);
  return v8;
}

uint64_t IAPDigitalAudioGetVideoDelay()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  uint64_t uint64;
  unsigned int v7;

  NSLog(CFSTR("IAPDigitalAudioGetVideoDelay"));
  v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (!v0)
  {
    NSLog(CFSTR("IAPDigitalAudioGetVideoDelay: No connection to IAPDaemonOwningPhysicalConnector"));
    NSLog(CFSTR("IAPDigitalAudioGetVideoDelay: videoDelay=%u retVal=%d"), 0, 0);
    return 0;
  }
  v1 = v0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioGetVideoDelay");
  v3 = xpc_connection_send_message_with_reply_sync(v1, v2);
  if (!v3)
  {
    NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioGetVideoDelay", 354);
    uint64 = 0;
    v7 = 0;
    goto LABEL_19;
  }
  v4 = v3;
  v5 = MEMORY[0x1B5E4DB38]();
  if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPDigitalAudioGetVideoDelay: received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    goto LABEL_17;
  }
  if (v4 == (void *)MEMORY[0x1E0C81258] && v5 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPDigitalAudioGetVideoDelay: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    goto LABEL_17;
  }
  if (v5 != MEMORY[0x1E0C812F8])
  {
    if (v5 == MEMORY[0x1E0C81310])
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioGetVideoDelay", 344);
    else
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioGetVideoDelay", 348, v5);
    goto LABEL_17;
  }
  if (!xpc_dictionary_get_BOOL(v4, "result"))
  {
LABEL_17:
    uint64 = 0;
    v7 = 0;
    goto LABEL_18;
  }
  v7 = 1;
  uint64 = xpc_dictionary_get_uint64(v4, "videoDelay");
LABEL_18:
  xpc_release(v4);
LABEL_19:
  xpc_release(v2);
  xpc_release(v1);
  NSLog(CFSTR("IAPDigitalAudioGetVideoDelay: videoDelay=%u retVal=%d"), uint64, v7);
  if (!v7)
    return 0;
  return uint64;
}

CFMutableArrayRef IAPDigitalAudioCopySupportSampleRates()
{
  _xpc_connection_s *v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  CFMutableArrayRef Mutable;
  id v7;
  const void *data;
  __CFArray *v9;
  int *v10;
  unint64_t v11;
  const __CFAllocator *v12;
  uint64_t v13;
  int v14;
  CFNumberRef v15;
  uint64_t (*v16)(void);
  size_t length;
  int valuePtr;

  valuePtr = 0;
  length = 0;
  NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates"));
  v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v0)
  {
    v1 = v0;
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioCopySupportSampleRates");
    v3 = xpc_connection_send_message_with_reply_sync(v1, v2);
    if (!v3)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "IAPDigitalAudioCopySupportSampleRates", 443);
      Mutable = 0;
      goto LABEL_26;
    }
    v4 = v3;
    v5 = MEMORY[0x1B5E4DB38]();
    if (v4 == (void *)MEMORY[0x1E0C81260] && v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates: received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v4 == (void *)MEMORY[0x1E0C81258] && v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates: received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v5 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v4, "result"))
      {
        v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        data = xpc_dictionary_get_data(v4, "sampleRates", &length);
        if (data)
        {
          v9 = (__CFArray *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
          Mutable = v9;
          if (v9)
          {
            v10 = (int *)-[__CFArray bytes](v9, "bytes");
            v11 = -[__CFArray length](Mutable, "length");
            v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11 >> 2, MEMORY[0x1E0C9B378]);
            if (v11 >= 4)
            {
              if (v11 >> 2 <= 1)
                v13 = 1;
              else
                v13 = v11 >> 2;
              do
              {
                v14 = *v10++;
                valuePtr = v14;
                v15 = CFNumberCreate(v12, kCFNumberIntType, &valuePtr);
                CFArrayAppendValue(Mutable, v15);
                CFRelease(v15);
                --v13;
              }
              while (v13);
            }
          }
        }
        else
        {
          Mutable = 0;
        }

        goto LABEL_25;
      }
      NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates not handled by kXPCDigitalAudioCopySupportSampleRatesStr"));
    }
    else if (v5 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPDigitalAudioCopySupportSampleRates", 433);
    }
    else
    {
      NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPDigitalAudioCopySupportSampleRates", 437, v5);
    }
    Mutable = 0;
LABEL_25:
    xpc_release(v4);
LABEL_26:
    xpc_release(v2);
    xpc_release(v1);
    if (Mutable)
      goto LABEL_30;
  }
  v16 = (uint64_t (*)(void))IAPWeakLinkSymbol("ACCDigitalAudioCopySupportSampleRates", (const void *)6);
  if (!v16 || (Mutable = (CFMutableArrayRef)v16()) == 0)
  {
    NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates: supportedSampleRates == NULL"));
    Mutable = 0;
  }
LABEL_30:
  NSLog(CFSTR("IAPDigitalAudioCopySupportSampleRates: supportedSampleRates=%@"), Mutable);
  return Mutable;
}

uint64_t IAPLocationIsActivated(_BYTE *a1)
{
  *a1 = __isLocationActivated;
  return 1;
}

uint64_t IAPLocationIsNMEADataAvailable(uint64_t a1, BOOL *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;

  *a2 = 0;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationIsNMEADataAvailable");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      v8 = v7;
      v9 = MEMORY[0x1B5E4DB38]();
      if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationIsNMEADataAvailable received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationIsNMEADataAvailable received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v9 == MEMORY[0x1E0C812F8])
      {
        if (xpc_dictionary_get_BOOL(v8, "result"))
          *a2 = xpc_dictionary_get_BOOL(v8, "isAvailable");
        else
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationIsNMEADataAvailable");
      }
      else if (v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationIsNMEADataAvailable", 193);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationIsNMEADataAvailable", 197, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationIsNMEADataAvailable", 203);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationIsNMEADataAvailable, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationCopyNMEAData(uint64_t a1, const char **a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  const char *string;
  const char *v11;

  if (*a2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("IAPCopyNMEAException"), CFSTR("nmea must be NULL"));
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationCopyNMEAData");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      v8 = v7;
      v9 = MEMORY[0x1B5E4DB38]();
      if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationCopyNMEAData received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationCopyNMEAData received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v9 == MEMORY[0x1E0C812F8])
      {
        if (xpc_dictionary_get_BOOL(v8, "result"))
        {
          string = xpc_dictionary_get_string(v8, "sentence");
          if (string)
          {
            v11 = string;
            string = (const char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
          }
          else
          {
            v11 = "<nil>";
          }
          *a2 = string;
          NSLog(CFSTR("[#Location] IAPLocationCopyNMEAData received sentence: %s.\n"), v11);
        }
        else
        {
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationCopyNMEAData");
        }
      }
      else if (v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationCopyNMEAData", 260);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationCopyNMEAData", 264, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationCopyNMEAData", 270);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationCopyNMEAData, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationCopyEphemerisURL(uint64_t a1, _QWORD *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  const char *string;
  void *v11;
  void *v12;

  if (*a2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("IAPCopyEphemerisException"), CFSTR("ephemerisURL must be NULL"));
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationCopyEphemerisURL");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      v8 = v7;
      v9 = MEMORY[0x1B5E4DB38]();
      if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationCopyEphemerisURL received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationCopyEphemerisURL received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v9 == MEMORY[0x1E0C812F8])
      {
        if (xpc_dictionary_get_BOOL(v8, "result"))
        {
          string = xpc_dictionary_get_string(v8, "urlString");
          if (string)
          {
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
            v12 = v11;
            if (v11 && objc_msgSend(v11, "length"))
              *a2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v12);

          }
          NSLog(CFSTR("[#Location] IAPLocationCopyEphemerisURL received sentence: %s.\n"), string);
        }
        else
        {
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationCopyEphemerisURL");
        }
      }
      else if (v9 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationCopyEphemerisURL", 334);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationCopyEphemerisURL", 338, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationCopyEphemerisURL", 344);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationCopyEphemerisURL, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationGetEphemerisMaxInterval(uint64_t a1, _DWORD *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  *a2 = 0;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationGetEphemerisMaxInterval");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationGetEphemerisMaxInterval", 401);
      v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    v8 = v7;
    v9 = MEMORY[0x1B5E4DB38]();
    if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationGetEphemerisMaxInterval received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationGetEphemerisMaxInterval received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v9 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_uint64(v8, "maxInterval");
        v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationGetEphemerisMaxInterval");
    }
    else if (v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationGetEphemerisMaxInterval", 391);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationGetEphemerisMaxInterval", 395, v9);
    }
    v10 = 0;
    goto LABEL_19;
  }
  NSLog(CFSTR("[#Location] Skip IAPLocationGetEphemerisMaxInterval, no xpc connection to iapd, connectionID %u\n"), a1);
  return 0;
}

uint64_t IAPLocationGetEphemerisRecommendedRefreshInterval(uint64_t a1, _DWORD *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  *a2 = 0;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationGetEphemerisRecommendedRefreshInterval");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationGetEphemerisRecommendedRefreshInterval", 458);
      v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    v8 = v7;
    v9 = MEMORY[0x1B5E4DB38]();
    if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationGetEphemerisRecommendedRefreshInterval received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationGetEphemerisRecommendedRefreshInterval received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v9 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_uint64(v8, "refreshInterval");
        v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationGetEphemerisRecommendedRefreshInterval");
    }
    else if (v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationGetEphemerisRecommendedRefreshInterval", 448);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationGetEphemerisRecommendedRefreshInterval", 452, v9);
    }
    v10 = 0;
    goto LABEL_19;
  }
  NSLog(CFSTR("[#Location] Skip IAPLocationGetEphemerisRecommendedRefreshInterval, no xpc connection to iapd, connectionID %u\n"), a1);
  return 0;
}

uint64_t IAPLocationIsNMEAFilteringSupported(uint64_t a1, BOOL *a2)
{
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  *a2 = 0;
  v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationIsNMEAFilteringSupported");
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationIsNMEAFilteringSupported", 515);
      v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    v8 = v7;
    v9 = MEMORY[0x1B5E4DB38]();
    if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationIsNMEAFilteringSupported received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] IAPLocationIsNMEAFilteringSupported received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else if (v9 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_BOOL(v8, "isNMEAFilteringSupported");
        v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationIsNMEAFilteringSupported");
    }
    else if (v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationIsNMEAFilteringSupported", 505);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationIsNMEAFilteringSupported", 509, v9);
    }
    v10 = 0;
    goto LABEL_19;
  }
  NSLog(CFSTR("[#Location] Skip IAPLocationIsNMEAFilteringSupported, no xpc connection to iapd, connectionID %u\n"), a1);
  return 0;
}

uint64_t IAPlocationSetAccessoryNMEAFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;

  if (a2
    && (v3 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, 0)) != 0)
  {
    v4 = (void *)v3;
    v5 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
    if (v5)
    {
      v6 = v5;
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v7, "connectionID", a1);
      xpc_dictionary_set_data(v7, "nmeaFilter", (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
      xpc_dictionary_set_string(v7, "requestType", "IAPLocationSetAccessoryNMEAFilter");
      v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
      if (v8)
      {
        v9 = v8;
        v10 = MEMORY[0x1B5E4DB38]();
        if (v9 == (void *)MEMORY[0x1E0C81260] && v10 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] IAPlocationSetAccessoryNMEAFilter received an XPC_ERROR_CONNECTION_INVALID error.\n"));
        }
        else if (v9 == (void *)MEMORY[0x1E0C81258] && v10 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] IAPlocationSetAccessoryNMEAFilter received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
        }
        else if (v10 == MEMORY[0x1E0C812F8])
        {
          if (!xpc_dictionary_get_BOOL(v9, "result"))
            NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPlocationSetAccessoryNMEAFilter");
        }
        else if (v10 == MEMORY[0x1E0C81310])
        {
          NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPlocationSetAccessoryNMEAFilter", 565);
        }
        else
        {
          NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPlocationSetAccessoryNMEAFilter", 569, v10);
        }
        xpc_release(v9);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPlocationSetAccessoryNMEAFilter", 575);
      }
      xpc_release(v7);
      xpc_release(v6);
    }
    else
    {
      NSLog(CFSTR("[#Location] Skip IAPlocationSetAccessoryNMEAFilter, no xpc connection to iapd, connectionID %u\n"), a1);
    }
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPlocationSetAccessoryNMEAFilter, no filter data, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationSendGPSTime(uint64_t a1, unsigned int a2, double a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *v10;
  uint64_t v11;

  v6 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v6)
  {
    v7 = v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "gpsWeek", a2);
    xpc_dictionary_set_double(v8, "gpsTOWInSeconds", a3);
    xpc_dictionary_set_string(v8, "requestType", "IAPLocationSendGPSTime");
    v9 = xpc_connection_send_message_with_reply_sync(v7, v8);
    if (v9)
    {
      v10 = v9;
      v11 = MEMORY[0x1B5E4DB38]();
      if (v10 == (void *)MEMORY[0x1E0C81260] && v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationSendGPSTime received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v10 == (void *)MEMORY[0x1E0C81258] && v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationSendGPSTime received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v11 == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_BOOL(v10, "result"))
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationSendGPSTime");
      }
      else if (v11 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationSendGPSTime", 624);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationSendGPSTime", 628, v11);
      }
      xpc_release(v10);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationSendGPSTime", 634);
    }
    xpc_release(v8);
    xpc_release(v7);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationSendGPSTime, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationSendEphemerisPointData(uint64_t a1, unsigned int a2, unsigned int a3, double a4, double a5, double a6)
{
  _xpc_connection_s *v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  uint64_t v17;

  v12 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v12)
  {
    v13 = v12;
    v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "connectionID", a1);
    xpc_dictionary_set_uint64(v14, "gpsWeek", a2);
    xpc_dictionary_set_double(v14, "gpsTOWInSeconds", a4);
    xpc_dictionary_set_double(v14, "latitude", a5);
    xpc_dictionary_set_double(v14, "longitude", a6);
    xpc_dictionary_set_uint64(v14, "accuracyInMeters", a3);
    xpc_dictionary_set_string(v14, "requestType", "IAPLocationSendEphemerisPointData");
    v15 = xpc_connection_send_message_with_reply_sync(v13, v14);
    if (v15)
    {
      v16 = v15;
      v17 = MEMORY[0x1B5E4DB38]();
      if (v16 == (void *)MEMORY[0x1E0C81260] && v17 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationSendEphemerisPointData received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v16 == (void *)MEMORY[0x1E0C81258] && v17 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPLocationSendEphemerisPointData received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v17 == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_BOOL(v16, "result"))
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationSendEphemerisPointData");
      }
      else if (v17 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationSendEphemerisPointData", 681);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationSendEphemerisPointData", 685, v17);
      }
      xpc_release(v16);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationSendEphemerisPointData", 691);
    }
    xpc_release(v14);
    xpc_release(v13);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationSendEphemerisPointData, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPLocationSendEphemeris(uint64_t a1, const void *a2)
{
  CFDataRef Data;
  const __CFData *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const UInt8 *BytePtr;
  size_t Length;
  xpc_object_t v10;
  void *v11;
  uint64_t v12;

  if (a2)
  {
    Data = CFPropertyListCreateData(0, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      v4 = Data;
      v5 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
      if (v5)
      {
        v6 = v5;
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "connectionID", a1);
        BytePtr = CFDataGetBytePtr(v4);
        Length = CFDataGetLength(v4);
        xpc_dictionary_set_data(v7, "ephemerisData", BytePtr, Length);
        xpc_dictionary_set_string(v7, "requestType", "IAPLocationSendEphemeris");
        v10 = xpc_connection_send_message_with_reply_sync(v6, v7);
        if (v10)
        {
          v11 = v10;
          v12 = MEMORY[0x1B5E4DB38]();
          if (v11 == (void *)MEMORY[0x1E0C81260] && v12 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Location] IAPLocationSendEphemeris received an XPC_ERROR_CONNECTION_INVALID error.\n"));
          }
          else if (v11 == (void *)MEMORY[0x1E0C81258] && v12 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Location] IAPLocationSendEphemeris received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
          }
          else if (v12 == MEMORY[0x1E0C812F8])
          {
            if (!xpc_dictionary_get_BOOL(v11, "result"))
              NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPLocationSendEphemeris");
          }
          else if (v12 == MEMORY[0x1E0C81310])
          {
            NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPLocationSendEphemeris", 740);
          }
          else
          {
            NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPLocationSendEphemeris", 744, v12);
          }
          xpc_release(v11);
        }
        else
        {
          NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPLocationSendEphemeris", 750);
        }
        xpc_release(v7);
        xpc_release(v6);
      }
      else
      {
        NSLog(CFSTR("[#Location] Skip IAPLocationSendEphemeris, no xpc connection to iapd, connectionID %u\n"), a1);
      }
      CFRelease(v4);
    }
    else
    {
      NSLog(CFSTR("[#Location] Skip IAPLocationSendEphemeris, no ephemerisData, connectionID %u\n"), a1);
    }
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPLocationSendEphemeris, no ephemeris, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t IAPlocationSendGPRMCDataStatusValues(uint64_t a1, BOOL a2, BOOL a3, BOOL a4)
{
  _xpc_connection_s *v8;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;

  v8 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v8)
  {
    v9 = v8;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueA", a2);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueV", a3);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueX", a4);
    xpc_dictionary_set_string(v10, "requestType", "IAPLocationSendGPRMCDataStatusValues");
    v11 = xpc_connection_send_message_with_reply_sync(v9, v10);
    if (v11)
    {
      v12 = v11;
      v13 = MEMORY[0x1B5E4DB38]();
      if (v12 == (void *)MEMORY[0x1E0C81260] && v13 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPlocationSetAccessoryNMEAFilter received an XPC_ERROR_CONNECTION_INVALID error.\n"));
      }
      else if (v12 == (void *)MEMORY[0x1E0C81258] && v13 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] IAPlocationSetAccessoryNMEAFilter received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
      }
      else if (v13 == MEMORY[0x1E0C812F8])
      {
        if (!xpc_dictionary_get_BOOL(v12, "result"))
          NSLog(CFSTR("[#Location] ERROR - %s failed.\n"), "IAPlocationSendGPRMCDataStatusValues");
      }
      else if (v13 == MEMORY[0x1E0C81310])
      {
        NSLog(CFSTR("[#Location] %s:%d Unhandled reply error!"), "IAPlocationSendGPRMCDataStatusValues", 807);
      }
      else
      {
        NSLog(CFSTR("[#Location] %s:%d Unknown reply type %p!"), "IAPlocationSendGPRMCDataStatusValues", 811, v13);
      }
      xpc_release(v12);
    }
    else
    {
      NSLog(CFSTR("[#Location] %s:%d No reply received for message!"), "IAPlocationSendGPRMCDataStatusValues", 817);
    }
    xpc_release(v10);
    xpc_release(v9);
  }
  else
  {
    NSLog(CFSTR("[#Location] Skip IAPlocationSendGPRMCDataStatusValues, no xpc connection to iapd, connectionID %u\n"), a1);
  }
  return 1;
}

uint64_t __iaptransportdDied()
{
  return -[IAPClientPortManager setIaptransportdIsRunning:](+[IAPClientPortManager sharedInstance](IAPClientPortManager, "sharedInstance"), "setIaptransportdIsRunning:", 0);
}

uint64_t __iaptransportdLaunched()
{
  IAPClientPortManager *v0;

  v0 = +[IAPClientPortManager sharedInstance](IAPClientPortManager, "sharedInstance");
  -[IAPClientPortManager setIaptransportdIsRunning:](v0, "setIaptransportdIsRunning:", 1);
  return -[IAPClientPortManager reRegisterHandlers](v0, "reRegisterHandlers");
}

void sub_1B56494BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t IAPClientPortRegisterSendDataHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[IAPClientPortManager registerSendDataHandler:queue:sendBlock:](+[IAPClientPortManager sharedInstance](IAPClientPortManager, "sharedInstance"), "registerSendDataHandler:queue:sendBlock:", a1, a2, a3);
}

uint64_t IAPClientPortDataReceivedHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[IAPClientPortManager forwardAccessoryDataToIAP:data:length:](+[IAPClientPortManager sharedInstance](IAPClientPortManager, "sharedInstance"), "forwardAccessoryDataToIAP:data:length:", a1, a2, a3);
}

uint64_t IAPBluetoothDeviceMode(const __CFData *a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;

  v2 = RetainConnectionToIAPDaemon();
  v3 = _IAPBluetoothDeviceMode(a1, (uint64_t)v2);
  if (v2)
    xpc_release(v2);
  v4 = RetainConnectionToIAP2Daemon();
  v5 = _IAPBluetoothDeviceMode(a1, (uint64_t)v4);
  if (v4)
    xpc_release(v4);
  if (v5)
    v6 = 0;
  else
    v6 = v3;
  if (!v3)
    v6 = v5;
  if (v3 == v5)
    return v3;
  else
    return v6;
}

uint64_t _IAPBluetoothDeviceMode(const __CFData *a1, uint64_t a2)
{
  xpc_object_t v4;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t uint64;

  if (a2)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceMode");
    BytePtr = CFDataGetBytePtr(a1);
    Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v4, "MACAddress", BytePtr, Length);
    v7 = IAPAppSendXPCMessageWithTimeout(a2, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v7)
    {
      NSLog(CFSTR("%s:%d No reply received for message!"), "_IAPBluetoothDeviceMode", 126);
      v12 = 0;
LABEL_24:
      xpc_release(v4);
      return v12;
    }
    v8 = (void *)v7;
    v9 = MEMORY[0x1B5E4DB38]();
    if (v8 == (void *)MEMORY[0x1E0C81260] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPBluetoothDeviceActivate received an XPC_ERROR_CONNECTION_INVALID error.\n"));
    }
    else if (v8 == (void *)MEMORY[0x1E0C81258] && v9 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("IAPBluetoothDeviceActivate received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
    }
    else
    {
      if (v9 == MEMORY[0x1E0C812F8])
      {
        uint64 = xpc_dictionary_get_uint64(v8, "result");
        if (uint64 - 1 >= 2)
          v12 = 0;
        else
          v12 = uint64;
        goto LABEL_23;
      }
      if (v9 == MEMORY[0x1E0C81310])
        NSLog(CFSTR("%s:%d Unhandled reply error!"), "_IAPBluetoothDeviceMode", 116);
      else
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "_IAPBluetoothDeviceMode", 120, v9);
    }
    v12 = 0;
LABEL_23:
    xpc_release(v8);
    goto LABEL_24;
  }
  return 0;
}

void IAPBluetoothDeviceGetAccessoryConnectNotification()
{
  void *v0;
  void *v1;
  xpc_object_t v2;
  void *v3;

  syslog(3, "%s OBSOLETE FUNCTION: Please use IAPAppConnectedAccessories and iterate through array\n of accessory dictionaries looking for one with IAPAppBTPairingIsSupported key", "IAPBluetoothDeviceGetAccessoryConnectNotification");
  v0 = RetainConnectionToIAP2Daemon();
  if (v0)
  {
    v1 = v0;
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPBluetoothDeviceGetAccessoryConnectNotification");
    v3 = (void *)IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    IAPBluetoothXPCHandleReply("IAPBluetoothDeviceGetAccessoryConnectNotification", v3);
    xpc_release(v1);
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceGetAccessoryConnectNotification");
  }
}

uint64_t IAPBluetoothXPCHandleReply(const char *a1, void *a2)
{
  uint64_t v4;
  uint64_t uint64;
  const char *v6;
  const char *v7;

  if (a2)
  {
    v4 = MEMORY[0x1B5E4DB38](a2);
    if (v4 == MEMORY[0x1E0C812F8])
    {
      uint64 = xpc_dictionary_get_uint64(a2, "result");
    }
    else
    {
      if (v4 == MEMORY[0x1E0C81310])
      {
        if (a2 == (void *)MEMORY[0x1E0C81258])
          v6 = "XPC_ERROR_CONNECTION_INTERRUPTED";
        else
          v6 = "XPC ERROR UNKNOWN";
        if (a2 == (void *)MEMORY[0x1E0C81260])
          v7 = "XPC_ERROR_CONNECTION_INVALID";
        else
          v7 = v6;
        syslog(4, "%s XPC connection failure cause:[%s]\n", a1, v7);
      }
      else
      {
        NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPBluetoothXPCHandleReply", 579, v4);
      }
      uint64 = 0;
    }
    xpc_release(a2);
  }
  else
  {
    syslog(3, "%s ERROR: [%s] pXpcReply = NULL !\n", "IAPBluetoothXPCHandleReply", a1);
    return 0;
  }
  return uint64;
}

uint64_t IAPBluetoothDeviceAllocAccessoryPairingInfo(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t uint64;
  const char *string;
  const char *v10;
  const void *data;
  const void *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  size_t length;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceGetAccessoryPairingInfo");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v5)
    {
      syslog(3, "%s xpc_connection_send_message_with_reply_sync returned pXpcReply = NULL !\n", "IAPBluetoothDeviceAllocAccessoryPairingInfo");
      goto LABEL_7;
    }
    v6 = (void *)v5;
    if (MEMORY[0x1B5E4DB38]() != MEMORY[0x1E0C812F8])
    {
      IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAllocAccessoryPairingInfo", v6);
LABEL_7:
      v7 = 0;
LABEL_14:
      xpc_release(v4);
      xpc_release(v3);
      return v7;
    }
    uint64 = xpc_dictionary_get_uint64(v6, "connectionID");
    string = xpc_dictionary_get_string(v6, "btInfoAccessoryMfg");
    v10 = xpc_dictionary_get_string(v6, "btInfoAccessoryModel");
    v19 = 0;
    length = 0;
    data = xpc_dictionary_get_data(v6, "btInfoPairUUID", &length);
    v12 = xpc_dictionary_get_data(v6, "btInfoPairTypes", &v19);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", uint64);
    if (string)
    {
      v14 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", string, 4);
      if (v10)
      {
LABEL_10:
        v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4);
LABEL_13:
        v16 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
        v17 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v19);
        v21[0] = CFSTR("IAPAppBTPairingConnectionIDKey");
        v21[1] = CFSTR("IAPAppBTPairingAccManufacturer");
        v22[0] = v13;
        v22[1] = v14;
        v21[2] = CFSTR("IAPAppBTPairingAccModel");
        v21[3] = CFSTR("IAPAppBTPairingUUIDKey");
        v22[2] = v15;
        v22[3] = v16;
        v21[4] = CFSTR("IAPAppBTPairingTypesSupportedKey");
        v22[4] = v17;
        v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
        xpc_release(v6);
        goto LABEL_14;
      }
    }
    else
    {
      v14 = &stru_1E6934E80;
      if (v10)
        goto LABEL_10;
    }
    v15 = &stru_1E6934E80;
    goto LABEL_13;
  }
  syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAllocAccessoryPairingInfo");
  return 0;
}

uint64_t IAPBluetoothDeviceStartBLEUpdates(uint64_t a1, unsigned int a2, BOOL a3, BOOL a4)
{
  void *v8;
  void *v9;
  xpc_object_t v10;
  void *v11;
  uint64_t v12;

  v8 = RetainConnectionToIAP2Daemon();
  if (v8)
  {
    v9 = v8;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "requestType", "IAPBluetoothDeviceStartBLEUpdates");
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    xpc_dictionary_set_uint64(v10, "btParmPairType", a2);
    xpc_dictionary_set_BOOL(v10, "btParmUpdatesRadio", a3);
    xpc_dictionary_set_BOOL(v10, "btParmUpdatesPairInfo", a4);
    v11 = (void *)IAPAppSendXPCMessageWithTimeout(v9, v10, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v12 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStartBLEUpdates", v11);
    xpc_release(v10);
    xpc_release(v9);
    return v12;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStartBLEUpdates");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceStateUpdate(uint64_t a1, BOOL a2, unsigned int a3, BOOL a4, BOOL a5)
{
  void *v10;
  void *v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;

  v10 = RetainConnectionToIAP2Daemon();
  if (v10)
  {
    v11 = v10;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "requestType", "IAPBluetoothDeviceStateUpdate");
    xpc_dictionary_set_uint64(v12, "connectionID", a1);
    xpc_dictionary_set_uint64(v12, "btParmPairStatus", a3);
    xpc_dictionary_set_BOOL(v12, "btParmRadioOn", a2);
    xpc_dictionary_set_BOOL(v12, "btParmPairModeOn", a4);
    xpc_dictionary_set_BOOL(v12, "bParmForceUpdates", a5);
    v13 = (void *)IAPAppSendXPCMessageWithTimeout(v11, v12, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v14 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStateUpdate", v13);
    xpc_release(v12);
    xpc_release(v11);
    return v14;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStateUpdate");
    return 19;
  }
}

uint64_t IAPBluetoothDevicePairingData(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;

  v4 = RetainConnectionToIAP2Daemon();
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPBluetoothDevicePairingData");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_data(v6, "btParmPairData", (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
    v7 = (void *)IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v8 = IAPBluetoothXPCHandleReply("IAPBluetoothDevicePairingData", v7);
    xpc_release(v6);
    xpc_release(v5);
    return v8;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDevicePairingData");
    return 19;
  }
}

uint64_t IAPBluetoothDevicePairingInfoUpdate(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;

  v4 = RetainConnectionToIAP2Daemon();
  if (v4)
  {
    v5 = v4;
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPBluetoothDevicePairingInfoUpdate");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_data(v6, "btParmPairInfo", (const void *)objc_msgSend(a2, "bytes"), objc_msgSend(a2, "length"));
    v7 = (void *)IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v8 = IAPBluetoothXPCHandleReply("IAPBluetoothDevicePairingInfoUpdate", v7);
    xpc_release(v6);
    xpc_release(v5);
    return v8;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDevicePairingInfoUpdate");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceStopBLEUpdates(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;

  v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceStopBLEUpdates");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    v5 = (void *)IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v6 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStopBLEUpdates", v5);
    xpc_release(v4);
    xpc_release(v3);
    return v6;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStopBLEUpdates");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceAccessoryAttach(uint64_t a1, const void *a2, const char *a3, const char *a4, const char *a5, const char *a6, const char *a7, const char *a8)
{
  void *v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  uint64_t v20;

  v16 = RetainConnectionToIAP2Daemon();
  if (v16)
  {
    v17 = v16;
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "requestType", "BTAccessoryAttachNotification");
    xpc_dictionary_set_uint64(v18, "BTAccessoryAttachDeviceId", a1);
    xpc_dictionary_set_data(v18, "BTAccessoryAttachMacAddress", a2, 6uLL);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccModel", a3);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccName", a4);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccMfr", a5);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccSerial", a6);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccFwVersion", a7);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccHwVersion", a8);
    xpc_dictionary_set_BOOL(v18, "BTAccessoryAttachState", 1);
    v19 = (void *)IAPAppSendXPCMessageWithTimeout(v17, v18, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v20 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAccessoryAttach", v19);
    xpc_release(v18);
    xpc_release(v17);
    return v20;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAccessoryAttach");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceAccessoryDetach(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;

  v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "BTAccessoryAttachNotification");
    xpc_dictionary_set_uint64(v4, "BTAccessoryAttachDeviceId", a1);
    xpc_dictionary_set_BOOL(v4, "BTAccessoryAttachState", 0);
    v5 = (void *)IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    v6 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAccessoryDetach", v5);
    xpc_release(v4);
    xpc_release(v3);
    return v6;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAccessoryDetach");
    return 19;
  }
}

void IAPAppRequestAccessoryWiFiCredentials(unsigned int a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  void *v4;
  xpc_object_t v5;
  int v6;

  v6 = 2;
  v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v6);
  if (v2)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1B5E4D838]();
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPRequestAccessoryWiFiCredentials");
    xpc_dictionary_set_uint64(v5, "connectionID", a1);
    xpc_connection_send_message(v3, v5);
    xpc_release(v5);
    objc_autoreleasePoolPop(v4);
    xpc_release(v3);
  }
}

void IAPAppSendDeviceIdentifierNotification(unsigned int a1, const char *a2, const char *a3)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  void *v8;
  xpc_object_t v9;
  int v10;

  v10 = 2;
  v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v10);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1B5E4D838]();
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "kXPCIAPSendDeviceTransportIdentifier");
    xpc_dictionary_set_uint64(v9, "connectionID", a1);
    xpc_dictionary_set_string(v9, "kXPCDeviceBluetoothTransportIdentifierStr", a2);
    xpc_dictionary_set_string(v9, "kXPCDeviceUSBTransportIdentifier", a3);
    xpc_connection_send_message(v7, v9);
    xpc_release(v9);
    objc_autoreleasePoolPop(v8);
    xpc_release(v7);
  }
}

uint64_t IAPGetVehicleStatus(uint64_t a1)
{
  void *v2;
  void *v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v10;
  id v12;
  uint64_t v13;

  NSLog(CFSTR("[#VehicleInfoStatus] IAPGetVehicleStatus called!!! connectionID %u\n"), a1);
  v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPVehicleStatusGetData");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v5)
    {
      NSLog(CFSTR("[#VehicleInfoStatus] %s:%d No reply received for message!"), "IAPGetVehicleStatus", 69);
      v10 = 0;
LABEL_20:
      xpc_release(v4);
      xpc_release(v3);
      return v10;
    }
    v6 = (void *)v5;
    v7 = MEMORY[0x1B5E4DB38]();
    if (v6 == (void *)MEMORY[0x1E0C81260] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#VehicleInfoStatus] IAPGetVehicleInfoData received an XPC_ERROR_CONNECTION_INVALID error.\n"), v13);
    }
    else if (v6 == (void *)MEMORY[0x1E0C81258] && v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#VehicleInfoStatus] IAPGetVehicleInfoData received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"), v13);
    }
    else if (v7 == MEMORY[0x1E0C812F8])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        v12 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        xpc_dictionary_get_value(v6, "IAPVehicleStatusDictionary");
        v10 = _CFXPCCreateCFObjectFromXPCMessage();

        goto LABEL_19;
      }
    }
    else if (v7 == MEMORY[0x1E0C81310])
    {
      NSLog(CFSTR("[#VehicleInfoStatus] %s:%d Unhandled reply error!"), "IAPGetVehicleStatus", 59);
    }
    else
    {
      NSLog(CFSTR("[#VehicleInfoStatus] %s:%d Unknown reply type %p!"), "IAPGetVehicleStatus", 63, v7);
    }
    v10 = 0;
LABEL_19:
    xpc_release(v6);
    goto LABEL_20;
  }
  NSLog(CFSTR("[#VehicleInfoStatus] Skip IAPGetVehicleStatus, no xpc connection, connectionID %u\n"), a1);
  return 0;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x1E0C98850](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1E0CFA908]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

