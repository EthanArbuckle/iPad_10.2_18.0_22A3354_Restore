@implementation CMIOExtensionClient

+ (id)clientInfoWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v13;
  id v14;
  __int128 v15;
  _OWORD v17[2];

  v8 = a8;
  v9 = a7;
  v13 = *(_QWORD *)&a3;
  v14 = objc_alloc((Class)objc_opt_class());
  v15 = *(_OWORD *)&a5->var0[4];
  v17[0] = *(_OWORD *)a5->var0;
  v17[1] = v15;
  return (id)objc_msgSend(v14, "initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:", v13, a4, v17, a6, v9, v8);
}

- (CMIOExtensionClient)initWithPID:(int)a3 clientID:(id)a4 auditToken:(id *)a5 stAttribution:(id)a6 isToProxy:(BOOL)a7 isFromProxyExtensionManager:(BOOL)a8
{
  CMIOExtensionClient *v13;
  CMIOExtensionClient *v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CMIOExtensionClient;
  v13 = -[CMIOExtensionClient init](&v17, sel_init, *(_QWORD *)&a3, a4, a5, a6);
  v14 = v13;
  if (v13)
  {
    v13->_pid = a3;
    v13->_clientID = (NSUUID *)objc_msgSend(a4, "copy");
    v14->_signingID = 0;
    v15 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)v14->_auditToken.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&v14->_auditToken.val[4] = v15;
    v14->_isToProxy = a7;
    v14->_isFromProxyExtensionManager = a8;
    v14->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionClient: pid %d, clientID %@>"), v14->_pid, v14->_clientID);
    v14->_redactedDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("<CMIOExtensionClient: pid -, clientID ->"));
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIOExtensionClient;
  -[CMIOExtensionClient dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return self->_description;
}

- (id)redactedDescription
{
  return self->_redactedDescription;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isToProxy
{
  return self->_isToProxy;
}

- (BOOL)isFromProxyExtensionManager
{
  return self->_isFromProxyExtensionManager;
}

- (int64_t)microphoneAuthorizationStatus
{
  return self->_microphoneAuthorizationStatus;
}

- (void)setMicrophoneAuthorizationStatus:(int64_t)a3
{
  self->_microphoneAuthorizationStatus = a3;
}

- (int64_t)cameraAuthorizationStatus
{
  return self->_cameraAuthorizationStatus;
}

- (void)setCameraAuthorizationStatus:(int64_t)a3
{
  self->_cameraAuthorizationStatus = a3;
}

- (BOOL)hasPendingMicrophoneAuthorizationRequest
{
  return self->_hasPendingMicrophoneAuthorizationRequest;
}

- (void)setHasPendingMicrophoneAuthorizationRequest:(BOOL)a3
{
  self->_hasPendingMicrophoneAuthorizationRequest = a3;
}

- (BOOL)hasPendingCameraAuthorizationRequest
{
  return self->_hasPendingCameraAuthorizationRequest;
}

- (void)setHasPendingCameraAuthorizationRequest:(BOOL)a3
{
  self->_hasPendingCameraAuthorizationRequest = a3;
}

- (BOOL)isEqual:(id)a3
{
  NSUUID *clientID;
  int v6;
  NSString *signingID;
  int pid;
  int isToProxy;
  int isFromProxyExtensionManager;
  uint64_t v15;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  if (a3)
    objc_msgSend(a3, "auditToken");
  clientID = self->_clientID;
  if (clientID == (NSUUID *)objc_msgSend(a3, "clientID", 0)
    || (v6 = -[NSUUID isEqual:](self->_clientID, "isEqual:", objc_msgSend(a3, "clientID"))) != 0)
  {
    signingID = self->_signingID;
    if (signingID == (NSString *)objc_msgSend(a3, "signingID")
      || (v6 = -[NSString isEqual:](self->_signingID, "isEqual:", objc_msgSend(a3, "signingID"))) != 0)
    {
      if (*(_QWORD *)self->_auditToken.val == v15
        && *(_QWORD *)&self->_auditToken.val[2] == 0
        && *(_QWORD *)&self->_auditToken.val[4] == 0
        && *(_QWORD *)&self->_auditToken.val[6] == 0)
      {
        pid = self->_pid;
        if (pid == objc_msgSend(a3, "pid"))
        {
          isToProxy = self->_isToProxy;
          if (isToProxy == objc_msgSend(a3, "isToProxy"))
          {
            isFromProxyExtensionManager = self->_isFromProxyExtensionManager;
            LOBYTE(v6) = isFromProxyExtensionManager == objc_msgSend(a3, "isFromProxyExtensionManager");
            return v6;
          }
        }
      }
LABEL_23:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_clientID, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMIOExtensionClient *v4;
  uint64_t pid;
  NSUUID *clientID;
  STActivityAttribution *stAttribution;
  _BOOL8 isToProxy;
  _BOOL8 isFromProxyExtensionManager;
  __int128 v10;
  _OWORD v12[2];

  v4 = +[CMIOExtensionClient allocWithZone:](CMIOExtensionClient, "allocWithZone:", a3);
  pid = self->_pid;
  clientID = self->_clientID;
  stAttribution = self->_stAttribution;
  isToProxy = self->_isToProxy;
  isFromProxyExtensionManager = self->_isFromProxyExtensionManager;
  v10 = *(_OWORD *)&self->_auditToken.val[4];
  v12[0] = *(_OWORD *)self->_auditToken.val;
  v12[1] = v10;
  return -[CMIOExtensionClient initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:](v4, "initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:", pid, clientID, v12, stAttribution, isToProxy, isFromProxyExtensionManager);
}

- (id)copyXPCDictionary
{
  xpc_object_t v3;
  NSObject *v4;
  NSString *signingID;
  NSObject *v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "pid", self->_pid);
  if (cmio_XPCMessageSetCFString(v3, "clientID", -[NSUUID UUIDString](self->_clientID, "UUIDString")))
  {
    v4 = CMIOLog();
    if (v4)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[CMIOExtensionClient copyXPCDictionary].cold.2();
    }
  }
  signingID = self->_signingID;
  if (signingID)
  {
    if (cmio_XPCMessageSetCFString(v3, "signingID", signingID))
    {
      v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionClient copyXPCDictionary].cold.1();
      }
    }
  }
  return v3;
}

