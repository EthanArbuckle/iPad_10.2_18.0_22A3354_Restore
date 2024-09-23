@implementation BTBannerUISession

- (BTBannerUISession)init
{
  BTBannerUISession *v2;
  BTBannerUISession *v3;
  BTBannerUISession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTBannerUISession;
  v2 = -[BTBannerUISession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__BTBannerUISession_activate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__BTBannerUISession_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_BTBannerUISession <= 50)
  {
    if (gLogCategory_BTBannerUISession != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_activate");
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__BTBannerUISession_invalidate__block_invoke;
  block[3] = &unk_24CEE54F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__BTBannerUISession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _xpc_connection_s *v9;

  v2 = MEMORY[0x2199A7854](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, 3, 0);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v6)
  {
    v9 = v6;
    xpc_connection_cancel(v9);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
}

- (void)_activate
{
  -[BTBannerUISession _xpcStart](self, "_xpcStart");
  if (self->_xpcConnection)
    -[BTBannerUISession _xpcSendMessage](self, "_xpcSendMessage");
}

- (void)_xpcStart
{
  OS_xpc_object *mach_service;
  OS_xpc_object *xpcConnection;
  OS_xpc_object *v5;
  _QWORD handler[5];

  mach_service = xpc_connection_create_mach_service("com.apple.BluetoothUIService", (dispatch_queue_t)self->_dispatchQueue, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = mach_service;

  v5 = self->_xpcConnection;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __30__BTBannerUISession__xpcStart__block_invoke;
  handler[3] = &unk_24CEE5840;
  handler[4] = self;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_activate(self->_xpcConnection);
}

uint64_t __30__BTBannerUISession__xpcStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcEvent:", a2);
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  const char *v5;
  double timeoutSeconds;
  NSString *centerContentText;
  id v8;
  const char *v9;
  NSString *centerContentItemsIcon;
  id v11;
  const char *v12;
  NSString *centerContentItemsText;
  id v14;
  const char *v15;
  NSString *identifier;
  id v17;
  const char *v18;
  NSString *leadingAccessoryImagePath;
  id v20;
  const char *v21;
  NSString *leadingAccessoryImageName;
  id v23;
  const char *v24;
  uint64_t leadingAccessoryImagePID;
  NSString *trailingAccessoryImagePath;
  id v27;
  const char *v28;
  NSString *trailingAccessoryImageName;
  id v30;
  const char *v31;
  NSString *trailingAccessoryText;
  id v33;
  const char *v34;
  int64_t backgroundColor;
  double lowBatteryLevel;
  double batteryLevelInfo;
  uint64_t bannerType;
  NSString *bannerAppID;
  const char *v40;
  xpc_object_t xdict;

  v4 = a3;
  v5 = -[NSString UTF8String](objc_retainAutorelease(self->_label), "UTF8String");
  if (v5)
    xpc_dictionary_set_string(v4, "BUISKeyLabel", v5);
  timeoutSeconds = self->_timeoutSeconds;
  if (timeoutSeconds != 0.0)
    xpc_dictionary_set_double(v4, "BUISKeyBannerTimeout", timeoutSeconds);
  centerContentText = self->_centerContentText;
  v8 = v4;
  v9 = -[NSString UTF8String](objc_retainAutorelease(centerContentText), "UTF8String");
  if (v9)
    xpc_dictionary_set_string(v8, "BUISKeyCCText", v9);

  centerContentItemsIcon = self->_centerContentItemsIcon;
  v11 = v8;
  v12 = -[NSString UTF8String](objc_retainAutorelease(centerContentItemsIcon), "UTF8String");
  if (v12)
    xpc_dictionary_set_string(v11, "BUISKeyCCItemsIcon", v12);

  centerContentItemsText = self->_centerContentItemsText;
  v14 = v11;
  v15 = -[NSString UTF8String](objc_retainAutorelease(centerContentItemsText), "UTF8String");
  if (v15)
    xpc_dictionary_set_string(v14, "BUISKeyCCItemsText", v15);

  identifier = self->_identifier;
  v17 = v14;
  v18 = -[NSString UTF8String](objc_retainAutorelease(identifier), "UTF8String");
  if (v18)
    xpc_dictionary_set_string(v17, "BUISKeyIdentifier", v18);

  leadingAccessoryImagePath = self->_leadingAccessoryImagePath;
  v20 = v17;
  v21 = -[NSString UTF8String](objc_retainAutorelease(leadingAccessoryImagePath), "UTF8String");
  if (v21)
    xpc_dictionary_set_string(v20, "BUISKeyLAImagePath", v21);

  leadingAccessoryImageName = self->_leadingAccessoryImageName;
  v23 = v20;
  v24 = -[NSString UTF8String](objc_retainAutorelease(leadingAccessoryImageName), "UTF8String");
  if (v24)
    xpc_dictionary_set_string(v23, "BUISKeyLAImageName", v24);

  leadingAccessoryImagePID = self->_leadingAccessoryImagePID;
  if ((_DWORD)leadingAccessoryImagePID)
    xpc_dictionary_set_uint64(v23, "BUISKeyLAProductID", leadingAccessoryImagePID);
  trailingAccessoryImagePath = self->_trailingAccessoryImagePath;
  v27 = v23;
  v28 = -[NSString UTF8String](objc_retainAutorelease(trailingAccessoryImagePath), "UTF8String");
  if (v28)
    xpc_dictionary_set_string(v27, "BUISKeyTAImagePath", v28);

  trailingAccessoryImageName = self->_trailingAccessoryImageName;
  v30 = v27;
  v31 = -[NSString UTF8String](objc_retainAutorelease(trailingAccessoryImageName), "UTF8String");
  if (v31)
    xpc_dictionary_set_string(v30, "BUISKeyTAImageName", v31);

  trailingAccessoryText = self->_trailingAccessoryText;
  v33 = v30;
  v34 = -[NSString UTF8String](objc_retainAutorelease(trailingAccessoryText), "UTF8String");
  if (v34)
    xpc_dictionary_set_string(v33, "BUISKeyTAText", v34);

  backgroundColor = self->_backgroundColor;
  if ((_DWORD)backgroundColor)
    xpc_dictionary_set_int64(v33, "BUISKeyBackgroundColor", backgroundColor);
  lowBatteryLevel = self->_lowBatteryLevel;
  if (lowBatteryLevel != 0.0)
    xpc_dictionary_set_double(v33, "BUISKeyLowBatteryLevel", lowBatteryLevel);
  batteryLevelInfo = self->_batteryLevelInfo;
  if (batteryLevelInfo != 0.0)
    xpc_dictionary_set_double(v33, "BUISKeyBatteryLevel", batteryLevelInfo);
  bannerType = self->_bannerType;
  if ((_DWORD)bannerType)
    xpc_dictionary_set_uint64(v33, "BUISKeyBannerType", bannerType);
  bannerAppID = self->_bannerAppID;
  xdict = v33;
  v40 = -[NSString UTF8String](objc_retainAutorelease(bannerAppID), "UTF8String");
  if (v40)
    xpc_dictionary_set_string(xdict, "BUISKeyBannerAppID", v40);

}

- (void)_xpcEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  OS_xpc_object *xpcConnection;
  uint64_t v11;
  void *v12;
  OS_xpc_object *v13;
  _xpc_connection_s *v14;
  OS_xpc_object *v15;
  id v16;

  v16 = a3;
  if (MEMORY[0x2199A79F8]() == MEMORY[0x24BDACFA0])
  {
    -[BTBannerUISession _xpcConnectionMessage:](self, "_xpcConnectionMessage:", v16);
  }
  else if (v16 == (id)MEMORY[0x24BDACF38])
  {
    if (gLogCategory_BTBannerUISession <= 30
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = MEMORY[0x2199A7854](self->_actionHandler);
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 4, 0);

    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

  }
  else if (v16 == (id)MEMORY[0x24BDACF30])
  {
    if (gLogCategory_BTBannerUISession <= 30
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = MEMORY[0x2199A7854](self->_actionHandler);
    v12 = (void *)v11;
    if (v11)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, 3, 0);

    v13 = self->_xpcConnection;
    if (v13)
    {
      v14 = v13;
      xpc_connection_cancel(v14);
      v15 = self->_xpcConnection;
      self->_xpcConnection = 0;

    }
  }
  else
  {
    CUXPCDecodeNSErrorIfNeeded();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      NSErrorF();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    if (gLogCategory_BTBannerUISession <= 90
      && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_xpcSendMessage
{
  xpc_object_t v3;
  OS_xpc_object *xpcConnection;
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (self->_xpcConnection)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "BUISKeyType", "BUISKeyArgType");
    -[BTBannerUISession encodeWithXPCObject:](self, "encodeWithXPCObject:", v3);
    dispatchQueue = self->_dispatchQueue;
    xpcConnection = self->_xpcConnection;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __36__BTBannerUISession__xpcSendMessage__block_invoke;
    handler[3] = &unk_24CEE5840;
    handler[4] = self;
    xpc_connection_send_message_with_reply(xpcConnection, v3, dispatchQueue, handler);

  }
  else if (gLogCategory_BTBannerUISession <= 90
         && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __36__BTBannerUISession__xpcSendMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcCompleted:", a2);
}

- (void)_xpcCompleted:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  CUXPCDecodeNSErrorIfNeeded();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = (id)NSErrorF();
  }
  else
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      if (gLogCategory_BTBannerUISession <= 30
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = MEMORY[0x2199A7854](self->_actionHandler);
      v7 = (void *)v6;
      if (v6)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 4, 0);

    }
    else
    {
      v9 = (id)NSErrorF();
    }

  }
}