- (CMIOExtensionClient)initWithXPCDictionary:(id)a3
{
  uint64_t uint64;
  NSObject *v6;
  id v7;
  id v8;
  CMIOExtensionClient *v9;
  NSObject *v10;
  _OWORD v12[2];
  CFTypeRef cf;

  if (a3)
  {
    uint64 = xpc_dictionary_get_uint64(a3, "pid");
    cf = 0;
    if (cmio_XPCMessageCopyCFString(a3, "clientID", (NSObject **)&cf))
    {
      v6 = CMIOLog();
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          -[CMIOExtensionClient initWithXPCDictionary:].cold.2();
      }
    }
    if (cf)
    {
      v7 = objc_alloc(MEMORY[0x24BDD1880]);
      v8 = (id)objc_msgSend(v7, "initWithUUIDString:", cf);
      CFRelease(cf);
    }
    else
    {
      v8 = objc_alloc_init(MEMORY[0x24BDD1880]);
    }
    memset(v12, 0, sizeof(v12));
    v9 = -[CMIOExtensionClient initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:](self, "initWithPID:clientID:auditToken:stAttribution:isToProxy:isFromProxyExtensionManager:", uint64, v8, v12, 0, 1, 0);
    if (!v9->_signingID)
    {
      *(_QWORD *)&v12[0] = 0;
      if (cmio_XPCMessageCopyCFString(a3, "signingID", (NSObject **)v12))
      {
        v10 = CMIOLog();
        if (v10)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[CMIOExtensionClient initWithXPCDictionary:].cold.1();
        }
      }
      if (*(_QWORD *)&v12[0])
        v9->_signingID = *(NSString **)&v12[0];
    }
    -[CMIOExtensionClient setMicrophoneAuthorizationStatus:](v9, "setMicrophoneAuthorizationStatus:", 3);
    -[CMIOExtensionClient setCameraAuthorizationStatus:](v9, "setCameraAuthorizationStatus:", 3);

  }
  else
  {

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("nil xpc dictionary"));
    return 0;
  }
  return v9;
}

- (int64_t)authorizationStatusForMediaType:(unsigned int)a3
{
  int64_t result;
  __int128 v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  int pid;
  uint64_t v12;
  _BYTE v13[34];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1936684398)
  {
    result = self->_microphoneAuthorizationStatus;
    if (result)
      return result;
  }
  else
  {
    result = self->_cameraAuthorizationStatus;
    if (result)
      return result;
  }
  v6 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v13 = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v13[16] = v6;
  v7 = TCCAccessPreflightWithAuditToken();
  v8 = CMIOLog();
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
      pid = self->_pid;
      *(_DWORD *)v13 = 136316163;
      *(_QWORD *)&v13[4] = v10;
      *(_WORD *)&v13[12] = 1024;
      *(_DWORD *)&v13[14] = 2584;
      *(_WORD *)&v13[18] = 2080;
      *(_QWORD *)&v13[20] = "-[CMIOExtensionClient authorizationStatusForMediaType:]";
      *(_WORD *)&v13[28] = 1024;
      *(_DWORD *)&v13[30] = v7;
      v14 = 1025;
      v15 = pid;
      _os_log_impl(&dword_2330C2000, v9, OS_LOG_TYPE_INFO, "%s:%d:%s TCC preflight access returned %d for pid %{private}d", v13, 0x28u);
    }
  }
  if (v7)
  {
    if (v7 == 1)
    {
      if (TCCAccessRestricted())
        result = 1;
      else
        result = 2;
    }
    else
    {
      result = v7 == 2 && TCCAccessRestricted() != 0;
    }
  }
  else
  {
    result = 3;
  }
  v12 = 64;
  if (a3 == 1936684398)
    v12 = 56;
  *(Class *)((char *)&self->super.isa + v12) = (Class)result;
  return result;
}

- (void)requestAccessForMediaType:(unsigned int)a3 reply:(id)a4
{
  -[CMIOExtensionClient requestAccessForMediaType:performPreFlightTest:reply:](self, "requestAccessForMediaType:performPreFlightTest:reply:", *(_QWORD *)&a3, 1, a4);
}

- (void)requestAccessForMediaType:(unsigned int)a3 performPreFlightTest:(BOOL)a4 reply:(id)a5
{
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  int pid;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  NSObject *global_queue;
  _QWORD v19[7];
  __int128 v20;
  __int128 v21;
  int v22;
  unsigned int v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (a4
    && (v8 = -[CMIOExtensionClient authorizationStatusForMediaType:](self, "authorizationStatusForMediaType:", *(_QWORD *)&a3)) != 0)
  {
    v9 = v8;
    v10 = CMIOLog();
    if (v10)
    {
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
        pid = self->_pid;
        *(_DWORD *)buf = 136317187;
        v25 = v12;
        v26 = 1024;
        v27 = 2617;
        v28 = 2080;
        v29 = "-[CMIOExtensionClient requestAccessForMediaType:performPreFlightTest:reply:]";
        v30 = 1025;
        v31 = pid;
        v32 = 1024;
        v33 = HIBYTE(a3);
        v34 = 1024;
        v35 = BYTE2(a3);
        v36 = 1024;
        v37 = BYTE1(a3);
        v38 = 1024;
        v39 = a3;
        v40 = 1024;
        v41 = v9;
        _os_log_impl(&dword_2330C2000, v11, OS_LOG_TYPE_INFO, "%s:%d:%s authorizationStatus status for pid %{private}d type %c%c%c%c status %d", buf, 0x40u);
      }
    }
    (*((void (**)(id, int64_t))a5 + 2))(a5, v9);
  }
  else
  {
    v14 = self->_pid;
    v15 = 72;
    v16 = (uint64_t *)MEMORY[0x24BEB38C0];
    if (a3 != 1936684398)
    {
      v15 = 73;
      v16 = (uint64_t *)MEMORY[0x24BEB3848];
    }
    v17 = *v16;
    *((_BYTE *)&self->super.isa + v15) = 1;
    global_queue = dispatch_get_global_queue(17, 0);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __76__CMIOExtensionClient_requestAccessForMediaType_performPreFlightTest_reply___block_invoke;
    v19[3] = &unk_250457E30;
    v19[5] = a5;
    v19[6] = v17;
    v20 = *(_OWORD *)self->_auditToken.val;
    v21 = *(_OWORD *)&self->_auditToken.val[4];
    v22 = v14;
    v23 = a3;
    v19[4] = self;
    dispatch_async(global_queue, v19);
  }
}

uint64_t __76__CMIOExtensionClient_requestAccessForMediaType_performPreFlightTest_reply___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2;
  __int128 v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  int v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[34];
  __int16 v16;
  int v17;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  keys[0] = *(void **)MEMORY[0x24BEB3808];
  values = (void *)*MEMORY[0x24BDBD270];
  v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v15 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v15[16] = v3;
  v4 = TCCAccessCheckAuditToken();
  if (v4)
  {
    v5 = 3;
  }
  else if (TCCAccessRestricted())
  {
    v5 = 1;
  }
  else
  {
    v5 = 2;
  }
  v6 = CMIOLog();
  if (v6)
  {
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
      v9 = *(_DWORD *)(a1 + 88);
      *(_DWORD *)v15 = 136316163;
      if (v4)
        v10 = 89;
      else
        v10 = 78;
      *(_QWORD *)&v15[4] = v8;
      *(_WORD *)&v15[12] = 1024;
      *(_DWORD *)&v15[14] = 2643;
      *(_WORD *)&v15[18] = 2080;
      *(_QWORD *)&v15[20] = "-[CMIOExtensionClient requestAccessForMediaType:performPreFlightTest:reply:]_block_invoke";
      *(_WORD *)&v15[28] = 1024;
      *(_DWORD *)&v15[30] = v10;
      v16 = 1025;
      v17 = v9;
      _os_log_impl(&dword_2330C2000, v7, OS_LOG_TYPE_INFO, "%s:%d:%s TCC access returned %c for pid %{private}d", v15, 0x28u);
    }
  }
  CFRelease(v2);
  v11 = *(_DWORD *)(a1 + 92) == 1936684398;
  v12 = 64;
  if (*(_DWORD *)(a1 + 92) == 1936684398)
    v12 = 56;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + v12) = v5;
  if (v11)
    v13 = 72;
  else
    v13 = 73;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + v13) = 0;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

- (NSUUID)clientID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)signingID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (pid_t)pid
{
  return self->_pid;
}

- (void)copyXPCDictionary
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, invalid clientID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, invalid signingID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithXPCDictionary:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  CMIOFilename("/Library/Caches/com.apple.xbs/Sources/CoreMediaIO/Sources/Extensions/Sources/CMIOExtensionProperties.m");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_2330C2000, v0, v1, "%s:%d:%s Error: %ld, invalid clientID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