- (void)_xpcConnectionMessage:(id)a3
{
  int64_t int64;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  id v15;

  v15 = a3;
  int64 = xpc_dictionary_get_int64(v15, "BUISKeyType");
  switch(int64)
  {
    case 0:
      if (gLogCategory_BTBannerUISession <= 90
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = xpc_dictionary_expects_reply();
      v6 = v15;
      if (v5)
      {
        NSErrorF();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[BTBannerUISession _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v7, v15, 0);

        goto LABEL_17;
      }
      goto LABEL_34;
    case 1:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = MEMORY[0x2199A7854](self->_actionHandler);
      v9 = (void *)v10;
      if (!v10)
        break;
      v11 = *(void (**)(void))(v10 + 16);
      goto LABEL_32;
    case 2:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12 = MEMORY[0x2199A7854](self->_actionHandler);
      v9 = (void *)v12;
      if (!v12)
        break;
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_32;
    case 3:
      if (gLogCategory_BTBannerUISession <= 50
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = MEMORY[0x2199A7854](self->_actionHandler);
      v9 = (void *)v13;
      if (!v13)
        break;
      v11 = *(void (**)(void))(v13 + 16);
LABEL_32:
      v11();
      break;
    default:
LABEL_17:
      if (gLogCategory_BTBannerUISession <= 90
        && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = xpc_dictionary_expects_reply();
      v6 = v15;
      if (!v8)
        goto LABEL_34;
      v14 = int64;
      NSErrorF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTBannerUISession _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v15, v14);
      break;
  }

  v6 = v15;
LABEL_34:

}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v6;
  OS_xpc_object *v7;
  xpc_object_t reply;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_xpcConnection;
  if (v7)
  {
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError();
      xpc_connection_send_message(v7, reply);
    }
    else if (gLogCategory_BTBannerUISession <= 90
           && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_BTBannerUISession <= 90
         && (gLogCategory_BTBannerUISession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int)a3
{
  self->_backgroundColor = a3;
}

- (NSString)bannerAppID
{
  return self->_bannerAppID;
}

- (void)setBannerAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)bannerType
{
  return self->_bannerType;
}

- (void)setBannerType:(unsigned int)a3
{
  self->_bannerType = a3;
}

- (NSString)centerContentText
{
  return self->_centerContentText;
}

- (void)setCenterContentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)centerContentItemsIcon
{
  return self->_centerContentItemsIcon;
}

- (void)setCenterContentItemsIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)centerContentItemsText
{
  return self->_centerContentItemsText;
}

- (void)setCenterContentItemsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)leadingAccessoryImageName
{
  return self->_leadingAccessoryImageName;
}

- (void)setLeadingAccessoryImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)leadingAccessoryImagePath
{
  return self->_leadingAccessoryImagePath;
}

- (void)setLeadingAccessoryImagePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unsigned)leadingAccessoryImagePID
{
  return self->_leadingAccessoryImagePID;
}

- (void)setLeadingAccessoryImagePID:(unsigned int)a3
{
  self->_leadingAccessoryImagePID = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSString)trailingAccessoryImageName
{
  return self->_trailingAccessoryImageName;
}

- (void)setTrailingAccessoryImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)trailingAccessoryImagePath
{
  return self->_trailingAccessoryImagePath;
}

- (void)setTrailingAccessoryImagePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)trailingAccessoryText
{
  return self->_trailingAccessoryText;
}

- (void)setTrailingAccessoryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)lowBatteryLevel
{
  return self->_lowBatteryLevel;
}

- (void)setLowBatteryLevel:(double)a3
{
  self->_lowBatteryLevel = a3;
}

- (double)batteryLevelInfo
{
  return self->_batteryLevelInfo;
}

- (void)setBatteryLevelInfo:(double)a3
{
  self->_batteryLevelInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessoryText, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryImagePath, 0);
  objc_storeStrong((id *)&self->_trailingAccessoryImageName, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryImagePath, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryImageName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_centerContentItemsText, 0);
  objc_storeStrong((id *)&self->_centerContentItemsIcon, 0);
  objc_storeStrong((id *)&self->_centerContentText, 0);
  objc_storeStrong((id *)&self->_bannerAppID, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
